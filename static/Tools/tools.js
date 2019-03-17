$(function () {
    $('img').each(function () {
        var temp=$(this).attr('src')
        temp="{% static '"+temp+"'%}"
        $(this).attr('src',temp)

    })
    console.log($('body').html())
})