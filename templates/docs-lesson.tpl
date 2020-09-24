<!DOCTYPE html>
<html lang="en-US">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="pinterest" content="nopin" />
    <title><moduleTitle/></title>
    <link rel="canonical" href="https://eta-lang.org" />
    <meta name="keywords" content="Documentation, Eta, Haskell, Scala, Clojure, JVM, Functional Programming, Functional Programming on the JVM, Java Virtual Machine">
    <meta name="description" content="Documentation of Eta Programming Language." />
    <link rel="apple-touch-icon" sizes="57x57" href="/favicon/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="/favicon/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/favicon/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/favicon/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/favicon/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="/favicon/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/favicon/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="/favicon/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="/favicon/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192"  href="/favicon/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="/favicon/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/favicon/favicon-16x16.png">
    <link rel='dns-prefetch' href='//fonts.googleapis.com' />
    <link rel='dns-prefetch' href='//s.w.org' />
    <link rel='stylesheet' href='/css/eta-theme.css' type='text/css' media='all' />
    <link rel='stylesheet' href='/css/style.css' type='text/css' media='all' />
    <link rel='stylesheet' href='//fonts.googleapis.com/css?family=Roboto%3A100%2C300%2C400%2C700&#038;ver=5a155dfba583c' type='text/css' media='all' />
    <link href="https://fonts.googleapis.com/css?family=Cousine" rel="stylesheet">
    <link rel='stylesheet' id='jquery-slick-css' href='/css/slick.css' type='text/css' media='all' />
    <link rel='stylesheet' id='jquery-slick-theme-css' href='/css/slick-theme.css' type='text/css' media='all' />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/docsearch.js@2/dist/cdn/docsearch.min.css" />
    <script type='text/javascript' src='/js/jquery/jquery.js'></script>
    <script type='text/javascript' src='/js/jquery/jquery-migrate.min.js'></script>
    <script type='text/javascript' src='/js/slick.js'></script>
</head>

