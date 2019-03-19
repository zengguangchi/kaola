$(function () {


    // 邮箱验证
    $('#email input').blur(function () {
        var reg = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/

        if (reg.test($(this).val())) {
            $.get('/kaola/checkemail/', {'email': $(this).val()}, function (response) {
                console.log(response)
                if (response.status) {  // 可用
                    $('#email').removeClass('has-error').addClass('has-success')
                    $('#email > span').removeClass('glyphicon-remove').addClass('glyphicon-ok')
                    $('#err').html('')
                } else {    // 不可用
                    $('#email').removeClass('has-success').addClass('has-error')
                    $('#email > span').removeClass('glyphicon-ok').addClass('glyphicon-remove')
                    $('#err').html(response.msg)
                }
            })
        } else {    // 不符合
            $('#email').removeClass('has-success').addClass('has-error')
            $('#email>span').removeClass('glyphicon-ok').addClass('glyphicon-remove')
        }
    })

    // 密码验证
    $('#password input').blur(function () {
        var reg = /^[a-zA-Z\d_]{6,13}$/

        if (reg.test($(this).val())) {  // 符合
            $('#password').removeClass('has-error').addClass('has-success')
            $('#password>span').removeClass('glyphicon-remove').addClass('glyphicon-ok')
        } else {    // 不符合
            $('#password').removeClass('has-success').addClass('has-error')
            $('#password>span').removeClass('glyphicon-ok').addClass('glyphicon-remove')
        }
    })

    // 名字验证
    $('#name input').blur(function () {

        if ($(this).val().length >= 3 && $(this).val().length <= 10) {  // 符合
            $('#name').removeClass('has-error').addClass('has-success')
            $('#name>span').removeClass('glyphicon-remove').addClass('glyphicon-ok')
        } else {    // 不符合
            $('#name').removeClass('has-success').addClass('has-error')
            $('#name>span').removeClass('glyphicon-ok').addClass('glyphicon-remove')
        }
    })

    // 手机验证
    $('#phone input').blur(function () {
        var reg = /^(\+?0?86\-?)?1[345789]\d{9}$/

        if (reg.test($(this).val())) {  // 符合
            $('#phone').removeClass('has-error').addClass('has-success')
            $('#phone>span').removeClass('glyphicon-remove').addClass('glyphicon-ok')
        } else {    // 不符合
            $('#phone').removeClass('has-success').addClass('has-error')
            $('#phone>span').removeClass('glyphicon-ok').addClass('glyphicon-remove')
        }
    })

    //验证码
    $('#code input').blur(function () {
        //获取显示区生成的验证码
        var checkCode = document.getElementById("checkCode").innerHTML;
        //获取输入的验证码
        var inputCode = document.getElementById("inputCode").value;
        console.log(checkCode);
        console.log(inputCode);
        if (inputCode.length <= 0) {

            $('#code').removeClass('has-success').addClass('has-error')
            $('#code >span').removeClass('glyphicon-ok').addClass('glyphicon-remove')
             alert("请输入验证码！");
        }
        else if (inputCode.toUpperCase() != checkCode.toUpperCase()) {

            $('#code').removeClass('has-success').addClass('has-error')
            $('#code >span').removeClass('glyphicon-ok').addClass('glyphicon-remove')
            alert("验证码输入有误！");
            createCode(4);
        }
        else {
            $('#code').removeClass('has-error').addClass('has-success')
            $('#code>span').removeClass('glyphicon-remove').addClass('glyphicon-ok')
        }
    })
    // 触发注册
    $('#subButton').click(function () {
        var isregister = true

        // 遍历所有的输入框是否正确
        $('.form-group').each(function () {
            if (!$(this).hasClass('has-success')) {
                isregister = false
            }
        })

        console.log(isregister)

        if (isregister) {    // 都正确
            $('#register').submit()
        }
    })


})