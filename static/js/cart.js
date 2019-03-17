$(function () {
     total()
    $(".reduce-goods-num").click(function () {
        var goodsid = $(this).attr('goodsid')
        console.log(goodsid)
        console.log($(this).next().html())
        var $that = $(this)
        data = {
            'goodsid': goodsid
        }

        $.get('/kaola/cartsugoods/', data, function (response) {
            console.log(response)
            if (response.status == 1) {
                if (response.number > 1) {
                    $that.next().html(response.number)
                } else {
                    // $that.parents($('list_content_ul clearfix')).remove()
                    location.reload()
                }
                 total()
                location.reload()

            }


        })
        console.log('减操作')
    });
    $(".increase-goods-num").click(function () {
        var goodsid = $(this).attr('goodsid')
        console.log(goodsid)
        console.log($(this).prev().html())
        console.log('加操作')
        var $that = $(this)
        data = {
            'goodsid': goodsid
        }
        $.get('/kaola/cartaddgoods/', data, function (response) {
            console.log(response)
            if (response.status == 1) {
                $that.prev().html(response.number)

            }
             total()
            location.reload()

        })
    });

    $('.new-checkbox').click(function () {
        var cartid = $(this).attr('cartid')
        console.log(cartid)
        var $this = $(this)
        data = {
            'cartid': cartid
        }
        $.get('/kaola/chakanstuats', data, function (response) {
            console.log(response)
            if (response.status) {
                if (response.isselect) {
                    $this.prop('checked', true).removeClass('no').addClass('ok')
                } else {
                    $this.prop('checked', false).removeClass('ok').addClass('no')
                }
                total()
            }
        })
    });
    $('#btn-all').click(function () {
        var isall = $(this).attr('isall')
        $che = $(this)
        isall = (isall == 'false') ? true : false
        $(this).attr('isall', isall)
        if (isall) {
            $che.prop('checked', true)
        } else {
            $che.prop('checked', false)
        }
        data = {
            'isall': isall
        }

        $.get('/kaola/chakanall', data, function (response) {
            console.log(response)
            if (response.status == 1) {
                $('.new-checkbox').each(function () {
                    if (isall) {
                        $(this).prop('checked', true).removeClass('no').addClass('ok')

                    } else {
                        $(this).prop('checked', false).removeClass('ok').addClass('no')
                    }
                    total()
                })
            }


    })
});

function total() {
    var sum = 0
    $('.goods-item').each(function () {
        var $cso = $(this)
        var $csa = $(this)
        if ($cso.find('.ok').length) {
            var num = $csa.find('.this-goods-num').attr('value')
            console.log(num)
            var price =$csa.find('.new-price').attr('price')
            console.log(price)
            sum += num * price
            console.log(sum)
        }
        $('.total-goods-money').html(parseInt(sum))
    })
}
$('#btn-total-pay').click(function () {
    $.get('/kaola/generateorder/',function (response) {
        if(response.status==1){
            window.open('/kaola/orderdetail/'+response.identifier+'/',target = '_self')
        }
    })
})



})