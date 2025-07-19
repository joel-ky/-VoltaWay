from io import BytesIO
import math
from django.db import connection
from django.http import HttpResponse, JsonResponse
from django.shortcuts import get_object_or_404, render

# Create your views here.
from django.shortcuts import render,redirect
from django.contrib import messages
from django.contrib.auth import authenticate
from django.contrib.auth import logout
from django.urls import reverse
import qrcode
from charger_app.models import *
# Create your views here.
def index(request):
    return render(request,'index.html')
def User_registration(request):
    return render(request,'User_registration.html')
def sign_in(request):
    return render(request,'signin.html')
def sign_in_process(request):
    u=request.POST.get("username")
    p=request.POST.get("password")
    obj=authenticate(username=u,password=p)
    if obj is not None:
        if obj.is_superuser == 1:
            request.session['aname'] = u
            request.session['slogid'] = obj.id
            return redirect('/admin_home/')
        else:
          messages.add_message(request, messages.INFO, 'Invalid User.')
          return redirect('/index/')
    else:
        newp=p
        try:
            obj1=login.objects.get(username=u,password=newp)

            if obj1.Usertype=="Customer":
                if(obj1.status=="Approved"):
                    request.session['uname'] = u
                    request.session['slogid'] = obj1.login_id
                    return redirect('/customer_home/')
                elif(obj1.status=="Not Approved"):
                  messages.add_message(request, messages.INFO, 'Waiting For Approval.')
                  return redirect('/index/')
                else:
                  messages.add_message(request, messages.INFO, 'Invalid User.')
                  return redirect('/index/')
          

            else:
                 messages.add_message(request, messages.INFO, 'Invalid User.')
                 return redirect('/index/')
        except login.DoesNotExist:
         messages.add_message(request, messages.INFO, 'Invalid User.')
         return redirect('/index/')
def admin_home(request):
    if 'aname' in request.session:
     return render(request,'Master/index.html')
    else:
      return redirect('/index/')
def customer_home(request):
    if 'uname' in request.session:
     return render(request,'Customer/index.html')
    else:
      return redirect('/index/')
def admin_logout(request):
    logout(request)
    request.session.delete()
    return redirect('/index/')
def user_logout(request):
    logout(request)
    request.session.delete()
    return redirect('/index/')
def customer_action(request):
    username=request.POST.get("username")
    password=request.POST.get("password")
    data = {
       'username_exists':      login.objects.filter(username=username).exists(),
        'error':"Username Already Exist"
    }
    if(data["username_exists"]==False):
        tbl1=login()
        username=request.POST.get("username")
        tbl1.username=request.POST.get("username")
        password=request.POST.get("password")
        tbl1.password=request.POST.get("password")
        tbl1.Usertype="Customer"
        tbl1.status="Approved"
        tbl1.save()
        obj=login.objects.get(username=username,password=password)

        u=Customer()
        u.login_id = obj.login_id
        u.customer_name=request.POST.get("customer_name")
    
        u.phone_number =request.POST.get("phone")
        u.Email=request.POST.get("Email")
        u.Address=request.POST.get("address")
        u.place=request.POST.get("place")

        u.save()
        messages.add_message(request, messages.INFO, 'Registered successfully.')
        return redirect('/User_registration/')
    else:
        messages.add_message(request, messages.INFO, 'Username already exist.. Try Again.')
        return redirect('/User_registration/')

def display_district(request):
    state_id = request.GET.get("state_id")
    try:

        dist = district.objects.filter(state_id = state_id)
    except Exception:
        data=[]
        data['error_message'] = 'error'
        return JsonResponse(data)
    return JsonResponse(list(dist.values('district_id', 'district')), safe = False)
def display_place(request):
    district_id = request.GET.get("district_id")
    try:

        dist = charging_station.objects.filter(district_id = district_id)
    except Exception:
        data=[]
        data['error_message'] = 'error'
        return JsonResponse(data)
    return JsonResponse(list(dist.values('place', 'place')), safe = False)
def check_username(request):
    username = request.GET.get("username")
    data = {
       'username_exists':      login.objects.filter(username=username).exists(),
        'error':"Username Already Exist"
    }
    if(data["username_exists"]==False):
        data["success"]="Available"

    return JsonResponse(data)
def add_station(request):
 if 'aname' in request.session:
     data1 = state.objects.all()
     return render(request,'Master/add_station.html',{'data':data1})
 else:
      return redirect('/index/')