<body class="page-template page-template-custom-pages page-template-page page-template-features page-template-custom-pagespagefeatures-php page page-id-4566 object-4566">

    <!-- Hero Section -->
    <div class='hero-container'>
        <mainHeader/>
        <div class='container hero-content col middle-xs'>
            <div class='row'>
                <div class='col-xs-12 col-sm-12 col-lg-12 color--white'>
                    <h1 class='heading--large'><moduleTitle/></h1>

                    <p class='text--large mt--20'><moduleDescription/></p>
                    <div class="resource-bar__search pt--10 show-lg-only">
                      <div class="resource-bar__search_placeholder">
                        <form class="row middle-xs submitter nocol" method="get" action="">
                          <input name="s" id="search-docs" type="text" required="required" value="" placeholder="" style="border-bottom: 1px solid white;">
                          <svg class="submitter__trigger" style=" " width="16" height="16" viewBox="0 0 16 16"><g fill="none" stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" data-name="figures and interactions"><circle cx="7.28" cy="7.15" r="3.17"></circle><path d="M11.89 12.02L9.7 9.83"></path></g></svg>
                        </form>
                     </div>
                   </div>
                </div>
            </div>
        </div>

    </div>
    <div class='row'>
        <div class='col-lg-3 index-wrapper mt--20 show-lg-only' style='z-index: 1;'>
            <ul class="bullets-index" id="chaps">
                <div class="resource-bar__search pt--10 show-lg-only" id="search_bar_sidenav">
                  <div class="resource-bar__search_placeholder">
                    <form class="row middle-xs submitter nocol" method="get" action="">
                      <input name="s" id="min-search-docs" type="text" required="required" value="" placeholder="Search Documentation" style="border-bottom: 1px solid white;">
                      <svg class="submitter__trigger" style=" " width="16" height="16" viewBox="0 0 16 16"><g fill="none" stroke="#5333ed" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" data-name="figures and interactions"><circle cx="7.28" cy="7.15" r="3.17"></circle><path d="M11.89 12.02L9.7 9.83"></path></g></svg>
                    </form>
                  </div>
                </div>
                <sidenav />
            </ul>
        </div>
        <div class="col-lg-9 col-sm-12 col-xs-12 content-wrapper bg--gray pl--50 pr--50 pl--xs--20 pr--xs--20">
            <div class='box box--padding--top--20 mt--20 ml--xs--0 pl--xs--0' id="box-main">
                <div class="row" id="header-box">
                    <div class="col-lg-2 show-lg-only">
                      <tocModuleImg />
                    </div>
                    <div class="col-lg-10 col-xs-12 col-sm-12">
                        <div class='resource-bar__breadcrumb show-lg-only'>
                            <nav class='breadcrumb start-lg color--white'>
                                <ul class='start-lg mt--30 ml--20'>
                                  <tocBreadcrumbs/>
                                </ul>
                            </nav>
                        </div>
                        <h3 class="heading--small mb--20 start-lg center-xs center-sm pl--20 pt--10 pt--sm--60" id="header-title"><lessonTitle/></h3>
                    </div>
                </div>
                <div class="row mr--20 ml--20" id="header-contents">
                    <div class="col-lg-1">
                    </div>
                    <div class="col-lg-11 col-sm-12 col-xs-12 center-xs start-lg center-sm">
                        <h3 class='heading--medium color--purple mt--20 mb--20'>
                            Contents
                        </h3>
                        <ul class="header-contents-list bullet-list" list-style="1">
                          <toc/>
                        </ul>
                    </div>
                </div>
            </div>
            <lesson/>
            <div class="row mr--20 ml--20 pt--40 pb--60">
              <div class="col-md-4 start-md">
                <a prevLink class="button--purple">Previous</a>
              </div>
              <div class="col-md-4 center-md show-lg-only">
                <a class="button--purple " href="#">Read again</a>
              </div>
              <div class="col-md-4 center-md show-xs-only">

              </div>
              <div class="col-md-4 end-md end-sm">
                <a nextLink class="button--purple">Next</a>
              </div>
            </div>
          </div>

    </div>

    <script type="text/javascript">
        function switchImage(index) {
            var images = document.getElementsByClassName('screen__image');
            for (i = 0; i < images.length; i++) {
                if (i === index) {
                    images[i].style = 'display:inline'
                } else {
                    images[i].style = 'display:none'
                }
            }
        }
    </script>

    <style media="screen">
        #my-eta-man {
            position: absolute;
            z-index: 100;
            bottom: -101px;
            left: -65px
        }
        /*1200px*/

        @media only screen and (max-width: 75em) {
            #my-eta-man {
                display: none;
            }
        }
        /* Hero Section */

        .hero-container {
            height: 68vh;
            min-height: 500px;
            background-image: url('/images/features-hero.svg');
            /*position: sticky;
  top: 0;*/
        }

        .hero-container h1 {
            position: relative;
            top: 12px;
        }

        .hero-content {
            flex: 1;
            display: flex;
            z-index: 100;
            align-items: center;
            margin-top: -102px;
        }

        @media only screen and (max-width: 75em) {
            .hero-container {
                height: 0px;
            }
            .hero-content {
                margin-top: 100px;
            }
        }
        /* 768px */

        @media only screen and (max-width: 48em) {
            .hero-container {
                background-image: -webkit-linear-gradient( -30deg, rgb(44, 212, 217) 49%, rgb(83, 51, 237) 100%);
                background-image: -moz-linear-gradient( -30deg, rgb(44, 212, 217) 49%, rgb(83, 51, 237) 100%);
                background-image: -ms-linear-gradient( -30deg, rgb(44, 212, 217) 49%, rgb(83, 51, 237) 100%);
                max-height: auto;
                min-height: 0px;
                margin-left: 0px;
                width: 100%;
                height: auto;
                display: block;
            }
            .hero-content {
                margin: 0px;
                padding-top: 40px;
                padding-bottom: 120px;
            }
        }

        #eta-screen {
            max-width: 912px;
        }
        /*1200px */

        @media only screen and (max-width: 75em) {
            #eta-screen img {
                width: 100%;
                height: auto;
            }
            #eta-screen {
                margin: 0 auto;
                margin-top: 66px;
            }
            #eta-man {
                display: none;
            }
        }
        /*768px*/

        @media only screen and (max-width: 48em) {
            #eta-screen {
                margin-top: 20px;
            }
        }
        /*1200px*/

        @media only screen and (min-width: 75em) {
            #eta-screen {
                position: absolute;
                top: 50px;
                right: -160px
            }
            #eta-screen img {
                display: block;
            }
        }
        /* Peace Of Mind */

        #peace-of-mind-group {
            position: absolute;
            right: -120px;
            top: -90px;
            z-index: -1
        }

        #peace-of-mind-group+div {
            z-index: 400;
            position: relative;
        }
        /*768px*/

        @media only screen and (max-width: 47.9999em) {
            #peace-of-mind-group {
                position: relative;
                top: 0px;
                left: -20px;
                right: 0px;
                transform: scaleX(-1);
                filter: FlipH;
            }
        }

        #support-that-cares-group {
            position: absolute;
            left: 40px;
            top: -200px;
            z-index: -1
        }
        /*768px*/

        @media only screen and (max-width: 47.9999em) {
            #support-that-cares-group {
                position: relative;
                top: 0px;
                left: 0px;
            }
        }
        /* Support That Cares */

        #support-that-cares-group+div {
            position: relative;
            z-index: -1
        }

        #features-group {
            position: absolute;
            right: 30px;
            width: 65%;
            top: -115px;
            z-index: 200
        }

        #features-group+div {
            position: relative;
            z-index: -1
        }

        .bg--blue--purple {
            background: #150773;
        }
        /*1152pxpx*/

        @media only screen and (min-width: 72em) {
            .bg--blue--purple {
                position: relative;
                background-image: -moz-linear-gradient(0deg, #150773 0%, #150773 calc(49.999999% + 128px), #3D23C0 calc(50% + 128px), #3D23C0 100%);
                background-image: -webkit-linear-gradient(0deg, #150773 0%, #150773 calc(50% + 128px), #3D23C0 calc(50% + 128px), #3D23C0 100%);
            }
        }

        #features-group+div {
            z-index: 400;
            position: relative;
        }

        .grey-box {
            background-color: #E1EAF7;
            margin-top: 30px;
            border-radius: 3px;
            text-align: left;
            padding: 30px;
        }

        .grey-box ul {
            padding: 20px;
            padding-left: 50px;
            list-style-type: disc
        }

        .grey-box ul li a {
            font-family: 'Brandon Text';
            text-decoration: none;
        }

        #left-container {
            margin-left: 0px;
            padding-left: 0px;
            height: 100vh;
        }

        .container .index-wrapper {
            z-index: 1000;
            display: block;
            padding: 20px;
            height: 80vh;
            position: -webkit-sticky; // required for Safari
            position: sticky;
            top: 0;
        }

        .index-wrapper .bullets-index {
            text-align: left;
            padding-left: 50px;
            padding-bottom: 30px;
            font-family: 'Brandon Text';
            top: 0;
            display: block;
            position: -webkit-sticky;
            position: sticky;
        }

        .bullets-index li {
            line-height: 3;
        }

        .bullets-index li a {
            text-decoration: none;
        }

        .container .content-wrapper {
            max-width: 940px;
            padding: 32px 48px;
            padding-right: 250px;
            position: relative;
        }

        li.getstarted {
            background: url('/images/startup.svg') no-repeat left top;
            background-size: 28px 28px;
            background-position: 5px 15px;
            padding-left: 44px;
            padding-top: 4px;
        }

        #chaps>li>ul.hide {
            display: none;
        }

        #box-main {
            padding: 0px;
        }

        #header-box {
            height: 150px;
            background-color: rgb(44, 212, 217);
        }

        .header-image {
            height: 50px;
            background-color: rgb(255, 255, 255);
            /*border-radius: 5px;*/
            padding: 10px;
            margin-left: 65px;
            margin-top: 30px;
        }

        #header-title {
            color: white;
            font-size: 30px;
        }

        #header-contents {
            padding: 20px;
        }

        ol.header-contents-list li {
            line-height: 2;
        }

        ol.header-contents-list li::before {
            color: #5333ed;
        }

        .header-contents-list li a {
            text-decoration: none;
            font-family: 'Brandon Text'
        }

        body {
            overflow-x: visible;
        }
        table.highlighttable{
          background: #1C3041;
          margin-bottom: 20px;
          width: 100%;
          overflow-x: auto;
        }

        pre {
          font-family: 'Cousine', monospace;
          font-size: 15px;
          padding: 15px;
          overflow-x: auto;
          white-space: pre-wrap;
          word-wrap: break-word;
          text-align: justify;
        }
        td.linenos{
          width: 40px;
          border-right: 1px solid #6E7076;
        }
        .hide {
          display: none;
        }
        input::placeholder {
          color: grey;
        }
        input:focus::placeholder {
          color: #eee;
        }
        #search_bar_sidenav input{
          border-bottom-color: black;
          background: #eee;
        }
        #search_bar_sidenav svg{
          background: #eee;
          width: 30px;
        }

        table.markdown-table{
          margin-left: auto;
          margin-right: auto;
        }
        table.markdown-table td,
        th {
            padding: 10px;

        }

        table.markdown-table tr {
            border: 1px solid #dddddd;
        }
        table.markdown-table thead{
          color: #2cd4d9;
          font-weight: 500;
          text-align: center;
        }
        table.markdown-table span.inline-code{
          border: none;
          font-size: 13px;
          font-family: 'Cousine', monospace;
        }

        a.anchor-link {
          background-image: url('/images/hashtag.svg');
          background-size: 20px 20px;
          display: inline-block;
          width: 20px;
          height: 20px;
          opacity: 0.2;
        }

        .box:hover .row h3 a.anchor-link{
          opacity: 1;
        }

        i {
          font-style: italic;
        }

        /*768px*/

        @media only screen and (max-width: 47.9999em) {
            #features-group {
                position: relative;
                top: -0px;
                width: 400px;
                right: 0px;
                transform: scaleX(-1);
                filter: FlipH;
            }
            pre {
              font-size: 12px;
            }
        @media only screen and (max-width: 320px) {
            pre {
              font-size: 10px;
            }
        @media only screen and (max-width: 75em) {
          ul.bullet-list {
            list-style-type: none;
          }
        }

        }
    </style>
    <script type='text/javascript' src='/js/scripts/jquery.accordion.js'></script>
    <script type='text/javascript' src='/js/scripts/smoothscroll.js'></script>
    <script type='text/javascript' src='/js/scripts.js'></script>


    <script type="text/javascript">
        var $ = jQuery;
        $("#chaps > li").click(function() {
            $(this).find("ul.assignments").toggleClass('hide');
        });
        $('a[href^="#"]').click(function() {
            $('html, body').animate({
                scrollTop: $($(this).attr('href')).offset().top
            }, 500);
            return false;
        });
    </script>
    <script>
        (function(i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r;
            i[r] = i[r] || function() {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date();
            a = s.createElement(o),
                m = s.getElementsByTagName(o)[0];
            a.async = 1;
            a.src = g;
            m.parentNode.insertBefore(a, m)
        })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-89651019-1', 'auto');
        ga('send', 'pageview');
    </script>

    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/docsearch.js@2/dist/cdn/docsearch.min.js"></script>
    <script type="text/javascript">
    docsearch({
      apiKey: 'f929f0935053f931f73bce38eef57ba5',
      indexName: 'eta-lang',
      inputSelector: '#search-docs',
      debug: true // Set debug to true if you want to inspect the dropdown
    });
    docsearch({
      apiKey: 'f929f0935053f931f73bce38eef57ba5',
      indexName: 'eta-lang',
      inputSelector: '#min-search-docs',
      debug: true // Set debug to true if you want to inspect the dropdown
    });
    </script>
</body>

</html>
