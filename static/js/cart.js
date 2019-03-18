$(function () {
    total()

    $(".reduce-goods-num").click(function () {
        var $that = $(this)
        var goodsid = $(this).attr('goodsid')
        console.log(goodsid)
        data = {
            'goodsid': goodsid,

        }

        $.get('/kaola/cartsugoods/', data, function (response) {
            console.log(response)
            if (response.status == 1) {
                if (response.number){
                      $that.next().val(response.number)
                }
                else {
                    $that.next().hide()
                    $that.hide()
                }
                 total()
                }


            // location.reload()


        })
        console.log('减操作')
    });
    $(".increase-goods-num").click(function () {

        var goodsid = $(this).attr('goodsid')

        console.log('加操作')
        var $that = $(this)
        data = {
            'goodsid': goodsid,
        }
        $.get('/kaola/cartaddgoods/', data, function (response) {
            console.log(response)
            if (response.status == 1) {
                console.log(response.number)
                $that.prev().val(response.number)
                $that.prev().show()
                $that.prev().prev().show()

            }
            total()
            // location.reload()

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
                var price = $csa.find('.new-price').attr('price')
                console.log(price)
                sum += parseInt(num) * parseInt(price)
                console.log(sum)
            }
            $('.total-goods-money').html(parseInt(sum))
        })
    }

    $('#btn-total-pay').click(function () {
        $.get('/kaola/generateorder/', function (response) {
            if (response.status == 1) {
                window.open('/kaola/orderdetail/' + response.identifier + '/', target = '_self')
            }
        })
    })


})