def save_station(request):
    if 'aname' in request.session:
        d=request.POST.get("district")
        p=request.POST.get("place")
        data = {
       'check':  charging_station.objects.filter(district_id=d,place=p).exists(),
        'error':"Already Exist"
            }
        if(data["check"]==False):
                tbl=charging_station()
                tbl.district_id=request.POST.get("district")
                tbl.place=request.POST.get("place")
                tbl.longitude=request.POST.get("longitude")
                tbl.latitude=request.POST.get("latitude")
                tbl.save()
                messages.add_message(request, messages.INFO, 'Added successfully.')
                return redirect('/add_station/')
        else:
            messages.add_message(request, messages.INFO, 'This place is already added')
            return redirect('/customer_home/')
    else:
        return redirect('/index/')
def station_list(request):
   if 'aname' in request.session:
        cursor=connection.cursor()
        cursor.execute("select p.*,s.state,d.district from  tbl_charging_station as p inner join   tbl_district as d on p.district_id =d.district_id inner join tbl_state as s on d.state_id=s.state_id")
        data=cursor.fetchall()
        return render(request,'Master/station_list.html',{'data':data})
   else:
       return redirect('/index/')
def ad_map(request,id):
    if 'aname' in request.session:
        data1 = charging_station.objects.get(station_id=id)
        return render(request,'Master/google_map.html',{'data1':data1})
    else:
      return redirect('/index/')
def edit_station(request,id):
 if 'aname' in request.session:
    data=charging_station.objects.get(station_id=id)
    return render(request,'Master/edit_station.html',{'data':data})
 else:
      return redirect('/index/')
def update_station(request,id):
 if 'aname' in request.session:
        tbl=charging_station.objects.get(station_id=id)
        tbl.place=request.POST.get("place")
        tbl.longitude=request.POST.get("longitude")
        tbl.latitude=request.POST.get("latitude")
        tbl.save()
        messages.add_message(request, messages.INFO, 'Updated successfully.')
        return redirect('/station_list')
 else:
      return redirect('/index/')
def delete_station(request,id):
 if 'aname' in request.session:
    tbl=charging_station.objects.get(station_id=id)
    tbl.delete()
    messages.add_message(request, messages.INFO, 'Deleted successfully.')
    return redirect('/station_list')
 else:
      return redirect('/index/')
 

def user_search(request):
 if 'uname' in request.session:
     data1 = state.objects.all()
     return render(request,'Customer/search_station.html',{'data':data1})
 else:
      return redirect('/index/')
def display_station(request,id):
 if 'uname' in request.session:
        search=id
        if search==1:
            place=request.POST.get("place")
            cursor=connection.cursor()
            cursor.execute("select p.*,s.state,d.district from  tbl_charging_station as p inner join   tbl_district as d on p.district_id =d.district_id inner join tbl_state as s on d.state_id=s.state_id where p.place='"+str(place)+"'")
          
            data=cursor.fetchall()
            return render(request,'Customer/search_result.html',{'data':data,'search':search})
        elif search==2:
            li=[]
            likm={}
            user_latitude=float(request.POST.get("user_latitude"))
            user_longitude=float(request.POST.get("user_longitude"))
            all_stations=charging_station.objects.all()
            for i in all_stations:
                station_id=i.station_id
                longitude=float(i.longitude)
                latitude=float(i.latitude)
                origin = (user_latitude, user_longitude) 
                destination = (latitude, longitude) 
                d=distance(origin,destination)
                if d<=10:
                    li.append(i.station_id)
                    likm[station_id]=d
            resultString = ','.join(map(str, li))
            if resultString!="":
                cursor=connection.cursor()
                cursor.execute("select p.*,s.state,d.district from  tbl_charging_station as p inner join   tbl_district as d on p.district_id =d.district_id inner join tbl_state as s on d.state_id=s.state_id where p.station_id in ("+str(resultString)+")")

                data=cursor.fetchall()
                return render(request,'Customer/search_result.html',{'data':data,'search':search,'likm':likm})
            else:
                return render(request,'Customer/search_result.html')
        elif search==3:
            li=[]
            likm={}
            user_latitude=float(request.POST.get("latitude"))
            user_longitude=float(request.POST.get("longitude"))
            all_stations=charging_station.objects.all()
            for i in all_stations:
                station_id=i.station_id
                longitude=float(i.longitude)
                latitude=float(i.latitude)
                origin = (user_latitude, user_longitude) 
                destination = (latitude, longitude) 
                d=distance(origin,destination)
                if d<=10:
                    li.append(i.station_id)
                    likm[station_id]=d
            resultString = ','.join(map(str, li))
            if resultString!="":
                cursor=connection.cursor()
                cursor.execute("select p.*,s.state,d.district from  tbl_charging_station as p inner join   tbl_district as d on p.district_id =d.district_id inner join tbl_state as s on d.state_id=s.state_id where p.station_id in ("+str(resultString)+")")

                data=cursor.fetchall()
                return render(request,'Customer/search_result.html',{'data':data,'search':search,'likm':likm})
            else:
                return render(request,'Customer/search_result.html')
        
 else:
      return redirect('/index/')
 
