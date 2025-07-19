import datetime
from django.db import models

# Create your models here.

class login(models.Model):
    login_id=models.AutoField(primary_key=True)
    username=models.CharField(max_length=50)
    password=models.TextField(null=True)
    Usertype=models.CharField(max_length=50)
    status=models.CharField(max_length=50)
    class Meta:
        db_table='tbl_login'

class Customer(models.Model):
    user_id=models.AutoField(primary_key=True)
    login_id=models.IntegerField()
    customer_name=models.CharField(max_length=50, null=True)
    phone_number=models.BigIntegerField(null=True)
    Email=models.CharField(max_length=50)
    Address=models.TextField()
    place=models.CharField(max_length=50, null=True)
    class Meta:
        db_table='tbl_customer'
class state(models.Model):
    state_id=models.AutoField(primary_key=True)
    country_id=models.IntegerField()
    state=models.CharField(max_length=50)
    class Meta:
        db_table='tbl_state'

class district(models.Model):
    district_id=models.AutoField(primary_key=True)
    state_id=models.IntegerField()
    district=models.CharField(max_length=50)
    class Meta:
        db_table='tbl_district'
class charging_station(models.Model):
    station_id=models.AutoField(primary_key=True)
    district_id=models.IntegerField()
    place=models.CharField(max_length=50, null=True)
    longitude=models.DecimalField(max_digits=15, decimal_places=10, blank=True, null=True)
    latitude=models.DecimalField(max_digits=15, decimal_places=10, blank=True, null=True)
    entry_date=models.DateTimeField(default=datetime.datetime.now)
    class Meta:
        db_table='tbl_charging_station'

class complaint(models.Model):
    complaint_id=models.AutoField(primary_key=True)
    complaint_subject=models.CharField(max_length=50)
    complaint=models.CharField(max_length=150)
    user_login_id=models.IntegerField()
    reply=models.CharField(max_length=50)
    class Meta:
        db_table='tbl_complaint'

class enquiry(models.Model):
    enquiry_id=models.AutoField(primary_key=True)
    enquiry_subject=models.CharField(max_length=50)
    enquiry=models.CharField(max_length=150)
    user_login_id=models.IntegerField()
    reply=models.CharField(max_length=50)
    class Meta:
        db_table='tbl_enquiry'

class charger_station_booking(models.Model):
    booking_id=models.AutoField(primary_key=True)
    start_date_time=models.DateTimeField()
    end_date_time=models.DateTimeField()
    user_login_id=models.IntegerField()
    status=models.CharField(max_length=50)
    entry_date=models.DateTimeField(default=datetime.datetime.now)
    station_id=models.IntegerField()
    class Meta:
        db_table='tbl_booking'
class fee(models.Model):
    fee_id=models.AutoField(primary_key=True)
    fee=models.IntegerField()
    class Meta:
        db_table='tbl_fee'