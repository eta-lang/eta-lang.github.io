<!DOCTYPE html>
<html lang="en-US">

<head>
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="pinterest" content="nopin" />
    <title>Gradle Plugin Cheatsheet | The Eta Programming Language</title>
    <link rel="canonical" href="https://eta-lang.org" />
    <meta name="keywords" content="Cheatsheet, Eta, Haskell, Scala, Clojure, JVM, Functional Programming, Functional Programming on the JVM, Java Virtual Machine">
    <meta name="description" content="Cheatsheet of Eta Programming Language." />
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
    <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto%3A100%2C300%2C400%2C700&#038;ver=5a155dfba583c' type='text/css' media='all' />
    <link rel='stylesheet' id='jquery-slick-css' href='/css/slick.css' type='text/css' media='all' />
    <link rel='stylesheet' id='jquery-slick-theme-css' href='/css/slick-theme.css' type='text/css' media='all' />
    <link rel='stylesheet' href='/css/eta-theme.css' type='text/css' media='all' />
    <link href="https://fonts.googleapis.com/css?family=Cousine" rel="stylesheet">
    <script type='text/javascript' src='/js/jquery/jquery.js'></script>
    <script type='text/javascript' src='/js/jquery/jquery-migrate.min.js'></script>
    <script type='text/javascript' src='/js/slick.js'></script>

    <!-- at the end of the HEAD -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/docsearch.js@2/dist/cdn/docsearch.min.css" />

</head>

<body class="page-template page-template-custom-pages page-template-page page-template-features page-template-custom-pagespagefeatures-php page page-id-4566 object-4566">
    <div class='hero-container'>
      <mainHeader/>
      <div class='container hero-content col middle-xs'>
          <div class='row'>
              <div class='col-xs-12 col-sm-12 col-lg-12 color--white'>
                  <h1 class='heading--large'>Gradle Plugin Cheatsheet</h1>

                  <p class='text--large mt--20'>A quick reference for gradle-eta plugin</p>
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
    <div class='bg--gray'>
        <div class='container pull--60'>
            <div class='row mt--20 center-xs'>
                <div class='col-lg-8 col-xs-12 col-sm-8'>
                    <div class='box box--padding--top--20' id="main-box">
                        <div class="row">
                            <div class="col-lg-12 col-sm-12">
                                <h3 class='heading--medium mb--20 color--purple'>
                Input and Output
              </h3>

                                <div class="highlight text--left mt--30">
                                    <pre style="margin-left: -8px; font-family: 'Cousine', monospace; font-size: 12px;">

      <span class="kr">module</span> <span class="nn">Main</span> <span class="kr">where</span>
      <span class="nf">main</span> <span class="ow">::</span> <span class="kt">IO</span> <span class="nb">()</span>
      <span class="nf">main</span> <span class="ow">=</span> <span class="n">putStrLn</span> <span class="s">&quot;Hello World!&quot;</span>
  </pre>
                                </div>
                                <img class="pt--30" src='/images/eta-compiler.svg'>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class='row mt--50 center-lg'>
                <div class='col-lg-12'>
                    <h2 class='heading--large color--purple mb--20'>
          Basics
        </h2>
                </div>
            </div>


                        <div class='row mt--20 center-xs'>

                            <div class='col-xs-12 col-sm-4'>

                                <div class='box box--padding--top--20 text--left'>
                                    <h3 class='heading--small color--purple mb--20 mt--20'>
                        Gradle Assemble
                      </h3>
                                    <p class="mt--20 pb--20 pt--20 pl--20 color--white" style="background: #1C3041; font-family: 'Cousine', monospace; font-size: 12px;">$ ./gradlew assemble</p>
                                </div>

                            </div>
                            <div class='col-xs-12 col-sm-4 mt--xs--20'>
                              <div class='box box--padding--top--20 text--left'>
                                  <h3 class='heading--small color--purple mb--20 mt--20'>
                      Gradle Build
                    </h3>
                                  <p class="mt--20 pb--20 pt--20 pl--20 color--white" style="background: #1C3041; font-family: 'Cousine', monospace; font-size: 12px;">$ ./gradlew build</p>
                              </div>
                            </div>
                            <div class='col-xs-12 col-sm-4 mt--xs--20'>
                              <div class='box box--padding--top--20 text--left'>
                                  <h3 class='heading--small color--purple mb--20 mt--20'>
                      Gradle Test
                    </h3>
                                  <p class="mt--20 pb--20 pt--20 pl--20 color--white" style="background: #1C3041; font-family: 'Cousine', monospace; font-size: 12px;">$ ./gradlew test</p>
                              </div>
                            </div>
                        </div>

                        <div class='row mt--20 center-xs pt--50'>
                          <div class="col-lg-8 col-xs-12">
                            <div class='box box--padding--top--20 text--left'>
                                <h3 class='heading--small color--purple mb--20 mt--20'>
                    Add the gradle wrapper to the project
                  </h3>
                                <p class="mt--20 pb--20 pt--20 pl--20 color--white" style="background: #1C3041; font-family: 'Cousine', monospace; font-size: 12px;">$ gradle wrapper --gradle-version 4.7</p>
                            </div>
                          </div>
                        </div>

                        <div class='row mt--50 center-lg'>
                            <div class='col-lg-12'>
                                <h2 class='heading--large color--purple mb--20'>
                      Configuring Gradle DSL
                    </h2>
                            </div>
                        </div>

            <div class='row mt--20 center-xs mt--50'>
                <div class='col-xs-12 col-sm-6'>

                    <div class='box box--padding--top--20 text--left'>
                        <h3 class='heading--small color--purple mb--20 mt--20'>
            Eta Plugin
          </h3>
          <p>This is used for standard JVM projects</p>
          <div class="highlight mt--20 pt--10 pb--10 pl--10 pr--10">
          <pre style="overflow-x: auto;"><span></span>plugins {
    id 'com.typelead.eta' version '0.6.0'
}
</pre>
</div>
                    </div>

                </div>
                <div class='col-xs-12 col-sm-6 mt--xs--20'>
                  <div class='box box--padding--top--20 text--left'>
                      <h3 class='heading--small color--purple mb--20 mt--20'>
          Eta Base Plugin
        </h3>
        <p>This is used for configuring your Eta versions for your entire project</p>
        <div class="highlight mt--20 pt--10 pb--10 pl--10 pr--10">
        <pre style="overflow-x: auto;"><span></span>plugins {
  id 'com.typelead.eta.base' version '0.6.0'
}
</pre>
</div>
                  </div>
                </div>

            </div>

            <div class='row mt--20 center-xs mt--50'>
                <div class='col-xs-12 col-sm-6'>

                    <div class='box box--padding--top--20 text--left'>
                        <h3 class='heading--small color--purple mb--20 mt--20'>
            Library
          </h3>
          <div class="highlight mt--20 pt--10 pb--10 pl--10 pr--10">
            <pre style="overflow-x: auto;"><span></span>eta {
    version = '0.8.6b1'
    etlasVersion = '1.5.0.0'
}
</pre>
</div>
                    </div>

                </div>
                <div class='col-xs-12 col-sm-6 mt--xs--20'>
                  <div class='box box--padding--top--20 text--left'>
                      <h3 class='heading--small color--purple mb--20 mt--20'>
          Excecutable
        </h3>
        <div class="highlight mt--20 pt--10 pb--10 pl--10 pr--10">
          <pre style="overflow-x: auto;"><span></span>apply plugin: 'application'

