<!DOCTYPE html>
<html lang="en-US">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="pinterest" content="nopin" />
    <title>Bug Reporting | The Eta Programming Language</title>
    <meta name="keywords" content="Report Issue, Bug Report, Eta, Haskell, Scala, Clojure, JVM, Functional Programming, Functional Programming on the JVM, Java Virtual Machine">
    <meta name="description" content="Bug Reporting in Eta Programming Language." />
    <meta name="pinterest" content="nopin" />
    <link rel="canonical" href="https://eta-lang.org" />
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
    <link rel='stylesheet' href='/css/style.css' type='text/css' media='all' />
    <link href="https://fonts.googleapis.com/css?family=Cousine" rel="stylesheet">
    <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto%3A100%2C300%2C400%2C700&#038;ver=5a155dfba583c' type='text/css' media='all' />
    <link rel='stylesheet' id='jquery-slick-css' href='/css/slick.css' type='text/css' media='all' />
    <link rel='stylesheet' id='jquery-slick-theme-css' href='/css/slick-theme.css' type='text/css' media='all' />
    <script type='text/javascript' src='/js/jquery/jquery.js'></script>
    <script type='text/javascript' src='/js/jquery/jquery-migrate.min.js'></script>
    <script type='text/javascript' src='/js/slick.js'></script>
    <script async defer src="https://buttons.github.io/buttons.js"></script>
</head>