def user_map(request,id):
    if 'uname' in request.session:
        data1 = charging_station.objects.get(station_id=id)
        return render(request,'Customer/google_map.html',{'data1':data1})
    else:
      return redirect('/index/')
    


def distance(origin, destination):
    """
    Calculate the Haversine distance.

    Parameters
    ----------
    origin : tuple of float
        (lat, long)
    destination : tuple of float
        (lat, long)

    Returns
    -------
    distance_in_km : float

    Examples
    --------
    >>> origin = (48.1372, 11.5756)  # Munich
    >>> destination = (52.5186, 13.4083)  # Berlin
    >>> round(distance(origin, destination), 1)
    504.2
    """
    lat1, lon1 = origin
    lat2, lon2 = destination
    radius = 6371  # km

    dlat = math.radians(lat2 - lat1)
    dlon = math.radians(lon2 - lon1)
    a = (math.sin(dlat / 2) * math.sin(dlat / 2) +
         math.cos(math.radians(lat1)) * math.cos(math.radians(lat2)) *
         math.sin(dlon / 2) * math.sin(dlon / 2))
    c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a))
    d = radius * c

    return d

def Complaint_frm(request):
    if 'uname' in request.session:
        logid=request.session['slogid']
        data1 = complaint.objects.filter(user_login_id=logid)
        return render(request,'Customer/complaint.html',{'data1':data1})
    else:
       return redirect('/index/')
def save_complaint(request):
    if 'uname' in request.session:
        tbl=complaint()
        tbl.user_login_id=request.session['slogid']
        tbl.complaint_subject=request.POST.get("subject")
        tbl.complaint=request.POST.get("complaint")
        tbl.reply="No"
        tbl.save()
        messages.add_message(request, messages.INFO, 'Added successfully.')
        return redirect('/complaint')
    else:
       return redirect('/index/')

def delete_complaint(request,id):
    if 'uname' in request.session:
        tbl=complaint.objects.get(complaint_id=id)
        tbl.delete()
        messages.add_message(request, messages.INFO, 'Deleted successfully.')
        return redirect('/complaint')
    else:
       return redirect('/index/')


def enquiry_frm(request):
    if 'uname' in request.session:
        logid=request.session['slogid']
        data1 = enquiry.objects.filter(user_login_id=logid)
        return render(request,'Customer/enquiry.html',{'data1':data1})
    else:
       return redirect('/index/')
def save_enquiry(request):
    if 'uname' in request.session:
        tbl=enquiry()
        tbl.user_login_id=request.session['slogid']
        tbl.enquiry_subject=request.POST.get("subject")
        tbl.enquiry=request.POST.get("enquiry")
        tbl.reply="No"
        tbl.save()
        messages.add_message(request, messages.INFO, 'Added successfully.')
        return redirect('/enquiry')
    else:
       return redirect('/index/')

def delete_enquiry(request,id):
    if 'uname' in request.session:
        tbl=enquiry.objects.get(enquiry_id=id)
        tbl.delete()
        messages.add_message(request, messages.INFO, 'Deleted successfully.')
        return redirect('/enquiry')
    else:
       return redirect('/index/')

    # ----------------Admin Complaint -------------
def view_complaints(request):
    if 'aname' in request.session:
        cursor=connection.cursor()
        cursor.execute("select c.*,u.* from  tbl_complaint  as c inner join  tbl_customer as u  on c.user_login_id =u.login_id where c.reply='No'  order by c.complaint_id desc")
        data=cursor.fetchall()
        return render(request,'Master/view_complaints.html',{'data':data})
    else:
       return redirect('/index/')