eta {
  version = '0.8.6b1'
  etlasVersion = '1.5.0.0'
}
</pre>
</div>
                  </div>
                </div>

            </div>


            <div class='row mt--50 center-lg'>
                <div class='col-lg-12'>
                    <h2 class='heading--large color--purple mb--20'>
          Configuring Dependencies
        </h2>
                </div>
            </div>

            <div class='row mt--20 center-xs pb--100'>

                <div class='col-xs-12 col-sm-4'>
                  <div class='box box--padding--top--20 text--left'>
                      <h3 class='heading--small color--purple mb--20 mt--20'>
          One dependency
        </h3>
        <div class="highlight pt--10 pb--10 pl--10 pr--10">
        <pre class="overflow-x: auto;"><span></span>dependencies {
  compile eta('base:4.8.2.0')
}
</pre>
</div>
                  </div>

                </div>
                <div class='col-xs-12 col-sm-4 mt--xs--20'>
                  <div class='box box--padding--top--20 text--left'>
                      <h3 class='heading--small color--purple mb--20 mt--20'>
          Two dependencies
        </h3>
        <div class="highlight pt--10 pb--10 pl--10 pr--10">
          <pre style="overflow-x: auto;"><span></span>dependencies {
  compile eta('base:4.8.2.0')
  compile eta('array:0.5.2.0')
}
          </pre>
</div>
                  </div>
                </div>
                <div class='col-xs-12 col-sm-4 mt--xs--20'>
                  <div class='box box--padding--top--20 text--left'>
                      <h3 class='heading--small color--purple mb--20 mt--20'>
          Alternative for two dependencies
        </h3>
        <div class="highlight pt--10 pb--10 pl--10 pr--10">
          <pre style="overflow-x: auto;"><span></span>dependencies {
  compile eta('base:4.8.2.0', 'array:0.5.2.0')
}
</pre>
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

            #peace-of-mind-group + div {
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

            #support-that-cares-group + div {
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

            #features-group + div {
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

            #features-group + div {
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
            }

            a {
                text-decoration: none;
            }

            #startchaptertag::after {
                background: url("/images/right-arrow.svg");
            }

            table {
                border-collapse: collapse;
                width: 100%;
            }

            td,
            th {
                padding: 10px;
            }

            tr {
                border: 1px solid #dddddd;
            }

            span.code-highlight {
                border: none;
                font-size: 13px;
            }
            .heading--medium::before{
              background-image: url('/images/hashtag.svg');
              background-size: 20px 20px;
              display: inline-block;
              width: 20px;
              height: 20px;
              content:"";
              opacity: 0.2;
            }
            span.inline-code{
              font-size: 12px;
            }
            #main-box:hover .heading--medium::before {
              opacity: 1;
              }
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

        <!-- at the end of the BODY -->
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/docsearch.js@2/dist/cdn/docsearch.min.js"></script>
        <script type="text/javascript"> docsearch({
         apiKey: 'f929f0935053f931f73bce38eef57ba5',
         indexName: 'eta-lang',
         inputSelector: '#search-docs',
         debug: true // Set debug to true if you want to inspect the dropdown
        });
        </script>

</body>

</html>
