import hashlib
import random

import time
from django.http import JsonResponse
from django.shortcuts import render, redirect

# Create your views here.
from django.core.cache import cache

from KaoLa.models import Wheel, Goods, User, Cart, OrderGoods, Order


def generate_password(param):
    md5 = hashlib.md5()
    md5.update(param.encode('utf-8'))
    return md5.hexdigest()


def generate_token():
    temp = str(time.time()) + str(random.random())
    md5 = hashlib.md5()
    md5.update(temp.encode('utf-8'))
    return md5.hexdigest()


def index(request):
    wheels = Wheel.objects.all()
    goodslist = Goods.objects.all()
    token = request.session.get('token')
    userid = cache.get(token)
    user = None
    if userid:
        user = User.objects.get(pk=userid)
    data = {
        'wheels': wheels,
        'goodslist': goodslist,
        'user': user
    }
    return render(request, 'index/index.html', context=data)


def register(request):
    if request.method == 'GET':
        return render(request, 'register/register.html')
    elif request.method == 'POST':
        user = User()
        user.email = request.POST.get('email')
        user.passwrod = generate_password(request.POST.get('passwrod'))
        user.phone = request.POST.get('phone')
        user.name = request.POST.get('name')
        user.img = 'kaola.png'
        user.save()
        token = generate_token()
        cache.set(token, user.id, 60 * 60 * 5)
        request.session['token'] = token
        return redirect('kaola:index')


def signin(request):
    if request.method == 'GET':
        return render(request, 'signin/signin.html')
    elif request.method == 'POST':
        email = request.POST.get('email')

        password = generate_password(request.POST.get('password'))

        try:
            user = User.objects.get(email=email)

            if user.passwrod == password:
                token = generate_token()
                cache.set(token, user.id, 60 * 60 * 24)
                request.session['token'] = token
                return redirect('kaola:index')
            else:
                return render(request, 'signin/signin.html', context={'err': '密码错误'})
        except:
            return render(request, 'signin/signin.html', context={'err': '用户不存在'})


def cart(request):
    token = request.session.get('token')
    userid = cache.get(token)
    if userid:
        user = User.objects.get(pk=userid)
        carts = Cart.objects.filter(user=user).exclude(number=0)
        isall = True
        for cart in carts:
            if not cart.isselect:
                isall = False

        data = {

            'user': user,
            'carts': carts,
            'isall': isall
        }
        return render(request, 'cart/ShopCart.html', context=data)
    else:
        return render(request, 'signin/signin.html')


def goodsdetail(request, goodsid):
    goods = Goods.objects.get(pk=goodsid)
    token = request.session.get('token')
    userid = cache.get(token)
    user = None
    if userid:
        user = User.objects.get(pk=userid)
    data = {
        'user': user,
        'goods': goods
    }
    return render(request, 'goodsdetail/goodDetail.html', context=data)


def checkemail(request):
    email = request.GET.get("email")
    users = User.objects.filter(email=email)
    if users.exists():
        return JsonResponse({'msg': '账号已存在', 'status': 0})
    else:
        return JsonResponse({'mgs': '账号可用', 'status': 1})


def logout(request):
    response = redirect('kaola:index')
    request.session.flush()
    return response


def addcart(request):
    token = request.session.get('token')
    if token:
        userid = cache.get(token)
        if userid:
            user = User.objects.get(pk=userid)
            num = request.GET.get('num')
            goodsid = request.GET.get('goodsid')
            goods = Goods.objects.get(pk=goodsid)
            carts = Cart.objects.filter(user=user).filter(goods=goods)
            if carts.exists():
                cart = carts.first()
                cart.number = cart.number + int(num)
                cart.save()

            else:
                cart = Cart()
                cart.user = user
                cart.goods = goods
                cart.number = int(num)
                cart.save()
            return JsonResponse({'msg': '添加成功', 'status': 1, 'number': cart.number})

    else:
        return JsonResponse({'msg': '请登录', 'status': 0})


def chakanstuats(request):
    cartid = request.GET.get('cartid')
    cart = Cart.objects.get(pk=cartid)
    cart.isselect = not cart.isselect
    cart.save()
    data = {
        'msg': '修改状态',
        "status": 1,
        'isselect': cart.isselect
    }
    return JsonResponse(data)


def chakanall(request):
    isall = request.GET.get('isall')
    token = request.session.get('token')
    userid = cache.get(token)
    user = User.objects.get(pk=userid)
    carts = user.cart_set.all()
    if isall == "true":
        isall = False
    else:
        isall = True

    for cart in carts:
        cart.isselect = isall
        cart.save()
    data = {
        'msg': '全选状态修改',
        'status': 1
    }
    return JsonResponse(data)


def generate_identifier():
    temp = str(time.time()) + str(random.randrange(1000, 10000))
    return temp


def generateorder(request):
    token = request.session.get('token')
    userid = cache.get(token)
    user = User.objects.get(pk=userid)

    order = Order()
    order.user = user
    order.identifier = generate_identifier()
    order.save()
    carts = user.cart_set.filter(isselect=True).exclude(number=0)
    for cart in carts:
        orderGoods = OrderGoods()
        orderGoods.order = order
        orderGoods.goods = cart.goods
        orderGoods.number = cart.number
        orderGoods.save()
        cart.delete()

    data = {
        'msg': '生成订单',
        'identifier': order.identifier,
        'status': 1
    }

    return JsonResponse(data)


def shoporder(request):
    token = request.session.get('token')
    userid = cache.get(token)
    if userid:
        user = User.objects.get(pk=userid)
        num = request.GET.get('num')
        goodsid = request.GET.get('goodsid')
        goods = Goods.objects.get(pk=goodsid)
        order = Order()
        order.user = user
        order.identifier = generate_identifier()
        order.save()
        ordergoods = OrderGoods()
        ordergoods.order = order
        ordergoods.goods = goods
        ordergoods.number = num
        ordergoods.save()
        data = {
            'msg': '立即购买生成订单',
            'identifier': order.identifier,
            'status': 1
        }
    else:
        data = {
            'msg': '请登录',
            'status': 0
        }
    return JsonResponse(data)


def orderdetail(request, identifier):
    order = Order.objects.filter(identifier=identifier).first()

    return render(request, 'order/orderdetail.html', context={'order': order})


def orderlist(request):
    token = request.session.get('token')
    userid = cache.get(token)
    if userid:
        user = User.objects.get(pk=userid)

        orders = user.order_set.all()

        return render(request, 'order/orderlist.html', context={'orders': orders})
    else:
        return render(request, 'signin/signin.html')


def cartaddgoods(request):
    token = request.session.get('token')
    userid = cache.get(token)
    if userid:
        user = User.objects.get(pk=userid)
        goodsid = request.GET.get('goodsid')
        goods = Goods.objects.get(pk=goodsid)
        carts = Cart.objects.filter(user=user).filter(goods=goods)
        if carts.exists():
            cart = carts.first()
            cart.number = cart.number + 1
            cart.save()
            return JsonResponse({'status': 1, 'number': cart.number})


def catrsugoods(request):
    token = request.session.get('token')
    userid = cache.get(token)
    if userid:
        user = User.objects.get(pk=userid)
        goodsid = request.GET.get('goodsid')
        goods = Goods.objects.get(pk=goodsid)
        carts = Cart.objects.filter(user=user).filter(goods=goods)
        if carts.exists():
            cart = carts.first()
            cart.number = cart.number - 1
            cart.save()
            return JsonResponse({'status': 1, 'number': cart.number})
