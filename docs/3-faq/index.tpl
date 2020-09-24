<!DOCTYPE html>
<html lang="en-US">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="pinterest" content="nopin" />
    <title>FAQs | The Eta Programming Language</title>
    <link rel="canonical" href="https://eta-lang.org" />
    <meta name="keywords" content="FAQ, Eta, Haskell, Scala, Clojure, JVM, Functional Programming, Functional Programming on the JVM, Java Virtual Machine">
    <meta name="description" content="FAQ of Eta Programming Language." />
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

    <!-- at the end of the HEAD -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/docsearch.js@2/dist/cdn/docsearch.min.css" />

</head>

<body class="page-template page-template-custom-pages page-template-page page-template-features page-template-custom-pagespagefeatures-php page page-id-4566 object-4566">

    <!-- Hero Section -->
    <div class='hero-container'>
        <mainHeader/>
        <div class='container hero-content col middle-xs'>
            <div class='row'>
                <div class='col-xs-12 col-sm-12 col-lg-12 color--white'>
                    <h1 class='heading--large'>FAQ</h1>
                    <p class='text--large mt--20'>Answers to our most popular questions</p>
                    <div class="resource-bar__search pt--10 show-lg-only">
                      <div class="resource-bar__search_placeholder">
                        <form class="row middle-xs submitter nocol" method="get" action="">
                          <input id="search-docs" name="s" type="text" required="required" value="" placeholder="" style="border-bottom: 1px solid white;">
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
                    <div class='box box--padding--top--20'>
                        <div class="row">
                            <div class="col-lg-12 col-sm-12">
                                <img src='/images/faq.svg' style="height: 100px;">
                                <h3 class='heading--medium mb--20'>
                                    Most Popular FAQs
                                </h3>
                            </div>
                            <div class="col-lg-12 col-sm-12 col-xs-12 grey-box mt--0">
                                <ul class="color--grey">
                                    <li><a href="#what-is-eta">What is Eta?</a></li>
                                    <li><a href="#eta-name-origin">Where does the name “Eta” come from?</a></li>
                                    <li><a href="#is-eta-ready-to-use">Is Eta ready to use?</a></li>
                                    <li><a href="#eta-handle-tco">How does Eta handle TCO?</a></li>
                                    <li><a href="#is-eta-compatible-ghc8">Will Eta be compatible with GHC 8?</a></li>
                                    <li><a href="#is-eta-part-of-ghc">Why not make Eta a part of GHC? What will be different about the two?</a></li>
                                    <li><a href="#eta-compare-performance-ghc">How does Eta compare to GHC in performance?</a></li>
                                    <li><a href="#eta-not-haskell">Why Eta and not Haskell?</a></li>
                                    <li><a href="#eta-different-from-haskell">How different is Eta from GHC?</a></li>
                                    <li><a href="#eta-vs-frege">How is Eta different from Frege?</a></li>
                                    <li><a href="#eta-support-clr">Will Eta support CLR/.NET?</a></li>
                                    <li><a href="#eta-on-android">Can I build Android apps in Eta?</a></li>
                                    <li><a href="#opt-in-eta-telemetry">How do I opt-in for telemetry?</a></li>
                                    <li><a href="#opt-out-eta-telemetry">How do I opt-out of telemetry?</a></li>
                                    <li><a href="#character-encoding-eta">How do I change character encoding of eta programs output?</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Bottom Feature Row -->
            <div class='row mt--20 center-xs' id="what-is-eta">
                <div class='col-lg-8 col-xs-12 col-sm-8'>
                    <div class='box box--padding--top--20'>
                        <div class="row">
                            <div class="col-lg-12 col-sm-12 center-sm center-xs" style="text-align: left">
                                <!-- <img alt="Three offset squares creating an architecture block" src='/images/etaeco.svg' style="height: 100px;"> -->
                                <h3 class='heading--medium color--purple mb--20'>
                                    What is Eta?
                                </h3>
                                <p>Eta is a dialect of Haskell that aims to bring the benefits of Haskell to the JVM, while supporting the vast majority of GHC extensions so that packages on Hackage can be used with little modification.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class='row mt--20 center-xs' id="eta-name-origin">
                <div class='col-lg-8 col-xs-12 col-sm-8'>
                    <div class='box box--padding--top--20'>
                        <div class="row">
                            <div class="col-lg-12 col-sm-12 center-sm center-xs" style="text-align: left">
                                <!-- <img alt="Three offset squares creating an architecture block" src='/images/etaeco.svg' style="height: 100px;"> -->
                                <h3 class='heading--medium color--purple mb--20'>
                                    Where does the name “Eta” come from?
                                </h3>
                                <p>The name originates from eta reduction, the transformation <cite>f x = g x => f = g</cite> which makes lazy FP programs a bit simpler and more efficient. Moreover, eta in Greek happens to be the letter H in reference to Haskell.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class='row mt--20 center-xs' id="is-eta-ready-to-use">
                <div class='col-lg-8 col-xs-12 col-sm-8'>
                    <div class='box box--padding--top--20'>
                        <div class="row">
                            <div class="col-lg-12 col-sm-12 center-sm center-xs" style="text-align: left">
                                <!-- Note -->
                                <h3 class='heading--medium color--purple mb--20'>
                                    Is Eta ready to use?
                                </h3>
                                <p>Yes! You can compile the vast majority of programs that GHC Haskell 7.10.3 can along with some additional extensions and interoperate with Java, Scala, and Clojure with ease.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class='row mt--20 center-xs' id="eta-handle-tco">
                <div class='col-lg-8 col-xs-12 col-sm-8'>
                    <div class='box box--padding--top--20'>
                        <div class="row">
                            <div class="col-lg-12 col-sm-12 center-sm center-xs" style="text-align: left">
                                <!-- Note -->
                                <h3 class='heading--medium color--purple mb--20'>
                                    How does Eta handle TCO?
                                </h3>
                                <p>At compile-time, tail-recursive calls are optimized into loops. At run-time, if you want to enable tail call optimization for a particular evaluation sequence, you can use the trampoline function from the Data.Function module.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class='row mt--20 center-xs' id="is-eta-compatible-ghc8">
                <div class='col-lg-8 col-xs-12 col-sm-8'>
                    <div class='box box--padding--top--20'>
                        <div class="row">
                            <div class="col-lg-12 col-sm-12 center-sm center-xs" style="text-align: left">

                                <h3 class='heading--medium color--purple mb--20'>
                                    Will Eta be compatible with GHC 8?
                                </h3>
                                <!-- Note -->
                                <p>Our policy is to adopt new features and bug fixes on a need basis. If there are compelling, practical use cases for a given extension, we will definitely backport it. A list of extensions we have plans to backport in the future are:
                                </p>
                                <ol class="bullet-list ml--20 mt--20 mb--20">
                                    <li>BlockArguments</li>
                                    <li>QuantifiedConstraints</li>
                                    <li>TypeApplications</li>
                                    <li>UnboxedSums</li>
                                </ol>
                                <p>We will probably not support the TypeInType extension in the near future because dependent kinds can be a bit difficult to learn and teach.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class='row mt--20 center-xs' id="is-eta-part-of-ghc">
                <div class='col-lg-8 col-xs-12 col-sm-8'>
                    <div class='box box--padding--top--20'>
                        <div class="row">
                            <div class="col-lg-12 col-sm-12 center-sm center-xs" style="text-align: left">

                                <h3 class='heading--medium color--purple mb--20'>
                                    Why not make Eta a part of GHC? What will be different about the two?
                                </h3>

                                <p class="mb--20">Eta will be a language with commercial support, backed by TypeLead. Therefore, our foremost priority is making the language stable, fast, and building a wide user base. This may conflict with the primary goal of GHC - to be a research platform for cutting-edge CS research. We believe that GHC being able to realize its goal and survive for decades is commendable and we have an amazing language as a result of its of labor.
                                </p>
                                <p class="mb--20">But we are also big fans of Haskell and we are disappointed that it’s used so little in industry. We feel that Haskell can solve many big problems in software development, but there’s no concerted effort in solving the infrastructure/tooling problems that are required for large-scale, industrial use. We hope that we can solve these with Eta. We have met one of the largest industry requirements with Eta: interoperability with the Java ecosystem.
                                </p>
                                <p>
                                    We will continue to tackle more problems, optimistic that we can reach the wider programming community down the line if we solve the right problems at the right time. We will focus on the user experience and address the problems that are preventing Haskell-like languages from infiltrating industry including enterprise-grade libraries, an industry-grade IDE, comprehensive documentation, and online training. We will open source most of our work so that the Haskell community can use it if it’s helpful.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class='row mt--20 center-xs' id="eta-compare-performance-ghc">
                <div class='col-lg-8 col-xs-12 col-sm-8'>
                    <div class='box box--padding--top--20'>
                        <div class="row">
                            <div class="col-lg-12 col-sm-12 center-sm center-xs" style="text-align: left">
                                <!-- Note -->
                                <h3 class='heading--medium color--purple mb--20'>
                                    How does Eta compare to GHC in performance?
                                </h3>
                                <!-- Note -->
                                <p>Benchmarks show that Eta can be within the performance of GHC in a few cases and within 2x in many other cases after JIT optimizations. We’ve made several performance improvements since the project started and we will continue to make more. Performance is one of our highest priorities and we are actively looking for new ways to squeeze out a couple of percentage points when we can. The JVM is evolving to support functional programming constructs, so we are optimistic that Eta will benefit from these advances.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class='row mt--20 center-xs' id="eta-not-haskell">
                <div class='col-lg-8 col-xs-12 col-sm-8'>
                    <div class='box box--padding--top--20'>
                        <div class="row">
                            <div class="col-lg-12 col-sm-12 center-sm center-xs" style="text-align: left">
                                <!-- Note -->
                                <h3 class='heading--medium color--purple mb--20'>
                                    Why Eta and not Haskell?
                                </h3>
                                <!-- Note -->
                                <p class="mb--20">Haskell carries 26 years of psychology and perception that was built around the language. It’s a language that many want to learn but give up because of peripheral reasons. Haskell has built a reputation over the years for being hard to learn, having brittle tooling, and missing useful libraries found in many other programming languages. We feel that this should be changed. We want Eta to be known for its focus on industrial use, comprehensive documentation, and extensive tooling.
                                </p>
                                <p>Moreover, using the JVM as a platform will allow Eta to take advantage of a well-engineered and battle-tested garbage collector, a whole host of Just-In-Time compiler optimizations at runtime, and a vast ecosystem of libraries for almost any task. 
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class='row mt--20 center-xs' id="eta-different-from-haskell">
                <div class='col-lg-8 col-xs-12 col-sm-8'>
                    <div class='box box--padding--top--20'>
                        <div class="row">
                            <div class="col-lg-12 col-sm-12 center-sm center-xs" style="text-align: left">
                                <!-- Note -->
                                <h3 class='heading--medium color--purple mb--20'>
                                    How different is Eta from GHC?
                                </h3>
                                <!-- Note -->
                                <p class="mb--20">It’s very similar. In fact, it’s almost identical other than the Foreign Function Interface. The diverging changes will be those that can also be useful for GHC, but haven’t been implemented yet due to lack of resources, time, and priority.
                                </p>
                                <p class="mb--20">For example, we want to extend the type system to support row-type polymorphism and new syntax for anonymous record types as they have shown to be very successful in Elm and PureScript. We also want to focus on the necessary runtime changes to allow support for composable distributed systems. Cloud Haskell currently has limited runtime support with static pointers, but we want to go beyond, exploring Eden-style distribution.
                                </p>
                                <p>When we do make such diverging changes, we will present a sketch of the implementation to the GHC devs and the relevant commits in Eta and anyone interested in integrating it to the GHC codebase is free to do so.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class='row mt--20 center-xs' id="eta-vs-frege">
                <div class='col-lg-8 col-xs-12 col-sm-8'>
                    <div class='box box--padding--top--20'>
                        <div class="row">
                            <div class="col-lg-12 col-sm-12 center-sm center-xs" style="text-align: left">
                                <!-- Note -->
                                <h3 class='heading--medium color--purple mb--20'>
                                    How is Eta different from Frege?
                                </h3>
                                <!-- Note -->
                                <p class="mb--20">Eta is strategically designed so that Hackage packages can be compiled with little modification, allowing reuse of existing infrastructure. This is done by supporting many of the GHC-specific extensions that are used heavily in popular libraries.
                                </p>
                                <p>On the other hand, Frege, while it supports basic Haskell, lacks many of the key extensions required to compile Hackage, and hence cannot reuse the existing infrastructure. Moreover, because Eta uses a modified version of GHC’s frontend, we have access to all the powerful and well-tuned optimizations that Frege does not.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class='row mt--20 center-xs' id="eta-support-clr">
                <div class='col-lg-8 col-xs-12 col-sm-8'>
                    <div class='box box--padding--top--20'>
                        <div class="row">
                            <div class="col-lg-12 col-sm-12 center-sm center-xs" style="text-align: left">
                                <!-- Note -->
                                <h3 class='heading--medium color--purple mb--20'>
                                    Will Eta support CLR/.NET?
                                </h3>
                                <p>Because of the similarity of Java bytecode and CLR bytecode, the code generator can be ported quite easily. The nontrivial part is porting the runtime. There are no plans for supporting it as of now, but in the distant future, it may be a possibility. It all depends on popular demand.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class='row mt--20 center-xs' id="eta-on-android">
                <div class='col-lg-8 col-xs-12 col-sm-8'>
                    <div class='box box--padding--top--20'>
                        <div class="row">
                            <div class="col-lg-12 col-sm-12 center-sm center-xs" style="text-align: left">
                                <!-- Note -->
                                <h3 class='heading--medium color--purple mb--20'>
                                    Can I build Android apps in Eta?
                                </h3>
                                <!-- Note -->
                                <p>Yes, you can! See <a href="https://github.com/Jyothsnasrinivas/eta-android-2048">https://github.com/Jyothsnasrinivas/eta-android-2048</a> for an example setup. </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class='row mt--20 center-xs' id="opt-in-eta-telemetry">
                <div class='col-lg-8 col-xs-12 col-sm-8'>
                    <div class='box box--padding--top--20'>
                        <div class="row">
                            <div class="col-lg-12 col-sm-12 center-sm center-xs" style="text-align: left">
                                <!-- Note -->
                                <h3 class='heading--medium color--purple mb--20'>
                                    How do I opt-in for telemetry?
                                </h3>
                                <!-- Note -->
                                <ol class="bullet-list ml--20 mt--20 mb--20">
                                    <li>Locate your Etlas config file.
                                        <ul class="ml--20 mt--10 mb--10 bullet-list-circle">
                                            <li>On Unix-based systems like Linux and Mac, <span class="code-highlight">~/.etlas/config</span></li>
                                            <li>On Windows, <span class="code-highlight">%APPDATA%\Roaming\etlas\config</span>.</li>
                                        </ul>
                                    </li>
                                    <li>Open the file with a text editor.</li>
                                    <li>Locate the <span class="code-highlight">send-metrics:</span> field and change the value to <span class="code-highlight">True</span>.</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class='row mt--20 center-xs' id="opt-out-eta-telemetry">
                <div class='col-lg-8 col-xs-12 col-sm-8'>
                    <div class='box box--padding--top--20'>
                        <div class="row">
                            <div class="col-lg-12 col-sm-12 center-sm center-xs" style="text-align: left">
                                <!-- Note -->
                                <h3 class='heading--medium color--purple mb--20'>
                                    How do I opt-out of telemetry?
                                </h3>
                                <!-- Note -->
                                <ol class="bullet-list ml--20 mt--20 mb--20">
                                    <li>Locate your Etlas config file.
                                        <ul class="ml--20 mt--10 mb--10 bullet-list-circle">
                                            <li>On Unix-based systems like Linux and Mac, <span class="code-highlight">~/.etlas/config</span></li>
                                            <li>On Windows, <span class="code-highlight">%APPDATA%\Roaming\etlas\config</span>.</li>
                                        </ul>
                                    </li>
                                    <li>Open the file with a text editor.</li>
                                    <li>Locate the <span class="code-highlight">send-metrics:</span>field and change the value to <span class="code-highlight">False</span>.</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class='row mt--20 mb--60 center-xs' id="character-encoding-eta">
                <div class='col-lg-8 col-xs-12 col-sm-8'>
                    <div class='box box--padding--top--20'>
                        <div class="row">
                            <div class="col-lg-12 col-sm-12 center-sm center-xs" style="text-align: left">
                                <!-- Note -->
                                <h3 class='heading--medium color--purple mb--20'>
                                    How do I change character encoding of Eta programs output?
                                </h3>
                                <!-- Note -->
                                <p>Most modern Linux/Unix systems has utf-8 as default character encoding and almost surely java will use it for output so you will not have many problems. However on windows ones the story is a little bit more complex:
                                </p>
                                <ol class="bullet-list ml--20 mt--20 mb--20">
                                    <li>The default console character encoding usually is <span class="code-highlight">ibm850</span> or similar.</li>
                                    <li>The default system wide encoding varies depending on lang settings but it usually doesn’t to match the console one (f.e. <span class="code-highlight">windows-1252)</span>. Java (and eta) uses it as default char encoding.</li>
                                    <li>Not all windows systems supports well <span class="code-highlight">utf-8</span> (as code page <span class="code-highlight">65001</span>) or simply does not support it.</li>
                                </ol>
                                <p class="mb--20">So you usually are going to have to change the default java character encoding to get a correct output of non-ascii chars. Fortunately eta programs launcher scripts uses the environment variables <span class="code-highlight">$JAVA_ARGS</span> and <span class="code-highlight">$ETA_JAVA_ARGS</span> so you can do change java default char encoding with <span class="code-highlight">ETA_JAVA_ARGS="-Dfile.encoding=my_encoding"</span>. You can determine <span class="code-highlight">my_encoding code</span> in the <a href="https://docs.oracle.com/javase/8/docs/technotes/guides/intl/encoding.doc.html" target="_blank">current java supported charsets page</a>.
                                </p>
                                <p>For example, to get an <span class="code-highlight">utf-8</span> output in a windows system you should:</p>
                                <ol class="bullet-list ml--20 mt--20 mb--20">
                                    <li>Change the console font to one that supports unicode characters (f.e. <span>Lucida</span>).</li>
                                    <li>Change the encoding of console to <span>utf-8</span> with the command <span>chcp 65001</span>. Without a suitable font the command will fail without notice any error.</li>
                                    <li>Tell etlas you want to use it when executing eta programs with set <span>ETA_JAVA_ARGS="-Dfile.encoding=UTF-8"</span>.</li>
                                </ol>
                                <p class="mb--20">Of course you can use <span class="code-highlight">$JAVA_ARGS</span> or <span class="code-highlight">$ETA_JAVA_ARGS</span> to change java file encoding in Linux/Unix systems if you have to do it.
                                </p>
                                <p>The current behaviour of eta programs when you try to output chars that are not supported in the current file encoding is to throw an error (<span class="code-highlight">&lt;stdout&gt;: commitBuffer: failed </span>), like ghc.
                                </p>
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
