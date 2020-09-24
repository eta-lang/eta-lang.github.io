<!DOCTYPE html>
<html lang="en-US">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="pinterest" content="nopin" />
    <title>GSoC 2018 | The Eta Programming Language</title>
    <link rel="canonical" href="https://eta-lang.org" />
    <meta name="keywords" content="GSoC 2018, Eta, Haskell, Scala, Clojure, JVM, Functional Programming, Functional Programming on the JVM, Java Virtual Machine">
    <meta name="description" content="GSoC ideas list of Eta Programming Language." />
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/styles/default.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/highlight.min.js"></script>
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
                    <h1 class='heading--large'>Google Summer of Code 2018</h1>
                    <p class='text--large mt--20'>This is work in progress for the upcoming GSoC 2018</p>
                </div>
            </div>
        </div>

    </div>
    <div class='bg--gray'>
        <div class='container pull--60'>
            <div class='row mt--20 center-xs'>
                <div class='col-lg-12 col-xs-12 col-sm-8'>
                    <div class='box box--padding--top--20 main-box'>
                        <div class="row">
                            <div class="col-lg-12 col-sm-12">
                                <img src='/images/gsoc-logo.jpg' style="height: 100px;">
                                <h3 class='heading--medium mb--20 mt--20'>
                                    Google Summer of Code 2018
                                </h3>
                                <p>Eta has been accepted for <a href="https://summerofcode.withgoogle.com/">GSoC 2018</a> to work with students and help them work on interesting projects to make the Eta ecosystem better. We have provided a list of project ideas on this page to provide some inspiration for students to come up with their own ideas or use the existing ones.</p>
                                <p>Students are expected to go through the ideas and be able to analyze the idea and be able to explain all the different parts of the codebase that must be modified in order to implement the idea.</p>
                                <p><b>Note:</b> Students can submit one or more proposals. But only one will be selected.</p>
                            </div>
                        </div>
                        <div class="row mt--40">
                          <div class="col-lg-4 start-lg">
                            <a class="button--purple" href="#ideas">Ideas list</a>
                          </div>
                          <div class="col-lg-4 center-lg">
                            <a class="button--purple" href="#application-process">Application Process</a>
                          </div>
                          <div class="col-lg-4 end-lg">
                            <a class="button--purple" href="#application-template">Application Template</a>
                          </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row center-lg" id="ideas">
              <div class="col-lg-12 center-lg">
                <h2 class="heading--large color--purple mt--50 mb--20">Ideas List</h2>
              </div>
            </div>
            <div class='row mt--20 center-xs'>
                <div class='col-xs-12 col-sm-6'>
                    <a href="#dashboard" style="text-decoration: none">
                        <div class='box box--padding--top--20'>
                            <img alt="Performance Dashboard" src='/images/dashboard.svg'>
                            <h3 class='heading--small mb--20'>
                                Peformance Dashboard
                            </h3>
                            <p style="color: grey;">Generate a web interface that displays Eta's performance over time</p>
                        </div>
                    </a>
                </div>
                <div class='col-xs-12 col-sm-6 mt--xs--20'>
                    <a href="#type-error" style="text-decoration: none">
                        <div class='box box--padding--top--20'>
                            <img alt="Type Error Messages" src='/images/types.svg' height="128px;">
                            <h3 class='heading--small mb--20'>
                                Better Type Error Messages
                            </h3>
                            <p style="color: grey">Re-structure the typechecker to support rich error reporting</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class='row mt--20 center-xs'>

                <div class='col-xs-12 col-sm-6'>
                    <a href="#eta-android" style="text-decoration: none;">
                        <div class='box box--padding--top--20'>
                            <img alt="Eta on Android" src='/images/eta-android.svg'>
                            <h3 class='heading--small mb--20'>
                                Eta on Android <span>&trade;</span>
                            </h3>
                            <p style="color: grey;">Support for practical Android <span>&trade;</span> Development with Eta</p>
                        </div>
                    </a>
                </div>

                <div class='col-xs-12 col-sm-6 mt--xs--20'>
                    <a href="#web-server-fibers" style="text-decoration: none;">
                        <div class='box box--padding--top--20'>
                            <img alt="Web Server Fibers" src='/images/contribute.svg'>
                            <h3 class='heading--small mb--20'>
                                High Performance Web Server with Fibers
                            </h3>
                            <p style="color: grey;">Implement a highly scalable web server with lightweight threads</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class='row mt--20 center-xs'>
                <div class='col-xs-12 col-sm-6'>
                    <a href="#reproducible-builds" style="text-decoration: none">
                        <div class='box box--padding--top--20'>
                            <img alt="Reproducible builds" src='/images/builds.svg'>
                            <h3 class='heading--small mb--20'>
                                Reproducible Builds
                            </h3>
                            <p style="color: grey;">Allow Eta to be integrated into extensible build systems like Bazel</p>
                        </div>
                    </a>
                </div>
                <div class='col-xs-12 col-sm-6 mt--xs--20'>
                    <a href="#invoke" style="text-decoration: none">
                        <div class='box box--padding--top--20'>
                            <img alt="Invoke Dynamic" src='/images/invoke.svg'>
                            <h3 class='heading--small mb--20'>
                                Invoke Dynamic Support
                            </h3>
                            <p style="color: grey;">Use the new <span class="text--blood">invokedynamic</span> bytecode instruction to make Eta faster</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class='row mt--20 center-xs'>
                <div class='col-xs-12 col-sm-6'>
                    <a href="#vertx" style="text-decoration: none">
                        <div class='box box--padding--top--20'>
                            <img alt="Vertx Support" src='/images/vertx.svg'>
                            <h3 class='heading--small mb--20'>
                                Vert.x Support
                            </h3>
                            <p style="color: grey;">Eta support for a popular framework for building asynchronous/reactive applications on the JVM</p>
                        </div>
                    </a>
                </div>
                <div class='col-xs-12 col-sm-6 mt--xs--20'>
                    <a href="#purity" style="text-decoration: none">
                        <div class='box box--padding--top--20'>
                            <img alt="Purity and Nullability" src='/images/purity.svg' height="128px;">
                            <h3 class='heading--small mb--20'> Purity & Nullability Analysis
                            </h3>
                            <p style="color: grey;">Develop an intelligent analysis tool for Java libraries to automate the FFI generation process</p>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <div class="container mt--120 mt--xs--60">
            <div class="row">
                <div class="col-xs-12 col-sm-6 mt--60 mt--xs--20" id="dashboard">
                    <h3 class="heading--large">Performance Dashboard</h3>
                    <p class="text--large mt--20">
                        On every commit to the <span class="text--bold">master</span> branch of the Eta repository, benchmarks are run to see how each change to the compiler is affecting the performance of compiled programs. The goal of this project is to generate a simple web application that allows you to travel through time and compare performance of various benchmarks. </p>

                </div>
                <div class="col-sm-6 center-sm middle-sm">
                    <img alt="Performance Dashboard" src="/images/dashboard.svg" style="height: 200px; margin-top: 50px;">
                </div>
            </div>
            <div class="tabs mt--60 mb--80 mb--xs--0 mt--xs--40">
                <div class="tabs__nav nocol row center-xs around-xs tabs__nav--arrow">
                    <div class="nocol row middle-xs start-xs active" data-src="#peace-1">
                        <span class="heading--small">Resources</span>
                    </div>
                    <div class="row nocol middle-xs" data-src="#peace-2">
                        <span class="heading--small">Mentors</span>
                    </div>
                </div>
                <div class="box tab__content-container" id="box-contribute">
                    <div class="tabs__content">
                        <div class="tabs__section" id="peace-1" style="display:block;">
                            <h3 class="heading--medium"> Resources</h3>
                            <div class="row gutter--huge mt--30">
                                <div class="col-xs-12 col-sm-12">
                                    <ul class="bullet-list">
                                        <li><a href="https://github.com/typelead/eta-benchmarks">eta-benchmarks</a></li>
                                        <li><a href="https://hackage.haskell.org/package/gipeda">gipedia</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="tabs__section" id="peace-2" style="display: none;">
                            <h3 class="heading--medium"> Mentors </h3>
                            <div class="row gutter--huge mt--30">
                                <div class="col-xs-12 col-sm-12">
                                  <ul class="bullet-list">
                                    <li><a href="https://github.com/Jyothsnasrinivas" target="_blank">Jyothsna Patnam</a></li>
                                  </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container mt--120 mt--xs--60">
            <!-- Header -->
            <div class="row">
                <div class="col-xs-12 col-sm-6 mt--60 mt--xs--20" id="type-error">
                    <h3 class="heading--large"> Better Type Error Messages</h3>
                    <p class="text--large mt--20">
                        The error messages produced by Eta can be a bit hard to read and figure out if one is not familiar with how the typechecking process works in the compiler. What we would like is for type error messages to directly give users suggestions on what the most probable mistake was in their code. This will yield a significant boost in developer productivity and make it easier for beginners to troubleshoot type errors. The goal of this project is to re-structure the typechecker in the Eta compiler to support the new error reporting mechanism mentioned above and design a heuristic for generating good suggestions to the user.
                    </p>

                </div>
                <div class="col-sm-6 center-sm middle-sm">
                    <img alt="Type Error Messages" src="/images/types.svg" style="height: 200px; margin-top: 50px;">
                </div>
            </div>
            <div class="tabs mt--60 mb--80 mb--xs--0 mt--xs--40">
                <div class="tabs__nav nocol row center-xs around-xs tabs__nav--arrow">
                    <div class="nocol row middle-xs start-xs active" data-src="#peace-1">
                        <span class="heading--small"> Resources</span>
                    </div>
                    <div class="row nocol middle-xs" data-src="#peace-2">
                        <span class="heading--small"> Mentors</span>
                    </div>
                </div>
                <div class="box tab__content-container" id="box-contribute">
                    <div class="tabs__content">
                        <div class="tabs__section" id="peace-1" style="display: block;">
                            <h3 class="heading--medium"> Resources</h3>
                            <div class="row gutter--huge mt--30">
                                <div class="col-xs-12 col-sm-12">
                                    <ul class="bullet-list">
                                        <li><a href="https://github.com/typelead/eta/tree/master/compiler/ETA/TypeCheck">Eta's TypeChecker</a></li>
                                        <li><a href="https://cs.nyu.edu/wies/publ/finding_minimum_type_error_sources.pdf">Paper on Type Errors</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="tabs__section" id="peace-2" style="display: none;">
                            <h3 class="heading--medium"> Mentors </h3>
                            <div class="row gutter--huge mt--30">
                                <div class="col-xs-12 col-sm-12">
                                  <ul class="bullet-list">
                                    <li><a href="https://github.com/NickSeagull" target="_blank">Nikita Tchayka</a></li>
                                    <li><a href="https://github.com/Jyothsnasrinivas" target="_blank">Jyothsna Patnam</a></li>
                                  </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container mt--120 mt--xs--60">
            <div class="row">
                <div class="col-xs-12 col-sm-6 mt--60 mt--xs--20" id="eta-android">
                    <h3 class="heading--large">
                        Eta on Android <span>&trade;</span></h3>
                    <p class="text--large mt--20">
                        The bytecode generated by Eta is compatible with Java 7 so using Eta on Android should be possible. Currently, working with Eta on Android requires a lot of manual steps and requires coordination among different build tools. This project aims to make it easy to do Android development in Eta. This project consists of the following components:
                    </p>
                </div>
                <div class="col-sm-6 center-sm middle-sm">
                    <img alt="Eta on Android" src="/images/eta-android.svg" style="height: 200px; margin-top: 50px;">
                </div>
            </div>
            <div class="tabs mt--60 mb--80 mb--xs--0 mt--xs--40">
                <div class="tabs__nav nocol row center-xs around-xs tabs__nav--arrow">
                    <div class="nocol row middle-xs start-xs active" data-src="#peace-1">
                        <span class="heading--small">
            Gradle Plugin Support</span>
                    </div>
                    <div class="row nocol middle-xs" data-src="#peace-2">

                        <span class="heading--small">
             Framework</span>
                    </div>
                    <div class="row nocol middle-xs" data-src="#peace-3">

                        <span class="heading--small">
            Resources</span>
                    </div>
                    <div class="row middle-xs nocol" data-src="#peace-4">
                        <span class="heading--small">
            Mentors</span>
                    </div>
                </div>
                <div class="box tab__content-container" id="box-contribute">
                    <div class="tabs__content">
                        <!-- Tab 1 -->
                        <div class="tabs__section" id="peace-1" style="display: block;">
                            <h3 class="heading--medium">
                                Gradle Plugin Support </h3>
                            <div class="row gutter--huge mt--30">
                                <div class="col-xs-12 col-sm-12">
                                    <p>
                                        The existing Eta Gradle Plugin should be extended to support the Android development workflow and packaging code into an APK.</p>
                                </div>

                            </div>
                        </div>
                        <!-- / Tab 1 -->

                        <!-- Tab 2 -->
                        <div class="tabs__section" id="peace-2" style="display: none;">
                            <h3 class="heading--medium">
                                Framework</h3>

                            <div class="row gutter--huge mt--30">
                                <div class="col-xs-12 col-sm-12">
                                    <p>
                                        A framework should be written in Eta that takes advantage of Eta's purity and type-safety. </p>
                                </div>

                            </div>
                        </div>
                        <!-- / Tab 2 -->

                        <!-- Tab 3 -->
                        <div class="tabs__section" id="peace-3" style="display: none;">
                            <h3 class="heading--medium">
                                Resources</h3>

                            <div class="row gutter--huge mt--30">
                                <div class="col-xs-12 col-sm-12">
                                    <ul class="bullet-list">
                                        <li><a href="https://github.com/typelead/gradle-eta" target="_blank">Eta Gradle Plugin</a></li>
                                        <li><a href="http://tools.android.com/build/gradleplugin" target="_blank">Android Gradle Plugin</a></li>
                                    </ul>
                                </div>

                            </div>
                        </div>
                        <!-- / Tab 3 -->

                        <!-- Tab 4 -->
                        <div class="tabs__section" id="peace-4" style="display: none;">
                            <h3 class="heading--medium">
                                Mentors</h3>

                            <div class="row gutter--huge mt--30">
                                <div class="col-xs-12 col-sm-12">
                                  <ul class="bullet-list">
                                      <li><a href="https://github.com/puffnfresh" target="_blank">Brian McKenna</a></li>
                                  </ul>
                                </div>

                            </div>
                        </div>
                        <!-- / Tab 4 -->

                    </div>
                </div>
                <!-- / Tab Content -->

            </div>
            <!-- / Tabbed Section -->

        </div>

        <div class="container mt--120 mt--xs--60">
            <!-- Header -->
            <div class="row">
                <div class="col-xs-12 col-sm-6 mt--60 mt--xs--20" id="web-server-fibers">
                    <h3 class="heading--large">
                        High Performance Web Server with Fibers</h3>
                    <p class="text--large mt--20">
                        Eta has experimental support for Fibers, a lightweight threading mechanism that lets the developer have control over when to yield the thread. A good test of their effectiveness is to write a non-trivial application - a web server.
                    </p>
                </div>
                <div class="col-sm-6 center-sm middle-sm">
                    <img alt="Web Server with Fibers" src="/images/contribute.svg" style="height: 200px; margin-top: 50px;">
                </div>
            </div>
            <!-- Header -->

            <!-- Tabbed Section -->
            <div class="tabs mt--60 mb--80 mb--xs--0 mt--xs--40">

                <!-- Tabs -->
                <div class="tabs__nav nocol row center-xs around-xs tabs__nav--arrow">
                    <div class="nocol row middle-xs start-xs active" data-src="#peace-1">

                        <span class="heading--small">
              Haskell Warp Re-Implementation</span>
                    </div>
                    <div class="row nocol middle-xs" data-src="#peace-2">

                        <span class="heading--small">
              Resources</span>
                    </div>
                    <div class="row nocol middle-xs" data-src="#peace-3">

                        <span class="heading--small">
              Mentors</span>
                    </div>

                </div>
                <!-- / Tabs -->

                <!-- Tab Content -->
                <div class="box tab__content-container" id="box-contribute">
                    <div class="tabs__content">
                        <!-- Tab 1 -->
                        <div class="tabs__section" id="peace-1" style="display: block;">
                            <h3 class="heading--medium">
                                Haskell Warp Reimplementation</h3>
                            <div class="row gutter--huge mt--30">
                                <div class="col-xs-12 col-sm-12">

                                    <p>
                                        Haskell already has a web server implementation called <a href="https://hackage.haskell.org/package/warp">warp</a>. The goal of this project is to re-implement Warp using Fibers. It requires that the student first implement non-blocking I/O support for Fibers and then proceed to the web server implementation.</p>
                                </div>

                            </div>
                        </div>
                        <!-- / Tab 1 -->

                        <!-- Tab 2 -->
                        <div class="tabs__section" id="peace-2" style="display: none;">
                            <h3 class="heading--medium">
                                Resources</h3>

                            <div class="row gutter--huge mt--30">
                                <div class="col-xs-12 col-sm-12">
                                    <ul class="bullet-list">
                                        <li><a href="https://www.youtube.com/watch?v=ZuJg2cfmSmw" target="_blank">Talk on Eta Fibers</a></li>
                                        <li><a href="https://github.com/rahulmutt/eta-fibers-dev" target="_blank">eta-fibers-dev</a></li>
                                        <li><a href="https://hackage.haskell.org/package/warp" target="_blank">Warp</a></li>
                                    </ul>

                                </div>

                            </div>
                        </div>
                        <!-- / Tab 2 -->

                        <!-- Tab 3 -->
                        <div class="tabs__section" id="peace-3" style="display: none;">
                            <h3 class="heading--medium">
                                Mentors </h3>

                            <div class="row gutter--huge mt--30">
                                <div class="col-xs-12 col-sm-12">
                                  <ul class="bullet-list">
                                    <li><a href="https://github.com/agocorona" target="_blank">Alberto G Corona</a></li>
                                    <li><a href="https://github.com/jneira" target="_blank">Javier Neira</a> (Secondary Mentor)</li>
                                  </ul>
                                </div>

                            </div>
                        </div>
                        <!-- / Tab 3 -->


                    </div>
                </div>
                <!-- / Tab Content -->

            </div>
            <!-- / Tabbed Section -->

        </div>

        <div class="container mt--120 mt--xs--60">
            <!-- Header -->
            <div class="row">
                <div class="col-xs-12 col-sm-6 mt--60 mt--xs--20" id="reproducible-builds">
                    <h3 class="heading--large">
                        Reproducible Builds</h3>
                    <p class="text--large mt--20">
                        Given the same source files, Eta does not produce the same classfiles every time those source files are provided as input. Internally, the compiler assigns a unique integer to every program entity and that integer can change every time you build your program due to various source of non-determinism. Thus, the hash of the output classfiles will change across rebuilds of the same source files, which can mean that it can cause re-builds to be inefficient in systems like
                        <a href="https://bazel.build/" target="_blank">Bazel</a>.
                    </p>
                </div>
                <div class="col-sm-6 center-sm middle-sm">
                    <img alt="Reproducible Builds" src="/images/builds.svg" style="height: 200px; margin-top: 50px;">
                </div>
            </div>
            <!-- Header -->

            <!-- Tabbed Section -->
            <div class="tabs mt--60 mb--80 mb--xs--0 mt--xs--40">

                <!-- Tabs -->
                <div class="tabs__nav nocol row center-xs around-xs tabs__nav--arrow">
                    <div class="nocol row middle-xs start-xs active" data-src="#peace-1">

                        <span class="heading--small">
                Non-determinism</span>
                    </div>
                    <div class="row nocol middle-xs" data-src="#peace-2">

                        <span class="heading--small">
                Resources</span>
                    </div>
                    <div class="row nocol middle-xs" data-src="#peace-3">

                        <span class="heading--small">
                Mentors</span>
                    </div>

                </div>
                <!-- / Tabs -->

                <!-- Tab Content -->
                <div class="box tab__content-container" id="box-contribute">
                    <div class="tabs__content">
                        <!-- Tab 1 -->
                        <div class="tabs__section" id="peace-1" style="display: block;">
                            <h3 class="heading--medium">
                                Non-determism</h3>
                            <div class="row gutter--huge mt--30">
                                <div class="col-xs-12 col-sm-12">
                                    <p>
                                        The goal of this project is to investigate all the source of non-determinism. A lot of this work has already been done in GHC 8, so it boils down to analyzing those changes individually and incorporating them into the Eta codebase without changing the existing compilation behavior. </p>
                                </div>

                            </div>
                        </div>
                        <!-- / Tab 1 -->

                        <!-- Tab 2 -->
                        <div class="tabs__section" id="peace-2" style="display: none;">
                            <h3 class="heading--medium">
                                Resources</h3>

                            <div class="row gutter--huge mt--30">
                                <div class="col-xs-12 col-sm-6">
                                    <ul class="bullet-list">
                                        <li><a href="https://ghc.haskell.org/trac/ghc/wiki/DeterministicBuilds" target="_blank">GHC Trac Wiki</a></li>
                                        <li><a href="https://ghc.haskell.org/trac/ghc/ticket/4012" target="_blank">GHC Trac #4012</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- / Tab 2 -->

                        <!-- Tab 3 -->
                        <div class="tabs__section" id="peace-3" style="display: none;">
                            <h3 class="heading--medium">
                                Mentors</h3>

                            <div class="row gutter--huge mt--30">
                                <div class="col-xs-12 col-sm-12">
                                  <ul class="bullet-list">
                                    <li><a href="https://github.com/johnynek">Oscar Boykin</a></li>
                                  </ul>
                                </div>
                            </div>
                        </div>
                        <!-- / Tab 3 -->


                    </div>
                </div>
                <!-- / Tab Content -->

            </div>
            <!-- / Tabbed Section -->

        </div>

        <div class="container mt--120 mt--xs--60">
            <!-- Header -->
            <div class="row">
                <div class="col-xs-12 col-sm-6 mt--60 mt--xs--20" id="invoke">
                    <h3 class="heading--large">
                        Invoke Dynamic Support</h3>
                    <p class="text--large mt--20">
                        Eta produces classfiles that are Java 7 compatible so that we leave open the option of running on Android in the future. At the same time, the newer JVM versions have incorporated support for a new bytecode instruction called <a href="https://docs.oracle.com/javase/7/docs/technotes/guides/vm/multiple-language-support.html">invokedynamic</a> that effectively allows you to define custom method dispatch behavior while allowing the JVM's Just-In Time compiler (JIT) to optimize it as it normally would.
                    </p>
                </div>
                <div class="col-sm-6 center-sm middle-sm">
                    <img alt="Invoke Dynamic" src="/images/invoke.svg" style="height: 200px; margin-top: 50px;">
                </div>
            </div>
            <!-- Header -->

            <!-- Tabbed Section -->
            <div class="tabs mt--60 mb--80 mb--xs--0 mt--xs--40">

                <!-- Tabs -->
                <div class="tabs__nav nocol row center-xs around-xs tabs__nav--arrow">
                    <div class="nocol row middle-xs start-xs active" data-src="#peace-1">

                        <span class="heading--small">
                  Benefits of Invoke Dynamic</span>
                    </div>
                    <div class="row nocol middle-xs" data-src="#peace-2">

                        <span class="heading--small">
                  Resources</span>
                    </div>
                    <div class="row nocol middle-xs" data-src="#peace-3">

                        <span class="heading--small">
                  Mentors</span>
                    </div>

                </div>
                <!-- / Tabs -->

                <!-- Tab Content -->
                <div class="box tab__content-container" id="box-contribute">
                    <div class="tabs__content">
                        <!-- Tab 1 -->
                        <div class="tabs__section" id="peace-1" style="display: block;">
                            <h3 class="heading--medium">
                                Benefits of Invoke Dynamic</h3>
                            <div class="row gutter--huge mt--30">
                                <div class="col-xs-12 col-sm-12">
                                    <ul class="bullet-list">
                                        <li>Fast implementation of PAPs (partial application or curried functions).</li>
                                        <li>Improve performance of lazy evaluation by optimizing out volatile reads on thunks.</li>
                                        <li>Reduce generated code size by deferring code generation of thunks and closures to runtime.</li>
                                    </ul>
                                </div>

                            </div>
                        </div>
                        <div class="tabs__section" id="peace-2" style="display: none;">
                            <h3 class="heading--medium">
                                Resources</h3>

                            <div class="row gutter--huge mt--30">
                                <div class="col-xs-12 col-sm-12">
                                    <ul class="bullet-list">
                                        <li><a href="https://www.youtube.com/watch?v=0vfFHMGESVQ" target="_blank">Talk on InvokeDynamic</a></li>
                                        <li><a href="https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-6.html#jvms-6.5.invokedynamic" target="_blank">Invokedynamic Reference</a></li>
                                    </ul>
                                </div>

                            </div>
                        </div>
                        <!-- / Tab 2 -->

                        <!-- Tab 3 -->
                        <div class="tabs__section" id="peace-3" style="display: none;">
                            <h3 class="heading--medium">
                                Mentors </h3>

                            <div class="row gutter--huge mt--30">
                                <div class="col-xs-12 col-sm-12">
                                  <ul class="bullet-list">
                                    <li><a href="https://github.com/rahulmutt" target="_blank">Rahul Muttineni</a></li>
                                  </ul>
                                </div>

                            </div>
                        </div>
                        <!-- / Tab 3 -->


                    </div>
                </div>
                <!-- / Tab Content -->

            </div>
            <!-- / Tabbed Section -->

        </div>

        <div class="container mt--120 mt--xs--60">
            <!-- Header -->
            <div class="row">
                <div class="col-xs-12 col-sm-6 mt--60 mt--xs--20" id="vertx">
                    <h3 class="heading--large">
                        Vert.x Support</h3>
                    <p class="text--large mt--20">
                        <a href="http://vertx.io">Vert.x</a> is a popular framework for building asynchronous/reactive applications on the JVM. Integration to this library will provide access to a whole host of asynchronous libraries in the Vert.x ecosystem. The goal of this project is to adapt Eta's Fibers (see above) to support fibered, non-blocking API bindings to Vert.x libraries.
                    </p>
                </div>
                <div class="col-sm-6 center-sm middle-sm">
                    <img alt="Vertx Support" src="/images/vertx.svg" style="height: 200px; margin-top: 50px;">
                </div>
            </div>
            <!-- Header -->

            <!-- Tabbed Section -->
            <div class="tabs mt--60 mb--80 mb--xs--0 mt--xs--40">

                <!-- Tabs -->
                <div class="tabs__nav nocol row center-xs around-xs tabs__nav--arrow">
                    <div class="nocol row middle-xs start-xs active" data-src="#peace-1">
                        <span class="heading--small">
                    Resources</span>
                    </div>
                    <div class="row nocol middle-xs" data-src="#peace-3">
                        <span class="heading--small">
                    Mentors</span>
                    </div>

                </div>
                <!-- / Tabs -->

                <!-- Tab Content -->
                <div class="box tab__content-container" id="box-contribute">
                    <div class="tabs__content">
                        <!-- Tab 1 -->
                        <div class="tabs__section" id="peace-1" style="display: block;">
                            <h3 class="heading--medium">
                                Resources</h3>
                            <div class="row gutter--huge mt--30">
                                <div class="col-xs-12 col-sm-12">
                                    <ul class="bullet-list">
                                        <li><a href="http://vertx.io/">Vert.x Home Page</a></li>
                                        <li><a href="https://github.com/typelead/eta/issues/572">Vert.x Support Issue</a></li>
                                        <li><a href="http://vertx.io/docs/vertx-sync/java/">Vert.x Sync</a></li>
                                    </ul>
                                </div>

                            </div>
                        </div>

                        <!-- / Tab 2 -->

                        <!-- Tab 3 -->
                        <div class="tabs__section" id="peace-3" style="display: none;">
                            <h3 class="heading--medium">
                                Mentors </h3>

                            <div class="row gutter--huge mt--30">
                                <div class="col-xs-12 col-sm-12">
                                  <ul class="bullet-list">
                                    <li><a href="https://github.com/rahulmutt" target="_blank">Rahul Muttineni</a></li>
                                  </ul>
                                </div>

                            </div>
                        </div>
                        <!-- / Tab 3 -->


                    </div>
                </div>
                <!-- / Tab Content -->

            </div>
            <!-- / Tabbed Section -->

        </div>

        <div class="container mt--120 mt--xs--60">
            <!-- Header -->
            <div class="row">
                <div class="col-xs-12 col-sm-6 mt--60 mt--xs--20" id="purity">
                    <h3 class="heading--large">Purity & Nullability Analysis</h3>
                    <p class="text--large mt--20">
                      When binding to Java libraries using Eta's Foreign Function Interface (FFI) mechanism, the user needs to know the Java library well enough to decide whether the object in question is pure or impure (requires a pure or monadic return type) and to decide whether to wrap the return type in a <span class="text--bold">Maybe</span>, indicating that the result may be <span class="text--bold">null</span>. If the user fails to do either of these correctly, and doesn't go with the worst-case option of making the return type monadic and wrapped in a <span class="text--bold">Maybe</span>, strange bugs can ensue.
                    </p>
                    <p class="text--large mt--20">
                      The goal of this project is to develop a tool that can take a Java library as input and classify each method and field's purity and nullability, so that we can feed that data into an FFI generator to automate highly precise bindings for Java libraries.
                    </p>
                </div>
                <div class="col-sm-6 center-sm middle-sm">
                    <img alt="Purity and Nullability" src="/images/purity.svg" style="height: 200px; margin-top: 50px;">
                </div>
            </div>
            <!-- Header -->

            <!-- Tabbed Section -->
            <div class="tabs mt--60 mb--80 mb--xs--0 mt--xs--40">

                <!-- Tabs -->
                <div class="tabs__nav nocol row center-xs around-xs tabs__nav--arrow">
                    <div class="nocol row middle-xs start-xs active" data-src="#peace-1">
                        <span class="heading--small">
                  Resources</span>
                    </div>
                    <div class="row nocol middle-xs" data-src="#peace-2">
                        <span class="heading--small">
                  Mentors</span>
                    </div>

                </div>
                <!-- / Tabs -->

                <!-- Tab Content -->
                <div class="box tab__content-container" id="box-contribute">
                    <div class="tabs__content">
                        <!-- Tab 1 -->
                        <div class="tabs__section" id="peace-1" style="display: block;">
                            <h3 class="heading--medium">
                                Resources</h3>
                            <div class="row gutter--huge mt--30">
                                <div class="col-xs-12 col-sm-12">
                                    <ul class="bullet-list">
                                        <li><a href="https://pdfs.semanticscholar.org/5998/6d3a7e152f478f63bede801dd5ec4a5f94a8.pdf">Research Paper on Purity Analysis</a></li>
                                        <li><a href="https://github.com/typelead/eta-ffi">eta-ffi</a></li>
                                    </ul>
                                </div>

                            </div>
                        </div>

                        <!-- / Tab 2 -->

                        <!-- Tab 3 -->
                        <div class="tabs__section" id="peace-2" style="display: none;">
                            <h3 class="heading--medium">
                                Mentors </h3>

                            <div class="row gutter--huge mt--30">
                                <div class="col-xs-12 col-sm-12">
                                  <ul class="bullet-list">
                                    <li><a href="https://github.com/rahulmutt" target="_blank">Rahul Muttineni</a></li>
                                  </ul>
                                </div>

                            </div>
                        </div>
                        <!-- / Tab 3 -->


                    </div>
                </div>
                <!-- / Tab Content -->

            </div>
            <!-- / Tabbed Section -->

        </div>
        <div class="container">
          <div class='row mt--20 center-xs' id="application-process">
              <div class='col-lg-12 col-xs-12 col-sm-8'>
                  <div class='box box--padding--top--20 main-box'>
                      <div class="row">
                          <div class="col-lg-12 col-sm-12">
                              <h3 class='heading--medium color--purple mb--20 mt--20'>
                                Application Process
                              </h3>
                              <p>Read the <a href="https://google.github.io/gsocguides/student/">student guide of GSoC</a>. The application process is as follows:</p>
                              <ol class="bullet-list text--left ml--20 mt--20">
                                <li>Pick some ideas from the <a href="#ideas">Ideas List</a> that interested you or think of your own.</li>
                                <li>Join the Google Group and start discussions about the ideas from (1) and solicit feedback from the community.</li>
                                <li>Contribute at least one code patch to any of the <a href="https://github.com/typelead">Eta</a> repositories. Check the issues labelled with <a href="https://github.com/typelead/eta/labels/help%20wanted">help-wanted</a> and <a href="https://github.com/typelead/eta/labels/low-hanging-fruit">low-hanging-fruit</a> to start with easy issues.</li>
                                <li>Develop your application according to the template below. Put it in a shareable location like Google Docs or GitHub Gist and share your application for
                                  early review.</li>
                                <li><span class="text--bold">Be sure to submit your application atleast a day before the deadline [March 27, 2018 at 1600 hours UTC].</span></li>
                              </ol>
                          </div>

                      </div>
                  </div>
              </div>
          </div>
          <div class='row mt--80 mt--xs-20 center-xs' id="application-template">
              <div class='col-lg-12 col-xs-12 col-sm-8'>
                  <div class='box box--padding--top--20 main-box'>
                      <div class="row">
                          <div class="col-lg-12 col-sm-12">
                              <h3 class='heading--medium color--purple mb--20 mt--20'>
                                Application Template
                              </h3>
                              <ol class="bullet-list text--left ml--20 mt--20">
                                <li><span class="text--bold">Contact Information:</span> Name, email address, github username, address.</li>
                                <li>What do you like about functional programming? What do you dislike about functional programming?</li>
                                <li><span class="text--bold">Educational background:</span> Degree plan, school, major, research area, publications etc.</li>
                                <li>Mention links to all successfully merged pull requests to Eta-related open-source projects and also any other open-source projects.</li>
                                <li>What are your plans for the summer outside of GSoC? Mention vacations, classes, and internships.</li>
                                <li>Propose the project you would like to work on for the summer.</li>
                                    <ul class="bullet-list ml--30">
                                      <li>Must include a timeline with specific milestones (preferably weekly/biweekly)</li>
                                      <li>Mention the resources you will be using including libraries, frameworks, and algorithms.</li>
                                      <li>Mention which aspects of the project you will figure out on the go.</li>
                                    </ul>
                                <li>If you are unable to reach your milestone for a given week, how will you handle the backlog to ensure that you finish the project for the summer?</li>
                                <li>How do you handle burn-out?</li>
                                <li><span class="text--bold">(Optional)</span> Provide contact information for any people who understand the coding side of you.</li>
                                <li><span class="text--bold">(Optional)</span> We believe in diversity and we would like to encourage more women to participate in open-source projects. How do you propose we accomplish this?</li>
                              </ol>
                          </div>

                      </div>
                  </div>
              </div>
          </div>
      </div>
  </div>

    <div class="bg--blue--purple mt--80 mb--80 pt--80 pb--80">
        <div class='container mt--160 mb--60'>

            <!-- Header -->
            <div class='text--center'>
                <h3 class='heading--large mb--10 color--white'>
                    Quick links to students</h3>
                <p class='text--large color--white'>
                    We’ve curated resources to help you get started faster with Eta depending on your needs.</p>
            </div>
            <!-- / Header -->

            <div class='boxes--alternating mt--60'>

                <div class='box'>
                    <div class='row gutter-medium middle-xs center-xs start-sm'>
                        <div class='col-xs-12 col-sm-4 text--center'>
                            <img alt="Cheatsheet" src='/images/guides.svg'>
                        </div>
                        <div class='col-xs-12 col-sm-8'>
                            <h4 class='mb--10 heading--small'>
                                <a class='text--link' href='/docs/cheatsheets'> Eta Cheatsheets           </a>
                            </h4>
                            <p>
                                A quick reference for Eta.
                            </p>

                            <a class='mt--20 button--small button--ghost--purple' href="/docs/cheatsheets"> Learn More          </a>

                        </div>
                    </div>
                </div>

                <div class='box'>
                    <div class='row gutter-medium middle-xs center-xs start-sm'>
                        <div class='col-xs-12 col-sm-4 text--center'>
                            <img alt="Tour of Eta" src='/images/tour.svg'>
                        </div>
                        <div class='col-xs-12 col-sm-8'>
                            <h4 class='mb--10 heading--small'>
                                <a class='text--link' href='https://tour.eta-lang.org/'> Tour of Eta            </a>
                            </h4>
                            <p>
                                Learn functional programming the easy way.
                            </p>

                            <a class='mt--20 button--small button--ghost--purple' href="https://tour.eta-lang.org/"> Learn More          </a>

                        </div>
                    </div>
                </div>

                <!-- Feature 2 -->
                <div class='box'>
                    <div class='row gutter-medium middle-xs center-xs start-sm'>
                        <div class='col-xs-12 col-sm-4 text--center'>
                            <img alt="Java Interop" src='/images/interact.svg'>
                        </div>
                        <div class='col-xs-12 col-sm-8'>
                            <h4 class='mb--10 heading--small'>
                                <a class='text--link' href='/docs/user-guides/eta-user-guide/java-interop/java-interop-basics'> Interacting with Java            </a>
                            </h4>
                            <p>
                                Learn how Eta handles different Java elements.
                            </p>

                            <a class='mt--20 button--small button--ghost--purple' href="/docs/user-guides/eta-user-guide/java-interop/java-interop-basics"> Learn More          </a>

                        </div>
                    </div>
                </div>
                <!-- / Feature 2 -->

                <!-- Feature 1 -->
                <div class='box'>
                    <div class='row gutter-medium middle-xs center-xs start-sm'>
                        <div class='col-xs-12 col-sm-4 text--center'>
                            <img alt="Getting Started" src='/images/startup.svg'>
                        </div>
                        <div class='col-xs-12 col-sm-8'>
                            <h4 class='mb--10 heading--small'>
                                <a class="text--link" href="/docs/user-guides/eta-user-guide/introduction/what-is-eta"> Getting started with Eta            </a>
                            </h4>
                            <p>
                                Read up Eta's background, installation process.
                            </p>

                            <a class='mt--20 button--small button--ghost--purple' href="/docs/user-guides/eta-user-guide/introduction/what-is-eta"> Learn More          </a>

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
            /*margin-top:-102px;*/
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

        .box:hover {
            background-color: #E1EAF7;
        }

        #box-contribute:hover {
            background-color: #ffffff;
        }

        .main-box:hover{
          background-color: #ffffff;
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
