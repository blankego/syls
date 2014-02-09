function prepRibbons() {
    var nav = $('#headerNavigation')
        , con = $('.nav')
        ;

    nav.find('a:not(:first)').filter(':not(:last)').each(function (idx) {


        var a = $(this)
            , ribbon = $('<div class="ribbonBox empty"></div>')
                .hide()
                .appendTo(con)
                .hover(function () { $(this).addClass('hover'); })
                .mouseleave(function () { $(this).hide().removeClass('hover'); })
                .append(
                    $('<div class="ribbonBtn">CLOSE</div>').click(function () { ribbon.hide() })
                )
            ;
        a.parent('li').hover(function () {

            con.find('.ribbonBox')
                .each(function (rIdx) { if (rIdx !== idx) { $(this).hide() } });

            ribbon.show({duration: 200});

            if (ribbon.hasClass('empty') && !ribbon.hasClass('loading')) {
                ribbon.addClass('loading');
                var loc = window.location
//                    ,url = loc.protocol + '//' + loc.host + '/zh/ribbons/' + $.trim(a.text())
                    url =encodeURI( '/zh/ribbons/' + $.trim(a.text()))
                    ;

                $.ajax(url, {dataType: 'html', type: 'get',cache:false})
                    .done(function (data) {
                        ribbon.prepend($(data)).removeClass('empty').removeClass('loading');
                    });
            }
        })
            .mouseleave(function () {
                setTimeout(function () { if (!ribbon.hasClass('hover')) { ribbon.hide() } }, 100)
            });

    });

}
prepRibbons();