! function (e) {
    "use strict";
    e(window).on("load", function () {
        e(".loader-inner").fadeOut(), e(".loader").delay(200).fadeOut("slow")
    }), e("a.scroll").smoothScroll({
        speed: 800,
        offset: -60
    });
    var i = e(".header"),
        a = i.offset(),
        s = e(".block-top");
    e(window).scroll(function () {
        e(this).scrollTop() > a.top + 500 && i.hasClass("default") ? i.fadeOut("fast", function () {
            e(this).removeClass("default").addClass("switched-header").fadeIn(200), s.addClass("active")
        }) : e(this).scrollTop() <= a.top + 500 && i.hasClass("switched-header") && i.fadeOut("fast", function () {
            e(this).removeClass("switched-header").addClass("default").fadeIn(100), s.removeClass("active")
        })
    });
    var t = e(" .hero .main-slider .slides li");

    function l() {
        t.css("height", e(window).height())
    }
    e(function () {
        l()
    }), e(window).resize(function () {
        l()
    }), e(".main-slider").flexslider({
        animation: "fade",
        slideshow: !0,
        directionNav: !1,
        controlNav: !0,
        pauseOnAction: !1,
        animationSpeed: 1e3
    }), e(".review-slider").flexslider({
        animation: "slide",
        slideshow: !0,
        directionNav: !0,
        controlNav: !1,
        pauseOnAction: !1,
        animationSpeed: 500
    });
    var o = e(".mobile-but"),
        n = e(".main-nav ul");
    n.height();
    e(o).on("click", function () {
        return e(".toggle-mobile-but").toggleClass("active"), n.slideToggle(), e(".main-nav li a").addClass("mobile"), !1
    }), e(window).resize(function () {
        e(window).width() > 320 && n.is(":hidden") && (n.removeAttr("style"), e(".main-nav li a").removeClass("mobile"))
    }), e(".main-nav li a").on("click", function () {
        e(this).hasClass("mobile") && (n.slideToggle(), e(".toggle-mobile-but").toggleClass("active"))
    }), e(".background-img").each(function () {
        var i = e(this).children("img").attr("src");
        e(this).css("background-image", 'url("' + i + '")').css("background-position", "initial")
    }), e(".countdown").countdown("2018/6/20", function (i) {
        e(this).html(i.strftime("%D days %H:%M:%S"))
    });
    var c = {
        profile: {
            screenName: "mutationthemes"
        },
        domId: "tweets",
        maxTweets: 3,
        showRetweet: !1,
        showImages: !1,
        showUser: !0,
        showTime: !0,
        customCallback: function (i) {
            var a = i.length,
                s = 0,
                t = e(".tweets"),
                l = e("<ul>").addClass("slides");
            for (; s < a;) {
                var o = e("<li>");
                o.html(i[s]), l.append(o), s++
            }
            return t.html(l), e(".tweets").flexslider({
                animation: "slide",
                controlNav: !0,
                directionNav: !1
            }), l
        }
    };
    twitterFetcher.fetch(c), e(" tbody .block-tabs").on("click", function () {
        if (!e(this).hasClass("active")) {
            var i = e(this).index() + 1;
            e("tbody .block-tabs .active").removeClass("active"), e(this).addClass("active"), e(".block-tab li.active").removeClass("active"), e(".block-tab li:nth-child(" + i + ")").addClass("active")
        }
    });
    var d = e(".album"),
        r = audiojs.create(d, {
            trackEnded: function () {
                var i = e(" tbody .playlist .playing").parent().parent().parent().parent().next().find("tbody .playlist .playing");
                i.length || (i = e("tbody .playlist").first()), i.addClass("playing").siblings().removeClass("playing"), audio1.load(e(".as-link", i).attr("data-src")), audio1.play()
            }
        })[0],
        f = e("tbody .playlist .as-link").attr("data-src");
    e("tbody .playlist ").first().addClass("pause"), r.load(f), e("tbody .playlist").on("click", function () {
        return "playing" == e(this).attr("class") ? (e(this).addClass("pause"), r.playPause()) : (e(this).addClass("playing").removeClass("pause").siblings().removeClass("playing").removeClass("pause"), r.load(e(".as-link", this).attr("data-src")), r.play()), !1
    }), e(".toggle-lyrics").on("click", function () {
        return e(this).closest("tbody .playlist").find(".block-lyrics").slideToggle(), e(this).toggleClass("selected"), !1
    }), e(".popup-image").magnificPopup({
        type: "image",
        fixedContentPos: !1,
        fixedBgPos: !1,
        mainClass: "mfp-no-margins mfp-with-zoom",
        image: {
            verticalFit: !0
        },
        zoom: {
            enabled: !0,
            duration: 300
        }
    }), e(".popup-youtube, .popup-vimeo").magnificPopup({
        disableOn: 700,
        type: "iframe",
        mainClass: "mfp-fade",
        removalDelay: 160,
        preloader: !1,
        fixedContentPos: !1
    });
    var u = e(".main-nav li span.search-ico"),
        h = {
            container: e(".block-search-form"),
            config: {
                effect: "slideToggle",
                speed: "300"
            },
            init: function (i) {
                e.extend(this.config, i), u.on("click", this.show)
            },
            show: function () {
                var e = h,
                    i = e.container,
                    a = e.config;
                i.is(":hidden") && (h.close.call(i), h.container[a.effect](a.speed))
            },
            close: function () {
                var i = e(this);
                i.find("span.search-close").length || (document.onkeydown = function (e) {
                    27 == (e = e || window.event).keyCode && i[h.config.effect](h.config.effect.speed)
                }, e("<span class=close-search></span>").prependTo(i).on("click", function () {
                    i[h.config.effect](h.config.effect.speed)
                }))
            }
        };
    h.init({
        effect: "fadeToggle",
        speed: "300"
    })
}(jQuery);
