function prepRibbons() {
    var nav = $('#headerNavigation')
        , con = $('.nav')
        ;
    function hideRibbon(r){
        $(r).hide().removeClass('hover');
    }

    nav.find('a:not(:first)').filter(':not(:last)').each(function (idx) {


        var a = $(this)
            , ribbon = $('<div class="ribbonBox empty"></div>')
                .hide()
                .appendTo(con)
                .hover(function () { $(this).addClass('hover'); })
                .mouseleave(function () { hideRibbon(this) })
                .append(
                    $('<div class="ribbonBtn">CLOSE</div>').click(function () { ribbon.hide() })
                )
            ;
        a.parent('li').hover(function () {

            con.find('.ribbonBox')
                .each(function (rIdx) { if (rIdx !== idx) { hideRibbon(this) } });

            if(ribbon.is(':hidden')){ ribbon.show({duration: 200})}

            if (ribbon.hasClass('empty') && !ribbon.hasClass('loading')) {
                ribbon.addClass('loading');
                var loc = window.location
//                    ,url = loc.protocol + '//' + loc.host + '/zh/ribbons/' + $.trim(a.text())
                    ,url =encodeURI( '/zh/ribbons/' + $.trim(a.text()))
                    ;

                $.ajax(url, {dataType: 'html', type: 'get',cache:false})
                    .done(function (data) {
                        ribbon.prepend($(data)).removeClass('empty').removeClass('loading');
                    });
            }
        })
            .mouseleave(function () {
                setTimeout(function () {
                    if (!ribbon.hasClass('hover')) { hideRibbon(ribbon) }
                }, 50)
            });

    });

}
prepRibbons();