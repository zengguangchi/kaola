from django.conf.urls import url

from KaoLa import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^index/', views.index, name='index'),
    url(r'^register/', views.register, name='register'),
    url(r'^checkemail/', views.checkemail, name='checkemail'),
    url(r'^signin/', views.signin, name='signin'),
    url(r'^logout/', views.logout, name='logout'),
    url(r'^goodsdetail/(\d+)/', views.goodsdetail, name='goodsdetail'),
    url(r'^cart/', views.cart, name='cart'),
    url(r'^addcart/', views.addcart, name='addcart'),
    url(r'^chakanstuats/', views.chakanstuats, name='chakanstuats'),
    url(r'^chakanall/', views.chakanall, name='chakanall'),
    url(r'^orderdetail/(.*)/', views.orderdetail, name='orderdetail'),
    url(r'^orderlist/', views.orderlist, name='orderlist'),
    url(r'^generateorder/', views.generateorder, name='generateorder'),
    url(r'^shoporder/',views.shoporder,name='shoporder'),
    url(r'^cartaddgoods/', views.cartaddgoods, name='cartaddgoods'),
    url(r'^cartsugoods/',views.catrsugoods,name='catrsugoods')
]