<body class="page-template page-template-custom-pages page-template-page page-template-features page-template-custom-pagespagefeatures-php page page-id-4566 object-4566">
    <div class='hero-container'>
        <mainHeader/>
        <div class='container hero-content col middle-xs'>
            <div class='row'>
                <div class='col-xs-12 col-sm-12 col-lg-12 color--white'>
                    <h1 class='heading--large'>Bug Report</h1>
                    <p class='text--large mt--20'>Instructions to file a bug report</p>
                </div>
            </div>
        </div>
    </div>
    <div class='bg--gray'>
        <div class='container pull--60'>
            <div class='row mt--20 center-xs'>
                <div class='col-lg-8 col-xs-12 col-sm-8'>
                    <div class='box box--padding--top--20'>
                        <div class="row">
                            <div class="col-lg-12 col-sm-12">
                                <img alt ="Bug Reports" src='/images/bugfixes.svg' style="height: 100px;">
                                <h3 class='heading--medium mb--20'>
                                    Submit bug reports
                                </h3>
                            </div>
                            <div class="col-lg-12 col-sm-12 col-xs-12 grey-box mt--0">
                                <ul class="color--grey">
                                    <li><a href="#found-bug">I think I found a bug in the compiler!</a></li>
                                    <li><a href="#duplicate-bug">How do I know the bug I found isn't a bug that already exists in the issue tracker?</a></li>
                                    <li><a href="#info-bug-report">What information should I include in a bug report?</a></li>
                                    <li><a href="#bug-support">I submitted a bug, but nobody has commented on it!</a></li>
                                    <li><a href="#eta-external-projects">What if I found a bug in other external projects/tools of Eta?</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class='row mt--20 center-xs' id="found-bug">
                <div class='col-lg-8 col-xs-12 col-sm-8'>
                    <div class='box box--padding--top--20'>
                        <div class="row">
                            <div class="col-lg-12 col-sm-12 center-sm center-xs" style="text-align: left">
                                <h3 class='heading--medium color--purple mb--20'>
                                    I think I found a bug in the compiler!
                                </h3>
                                <p class="mb--20">If you see this message: <span class="code-highlight">eta.exe: panic! (the 'impossible' happened)</span>, then you have definitely found a bug in the compiler. It's also possible that your code is not well-typed, but if you see this message, please fill a bug report on the <a href="https://github.com/typelead/eta/issues" target="_blank">Eta GitHub repository</a>.
                                </p>
                                <p>
                                    If you see a compiler error message confuses you, that's a bug too. We are working on improving error messages. please fill a bug report on the <a href="https://github.com/typelead/eta/issues" target="_blank">Eta GitHub repository</a>.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class='row mt--20 center-xs' id="duplicate-bug">
                <div class='col-lg-8 col-xs-12 col-sm-8'>
                    <div class='box box--padding--top--20'>
                        <div class="row">
                            <div class="col-lg-12 col-sm-12 center-sm center-xs" style="text-align: left">
                                <h3 class='heading--medium color--purple mb--20'>
                                    How do I know the bug I found isn't a bug that already exists in the issue tracker?
                                </h3>
                                <p class="mb--20">If you don't have enough time for a search, then don't worry about that. Just submit the bug. If it's a duplicate, somebody will notice that and close it.
                                </p>
                                <p>
                                    If you have the time for it, it would be great if you could search the <a href="https://github.com/typelead/eta/issues" target="_blank">issue tracker</a> to see if there is an existing bug similar to your problem. If there is, and it's an open bug, you can comment on that issue and say you are also affected. We will prioritize such bugs.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class='row mt--20 center-xs' id="info-bug-report">
                <div class='col-lg-8 col-xs-12 col-sm-8'>
                    <div class='box box--padding--top--20'>
                        <div class="row">
                            <div class="col-lg-12 col-sm-12 center-sm center-xs" style="text-align: left">
                                <h3 class='heading--medium color--purple mb--20'>
                                    What information should I include in a bug report?
                                </h3>
                                <p>It helps our diagnosis to include the following:
                                </p>
                                <ol class="bullet-list ml--20 mt--20 mb--20">
                                    <li>Include your specific OS. Example: Mac OS X 10.0.0, Windows 10, Ubuntu 12.04</li>
                                    <li>Steps to reproduce the bug. <br/>Example:<br/>
                                        <cite>Issue Name: OutOfMemoryError in eta.runtime.io.ByteArray.create</cite>
                                        <p class="mb--10">Etlas gives this error message when running <span class="code-highlight">etlas test</span> with missing dependencies:</p>
                                        <span class="code-highlight">etlas: Encountered missing dependencies: HUnit -any, hspec >=1.3, mockery -any, temporary -any
                    Run 'etlas install --dependencies-only' to install the dependencies.</span>
                                        <p class="mt--10">It should suggest to add the <span class="code-highlight">--enable-tests</span> flag.</p>
                                    </li>
                                    <li>If you get an exception, provide the full stacktrace. In case the stacktrace is too long put it in a GitHub gist and link it to the original bug report.
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class='row mt--20 center-xs' id="bug-support">
                <div class='col-lg-8 col-xs-12 col-sm-8'>
                    <div class='box box--padding--top--20'>
                        <div class="row">
                            <div class="col-lg-12 col-sm-12 center-sm center-xs" style="text-align: left">
                                <h3 class='heading--medium color--purple mb--20'>
                                    I submitted a bug, but nobody has commented on it!
                                </h3>
                                <p>
                                    This is sad, but does happen sometimes. If you submit a bug and you haven't heard back from us within 7 business days, please reach out to us via the <a href="https://gitter.im/typelead/eta" target="_blank">Eta Gitter channel</a>, or the <a href="https://groups.google.com/forum/#!forum/eta-discuss" target="_blank">Eta mailing list</a> regarding the status of the bug.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class='row mt--20 center-xs mb--60' id="eta-external-projects">
                <div class='col-lg-8 col-xs-12 col-sm-8'>
                    <div class='box box--padding--top--20'>
                        <div class="row">
                            <div class="col-lg-12 col-sm-12 center-sm center-xs" style="text-align: left">
                                <h3 class='heading--medium color--purple mb--20'>
                                    What if I found a bug in other external projects/tools of Eta?
                                </h3>
                                <p>If you found in other projects, file the bug report in the appropriate issue tracker:</p>
                                <ol class="bullet-list ml--20 mt--20 mb--20">
                                    <li><a href="https://github.com/typelead/eta-hackage/issues">Eta Hackage</a></li>
                                    <li><a href="https://github.com/typelead/gradle-eta/issues">Eta Gradle plugin</a></li>
                                    <li><a href="https://github.com/typelead/sbt-eta/issues">sbt-eta plugin</a></li>
                                    <li><a href="https://github.com/typelead/etlas/issues">Etlas</a></li>
                                    <li><a href="https://github.com/typelead/eta-ffi/issues">Eta FFI</a></li>
                                    <li><a href="https://github.com/rahulmutt/eta-fibers-dev/issues">Eta Fibers</a></li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <mainFooter/>

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
                /*background-image: -moz-linear-gradient( -30deg, rgb(0,0,77) 0%, rgb(83,51,237) 49%, rgb(44,212,217) 100%);
    background-image: -webkit-linear-gradient( -30deg, rgb(0,0,77) 0%, rgb(83,51,237) 49%, rgb(44,212,217) 100%);
    background-image: -ms-linear-gradient( -30deg, rgb(0,0,77) 0%, rgb(83,51,237) 49%, rgb(44,212,217) 100%);*/
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
        /*.box:hover{
	background-color: #E1EAF7;
}*/

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
        }

        a {
            text-decoration: none;
        }

        #startchaptertag::after {
            background: url("/images/right-arrow.svg");
        }
    </style>
    <script type='text/javascript' src='/js/scripts/jquery.accordion.js'></script>
    <script type='text/javascript' src='/js/scripts/smoothscroll.js'></script>
    <script type='text/javascript' src='/js/scripts.js'></script>
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

</html>
