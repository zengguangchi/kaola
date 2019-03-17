$(function () {
    var value=$('.current-goods-num').val()
    $('.increase-num').click(function () {
        value++;
        $('.current-goods-num').val(value)
    });
    $('.decrease-num').click(function () {
        value--;
        if(value<=1){
            value=1
        }
        $('.current-goods-num').val(value)
    });
    $('#btnAddCart').click(function () {

        var goodsid=$(this).attr('goodsid')
        data={
            'goodsid':goodsid,
            'num':value
        }
        $.get('/kaola/addcart/',data,function (response) {
            console.log(response)
            if(response.status==0){

                 window.open('/kaola/signin/',target='_self')
            }else if (response.status==1){
                alert(response.msg)
            }
        })
    })
    $('#btnBuy').click(function () {
        var goodsid=$(this).attr('goodsid')
        data={
            'goodsid':goodsid,
            'num':value
        }
        $.get('/kaola/shoporder/',data,function (response) {
            if (response.status==1){
                 window.open('/kaola/orderdetail/'+response.identifier+'/',target = '_self')
            }
            else if (response.status==0){
                window.open('/kaola/signin/',target='_self')
            }
        })
    })
})