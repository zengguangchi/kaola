from django.db import models


# Create your models here.
class Wheel(models.Model):
    img = models.CharField(max_length=100)


class User(models.Model):
    email = models.CharField(max_length=100)
    passwrod = models.CharField(max_length=100)
    img = models.CharField(max_length=100)
    phone = models.CharField(max_length=30)
    name = models.CharField(max_length=30)


class Goods(models.Model):
    small_src = models.CharField(max_length=100)
    middle_src = models.CharField(max_length=100)
    big_src = models.CharField(max_length=100)
    brand = models.CharField(max_length=100)
    name = models.CharField(max_length=100)
    des = models.CharField(max_length=200)
    discount_price = models.CharField(max_length=40)
    orig_price = models.CharField(max_length=40)


class Cart(models.Model):
    user = models.ForeignKey(User)
    goods = models.ForeignKey(Goods)
    isselect = models.BooleanField(default=True)
    number = models.IntegerField()


class Order(models.Model):
    user = models.ForeignKey(User)
    createtime = models.DateTimeField(auto_now_add=True)
    updatetime = models.DateTimeField(auto_now=True)
    status = models.IntegerField(default=0)
    identifier = models.CharField(max_length=256)


class OrderGoods(models.Model):
    order = models.ForeignKey(Order)
    goods = models.ForeignKey(Goods)
    number = models.IntegerField()