def replied_list(request):
    if 'aname' in request.session:
        cursor=connection.cursor()
        cursor.execute("select c.*,u.* from  tbl_complaint  as c inner join  tbl_customer as u  on c.user_login_id =u.login_id where c.reply!='No' order by c.complaint_id desc")
        data=cursor.fetchall()
        return render(request,'Master/replied_complaints.html',{'data':data})
    else:
       return redirect('/index/')
def adm_reply_complaint(request,id):
    if 'aname' in request.session:

        return render(request,'Master/reply_complaint.html',{'id':id})
    else:
       return redirect('/index/')
def add_reply(request,id):
    tbl=complaint.objects.get(complaint_id=id)
    tbl.reply=request.POST.get("reply")
    tbl.save()
    return redirect('/replied_list')


# Admin Enquiry

def view_enquiry(request):
    if 'aname' in request.session:
        cursor=connection.cursor()
        cursor.execute("select c.*,u.* from  tbl_enquiry  as c inner join  tbl_customer as u  on c.user_login_id =u.login_id where c.reply='No'  order by c.enquiry_id desc")
        data=cursor.fetchall()
        return render(request,'Master/view_enquiry.html',{'data':data})
    else:
       return redirect('/index/')
def enquiry_replied_list(request):
    if 'aname' in request.session:
        cursor=connection.cursor()
        cursor.execute("select c.*,u.* from  tbl_enquiry  as c inner join  tbl_customer as u  on c.user_login_id =u.login_id where c.reply!='No' order by c.enquiry_id desc")
        data=cursor.fetchall()
        return render(request,'Master/replied_enquiry.html',{'data':data})
    else:
       return redirect('/index/')
def adm_reply_enquiry(request,id):
    if 'aname' in request.session:

        return render(request,'Master/reply_enquiry.html',{'id':id})
    else:
       return redirect('/index/')
def add_reply_enquiry(request,id):
    tbl=enquiry.objects.get(enquiry_id=id)
    tbl.reply=request.POST.get("reply")
    tbl.save()
    return redirect('/enquiry_replied_list')

def Users_list(request):
 if 'aname' in request.session:
     data1 = Customer.objects.all()
     return render(request,'Master/Users_list.html',{'data':data1})
 else:
      return redirect('/index/')
 
def book(request,id):
    if 'uname' in request.session:

        return render(request,'Customer/book.html',{'id':id})
    else:
       return redirect('/index/')
def save_book(request,id):
        if 'uname' in request.session:
            logid= request.session['slogid']
            tbl=charger_station_booking()
            date=request.POST.get("start_date")
            time1=request.POST.get("start_time")
            time2=request.POST.get("end_time")
            date1=date+" "+time1
            date2=date+" "+time2

            cursor=connection.cursor()
            cursor.execute("select * from  tbl_booking   where start_date_time between '"+str(date1)+"'  and '"+str(date2)+"' and end_date_time between '"+str(date1)+"' and '"+str(date2)+"' and station_id="+str(id))
            data=cursor.fetchall()
            if data:
                messages.add_message(request, messages.INFO, 'Booking Failed. Not Available')
                return redirect('/user_search/')
            else:
                tbl.start_date_time=date1
                tbl.end_date_time=date2
                
                tbl.user_login_id=logid
                tbl.status="Booked"
                tbl.station_id=id
                tbl.save()
                messages.add_message(request, messages.INFO, 'Booked successfully.')
                return redirect('/user_search/')
               
        else:
            return redirect('/index/')
def user_booking(request):
    if 'uname' in request.session:
        logid= request.session['slogid']
        cursor=connection.cursor()
        cursor.execute("select b.*,c.*, d.district,s.state from  tbl_booking  as b inner join  tbl_charging_station as c  on c.station_id = b.station_id inner join tbl_district as d on d.district_id=c.district_id inner join tbl_state as s on d.state_id=s.state_id  where  b.user_login_id = "+str(logid))
        data=cursor.fetchall()
        return render(request,'Customer/booking_list.html',{'data':data})
    else:
       return redirect('/index/')
def add_booking_amount(request):
 if 'aname' in request.session:
     data1 = fee.objects.all()
     return render(request,'Master/fee.html',{'data':data1})
 else:
      return redirect('/index/')
def save_fee(request):
    d = fee.objects.all()
    if d:
        messages.add_message(request, messages.INFO, ' Already Exist. Please Edit')
        return redirect('/add_booking_amount/')
    else:
        tbl=fee()
        tbl.fee=request.POST.get("fee")
        tbl.save()
        messages.add_message(request, messages.INFO, 'Added successfully.')
        return redirect('/add_booking_amount/')
