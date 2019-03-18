$(function () {
    $('#btu').click(function () {

       var orderid= $(this).attr('orderid')
        data={
           'orderid':orderid
        }
         console.log(orderid)
        $.get('/kaola/pay/',data,function (response) {
            console.log(response)
            if (response.status==1){
                console.log(11)
                window.open(response.alipayurl, target='_self')
            }
        })
    })
})