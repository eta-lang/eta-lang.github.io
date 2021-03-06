<!DOCTYPE html>
<html lang="en-US">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="pinterest" content="nopin" />
    <title>Eta Proposals | The Eta Programming Language</title>
    <meta name="keywords" content="Eta Proposals, Eta, Haskell, Scala, Clojure, JVM, Functional Programming, Functional Programming on the JVM, Java Virtual Machine">
    <meta name="description" content="Proposals for Eta Programming Language." />
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
                    <h1 class='heading--large'>Eta Proposals</h1>
                    <p class='text--large mt--20'>Instructions to propose changes to Eta.</p>
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
                                <img alt="Eta Proposals" src='/images/proposal.svg' style="height: 100px;">
                                <h3 class='heading--medium mb--20'>
                                    Eta Proposals (EPs)
                                </h3>
                                <p class="mb--20 text--left">The Eta Programming Language development process is community-driven. Significant changes to the language, tools and the ecosystem must be discussed and documented before they can be implemented.</p>
                                <p class="text--left mb--20">This document contains the process for Eta Proposals (EPs) that specify precise changes to Eta and it's infrastructure.
                                </p>
                            </div>
                            <div class="col-lg-12 col-sm-12 col-xs-12 grey-box mt--0">
                                <ul class="color--grey">
                                    <li><a href="#start-ep">Starting an EP</a></li>
                                    <li><a href="#lifecycle-ep">Lifecycle of an EP</a></li>
                                    <li><a href="#implementing-ep">Implementing an EP</a></li>
                                    <li><a href="#comment-ep">Commenting on an EP</a></li>
                                    <li><a href="#questions">Questions?</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Bottom Feature Row -->
            <div class='row mt--20 center-xs' id="start-ep">
                <div class='col-lg-8 col-xs-12 col-sm-8'>
                    <div class='box box--padding--top--20'>
                        <div class="row">
                            <div class="col-lg-12 col-sm-12 center-sm center-xs" style="text-align: left">
                                <h3 class='heading--medium color--purple mb--20'>
                                    Starting an EP
                                </h3>
                                <p class="mb--20">
                                    When you have an idea for a major change and you are interested in writing a detailed proposal for it, you proceed as follows:
                                </p>
                                <ol class="bullet-list ml--20 mt--20 mb--20">
                                    <li>Post on the various communication channels to solicit feedback on the initial sketch of your idea, such as:
                                        <ul class="bullet-list-circle ml--20 mt--10 mb--10">
                                            <li><a href="https://gitter.im/typelead/eta">Gitter</a></li>
                                            <li><a href="https://slack.eta-lang.org/">Slack</a></li>
                                            <li><a href="https://groups.google.com/forum/#!forum/eta-discuss">Mailing List</a></li>
                                        </ul>
                                    </li>
                                    <p class="mb--20">This step is not required, but it is a good way to test the waters before devoting time to contemplating a design and/or implementation plan for your idea.</p>
                                    <li>If the feedback seems pretty positive, file an issue <a href="https://github.com/typelead/eta-proposals/issues">here</a> and the core Eta developers and other stakeholders will provide further feedback. Once it's clear that the proposal is desirable and feasible, a member of the TypeLead organization will give the go ahead to write a detailed proposal.
                                    </li>
                                    <li> To write a proposal, you should:
                                        <ul class="bullet-list-circle ml--20 mt--10 mb--10">
                                            <li>Fork <a href="https://github.com/typelead/eta-proposals">this repository</a>.</li>
                                            <li>Copy the template <span class="code-highlight">proposals/EP000-template.md</span> to
                                                <span class="code-highlight">proposals/EP000-[proposal-title].md</span> where
                                                <span class="code-highlight">[proposal-title] </span>should be an informative but concise title that describes the contents of the proposal.</li>
                                            <li>Address the questions in the template in a clear and detailed manner.</li>
                                            <li>Submit a pull request once you are done.</li>
                                        </ul>
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class='row mt--20 center-xs' id="lifecycle-ep">
                <div class='col-lg-8 col-xs-12 col-sm-8'>
                    <div class='box box--padding--top--20'>
                        <div class="row">
                            <div class="col-lg-12 col-sm-12 center-sm center-xs" style="text-align: left">
                                <h3 class='heading--medium color--purple mb--20'>
                                    Lifecycle of an EP
                                </h3>
                                <p class="mb--20">
                                    Once you have submitted a pull request, the Eta Proposal Process starts.
                                </p>
                                <ol class="bullet-list ml--20 mt--20 mb--20">
                                    <li>Your proposal will receive feedback from the community and you should revise the proposal accordingly. TypeLead members may organize meetings over Skype/Hangouts if the proposal has large tradeoffs.</li>
                                    <li>If it is clear the proposal will not be beneficial to the Eta ecosystem, a TypeLead member will close the pull request with a reason.</li>
                                    <li>If it is clear that the proposal, if implemented, can improve the user experience of the Eta ecosystem, and the proposal is complete, a TypeLead member will merge the pull request.</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class='row mt--20 center-xs' id="implementing-ep">
                <div class='col-lg-8 col-xs-12 col-sm-8'>
                    <div class='box box--padding--top--20'>
                        <div class="row">
                            <div class="col-lg-12 col-sm-12 center-sm center-xs" style="text-align: left">
                                <!-- Note -->
                                <h3 class='heading--medium color--purple mb--20'>
                                    Implementing an EP
                                </h3>
                                <p class="mb--20">Once a proposal has been merged, it can be in one of two states (indicated by a label): <span class="text--bold">active</span> or <span class="text--bold">proposed</span>.
                                </p>
                                <p>If it is active, it means the EP can be implemented in the near future. Proposals in this category will also be assigned one of three priority labels:
                                </p>
                                <ol class="bullet-list ml--20 mt--20 mb--20">
                                    <li><span class="text--bold">low :</span> Indicates that the proposal is relatively unimportant and can be implemented at any time.</li>
                                    <li><span class="text--bold">medium :</span> Indicates that the proposal may be implemented in the coming weeks.</li>
                                    <li><span class="text--bold">high :</span> Indicates that the proposal may be implemented within the next couple of days or within the next week.</li>
                                </ol>
                                <p class="mb--20">If it is <span class="text--bold">postponed</span>, it means the EP will not be implemented in the near future, but the status may change to active if conditions permit.</p>
                                <p>Moreover, if an implementation plan has not been specified in the proposal, a TypeLead member will provide a brief sketch of the implementation plan.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class='row mt--20 center-xs' id="comment-ep">
                <div class='col-lg-8 col-xs-12 col-sm-8'>
                    <div class='box box--padding--top--20'>
                        <div class="row">
                            <div class="col-lg-12 col-sm-12 center-sm center-xs" style="text-align: left">
                                <h3 class='heading--medium color--purple mb--20'>Commenting on an EP
                                </h3>
                                <p> When commenting on a proposal, the following guidelines should be followed: </p>
                                <ol class="bullet-list ml--20 mt--20 mb--20">
                                    <li><span class="text--bold">React to posts.</span> Use GitHub's reactions to posts if you have nothing substantial to say.</li>
                                    <li><span class="text--bold">Be respectful about potential flaws.</span> Do not try to bring down the proposal creator or other commentors.</li>
                                    <li><span class="text--bold">Give a proper arguments.</span>Your arguments should be straight to the point.</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class='row mt--20 center-xs mb--60' id="questions">
                <div class='col-lg-8 col-xs-12 col-sm-8'>
                    <div class='box box--padding--top--20'>
                        <div class="row">
                            <div class="col-lg-12 col-sm-12 center-sm center-xs" style="text-align: left">
                                <!-- Note -->
                                <h3 class='heading--medium color--purple mb--20'>
                                    Questions?
                                </h3>
                                <p> If you have any questions about the process, please: </p>
                                <ol class="bullet-list ml--20 mt--20 mb--20">
                                    <li>file an <a href="https://github.com/typelead/eta-proposals/issues/new">issue</a>.</li>
                                    <li>discuss with us on <a href="https://gitter.im/typelead/eta">Gitter</a></li>
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
</body>

</html>