def edit_fee(request,id):
 if 'aname' in request.session:
     data1 = fee.objects.get(fee_id=id)
     return render(request,'Master/edit_fee.html',{'data':data1})
 else:
      return redirect('/index/')
def update_fee(request,id):
 if 'aname' in request.session:
    tbl = fee.objects.get(fee_id=id)
    tbl.fee=request.POST.get("fee")
    tbl.save()
    messages.add_message(request, messages.INFO, 'Updated successfully.')
    return redirect('/add_booking_amount/')
 else:
      return redirect('/index/')
def payment(request,id):
 if 'uname' in request.session:
     data1 = fee.objects.all()
     fees=0
     for i in data1:
         
        fees=i.fee
     return render(request,'Customer/payment.html',{'fee':fees,'id':id})
 else:
      return redirect('/index/') 
def pay_action(request,id):
    if 'uname' in request.session:
        tbl = charger_station_booking.objects.get(booking_id=id)
        tbl.status="Paid"
        tbl.save()
        messages.add_message(request, messages.INFO, 'Paid successfully.')
        return redirect('/user_booking/')
    else:
        return redirect('/index/')
def booking_details(request):
    if 'aname' in request.session:
     
        cursor=connection.cursor()
        cursor.execute("select b.*,c.*, d.district,s.state,u.* from  tbl_booking  as b inner join  tbl_charging_station as c  on c.station_id = b.station_id inner join tbl_district as d on d.district_id=c.district_id inner join tbl_state as s on d.state_id=s.state_id inner join tbl_customer as u on u.login_id=b.user_login_id  where  b.status = 'Paid'")
        data=cursor.fetchall()
        return render(request,'Master/booking_list.html',{'data':data})
    else:
       return redirect('/index/')
def profile(request):
 if 'uname' in request.session:
     logid= request.session['slogid']
     data1 = Customer.objects.get(login_id=logid)
     return render(request,'Customer/profile.html',{'data':data1})
 else:
      return redirect('/index/')
def save_profile(request):
    if 'uname' in request.session:
        logid= request.session['slogid']
        u=Customer.objects.get(login_id=logid)
        
        u.customer_name=request.POST.get("customer_name")

        u.phone_number =request.POST.get("phone")
        u.Email=request.POST.get("Email")
        u.Address=request.POST.get("address")
        u.place=request.POST.get("place")

        u.save()
        messages.add_message(request, messages.INFO, 'Updated successfully.')
        return redirect('/profile/')
    else:
      return redirect('/index/')
def change_password(request):
 if 'uname' in request.session:
   
   
     return render(request,'Customer/change_password.html')
 else:
      return redirect('/index/')
def update_password(request):
    if 'uname' in request.session:
        id=request.session['slogid']
        opass=request.POST.get("opassword")
        npass=request.POST.get("password")
        obj1=login.objects.filter(login_id=id,password=opass)
        if(obj1):
            tbl1=login.objects.get(login_id=id)
            tbl1.password=npass
            tbl1.save()
            messages.add_message(request, messages.INFO, 'Updated Please Login Using new Password.')
            return redirect('/sign_in/')
        else:
            messages.add_message(request, messages.INFO, 'Invalid Data')
            return redirect('/change_password')
    else:
       return redirect('/index/')
def generate_qr_code(request, booking_id):
    # Generate the URL that will simulate payment for the appointment
    payment_url = request.build_absolute_uri(reverse('simulate_payment', args=[booking_id]))

    # Create QR code with the payment URL
    qr = qrcode.QRCode(
        version=1,
        error_correction=qrcode.constants.ERROR_CORRECT_L,
        box_size=10,
        border=4,
    )
    qr.add_data(payment_url)
    qr.make(fit=True)

    img = qr.make_image(fill_color="black", back_color="white")

    # Serve the QR code as an image
    buffer = BytesIO()
    img.save(buffer, format="PNG")
    buffer.seek(0)

    return HttpResponse(buffer, content_type="image/png")
def simulate_payment(request, booking_id):
    # Get the appointment and update its status
    charger = get_object_or_404(charger_station_booking,booking_id=booking_id)
    charger.status = 'Paid'
    charger.save()

    # Redirect to a confirmation page or back to the appointment page
    messages.add_message(request, messages.INFO, 'Paid Successfully')
    return render(request, 'Customer/pay_success.html')
