"""echarger_locator URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from charger_app import views
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
    path('',views.index),
    path('index/',views.index),
    path('login_action/', views.sign_in_process),
    path('customer_action/', views.customer_action),
    path('User_registration/', views.User_registration),
    path('admin_home/', views.admin_home),
    path('customer_home/', views.customer_home),
    path('admin_logout/', views.admin_logout),
    path('admin_logout/', views.admin_logout),
    path('user_logout/',views.user_logout),
    path('sign_in/',views.sign_in),


    path('add_station/',views.add_station),
    path('save_station/',views.save_station),
    path('station_list/',views.station_list),
    path('ad_map/<int:id>',views.ad_map),
    path('edit_station/<int:id>', views.edit_station),
    path('update_station/<int:id>', views.update_station),
    path('delete_station/<int:id>', views.delete_station),
    


    # user
    path('user_search/',views.user_search),
    path('display_station/<int:id>',views.display_station),
    path('user_map/<int:id>',views.user_map),

    #Complaints

    #Complaints
    path('view_complaints/', views.view_complaints),
    path('replied_list/', views.replied_list),
    path('adm_reply_complaint/<int:id>', views.adm_reply_complaint),
    path('add_reply/<int:id>', views.add_reply),


   #enquiry
    path('view_enquiry/', views.view_enquiry),
    path('enquiry_replied_list/', views.enquiry_replied_list),
    path('adm_reply_enquiry/<int:id>', views.adm_reply_enquiry),
    path('add_reply_enquiry/<int:id>', views.add_reply_enquiry),
    #  Customer
    path('complaint/', views.Complaint_frm),
    path('save_complaint/', views.save_complaint),
    path('delete_complaint/<int:id>', views.delete_complaint),

    path('enquiry/', views.enquiry_frm),
    path('save_enquiry/', views.save_enquiry),
    path('delete_enquiry/<int:id>', views.delete_enquiry),

    path('Users_list/', views.Users_list),
    path('book/<int:id>', views.book),
    path('save_book/<int:id>', views.save_book),
    path('user_booking/', views.user_booking),
    
    path('check_username/', views.check_username, name='check_username'),
    path('display_district/', views.display_district, name='display_district'),
    path('display_place/', views.display_place, name='display_place'),

    path('add_booking_amount/', views.add_booking_amount),
    path('save_fee/', views.save_fee),
    path('edit_fee/<int:id>', views.edit_fee),
    path('update_fee/<int:id>', views.update_fee),
    path('payment/<int:id>', views.payment),
    path('pay_action/<int:id>', views.pay_action),
    path('booking_details/', views.booking_details),
    path('profile/', views.profile),
    path('save_profile/', views.save_profile),
    path('change_password/', views.change_password),
    path('update_password/', views.update_password),


    path('generate_qr_code/<int:booking_id>/', views.generate_qr_code, name='generate_qr_code'),
    path('simulate_payment/<int:booking_id>/', views.simulate_payment, name='simulate_payment'),

]
if settings.DEBUG:
    urlpatterns+=static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)
    urlpatterns+=static(settings.STATIC_URL,document_root=settings.STATIC_ROOT)
