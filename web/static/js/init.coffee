# require('web/static/js/disqus')

resize_window = () ->
    logo = $("#logo") ;
    logo.css({
        transition: "width 2s, top 2s, left 2s",
        left: ($(window).width() - logo.width()) / 2,
        top: 90
    } ) ;


init = () ->
    logo = $("#logo") ;
    $(document.documentElement).css({overflow: 'hidden'} ) ;
    logo.css({
        transition: "width 2s, top 2s, left 2s",
        left: ($(window).width() - logo.width()) / 2,
        top: ($(window).height() - 250) / 2,
        display: 'block'
    } ) ;

    setTimeout(() ->
        $("#logo").css({
            width: 120,
            left: ($(window).width() - 120) / 2,
            top: 90
        } ) ;
        setTimeout(() ->
            $(document.documentElement).css({overflow: 'auto'} )
        , 2000)
     , 2000) ;
    setTimeout(() ->
        $("#mask").css({background: 'transparent', zIndex: '0'} )
        setTimeout( () ->
            $("#mask").hide() ;
         , 2000)
     , 3000) ;


$(window).resize ()->
  resize_window()

$(() ->
    init()
 )
