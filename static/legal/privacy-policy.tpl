<!DOCTYPE html>
<html lang="en-US">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="theme-color" content="#ffffff ">
    <title>Legal - privacy | The Eta Programming Language</title>
    <meta name="description" content="Privacy of Eta Programming Language." />
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
    <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto%3A100%2C300%2C400%2C700&#038;ver=5a15749b3014b' type='text/css' media='all' />
    <link rel='stylesheet' id='jquery-slick-css' href='/css/slick.css' type='text/css' media='all' />
    <link rel='stylesheet' id='jquery-slick-theme-css' href='/css/slick-theme.css' type='text/css' media='all' />
    <script type='text/javascript' src='/js/jquery/jquery.js'></script>
    <script type='text/javascript' src='/js/jquery/jquery-migrate.min.js'></script>
    <script type='text/javascript' src='/js/slick.js'></script>
</head>

<body class="page-template page-template-custom-pages page-template-page page-template-page-no-sidebar page-template-custom-pagespagepage-no-sidebar-php page page-id-4664 object-4664">
    <div class='bg--gradient--dark-light-blue'>
      <mainHeader/>
    </div>
    <div class='container'>
        <div class='row'>
            <div class='col-xs-12 pb--80'>

                <!-- # Post Content -->
                <div class="post-4664 page type-page status-publish hentry">

                    <h1 class='heading--huge color--purple mt--40'>Legal &#8211; Privacy</h1>
                    <div class='mt--10 text--small opacity--60'>
                        Written on August 23, 2017. Updated on: January 16, 2017 </div>

                    <div class='user-content mt--40'>
                        <p>We track data about users of the Eta website, the Eta compiler, the Etlas build tool, and any other services we may offer from time to time.</p>

                        <p>This page tells you what we track, and what we do with it.</p>

                        <h2>The Eta Compiler</h2>
                        <p>All invocations of the Eta compiler store metrics, but the compiler itself does not send these metrics to an external server. That function is performed by the Etlas build tool, detailed in the following section.</p>
                        <p>For example, this is a sample payload of metrics stored by the Eta compiler:</p>

                        <pre style="background: #2E3037; color: white;">{"startTime": "2017-07-20T20:02:00.164452Z","mode": 0,"endTime": "2017-07-20T20:02:08.721724Z"}</pre>

                        <p>This includes:</p>
                        <ul>
                            <li>The start time of the compiler invocation</li>
                            <li>The mode of compilation, e.g., one shot or batch.</li>
                            <li>The end time of the compiler invocation.</li>
                        </ul>
                        <h2>The Etlas Build Tool</h2>

                        <p>The Etlas build tool does not track metrics of its own and sends the metrics stored by the Eta compiler along with a uniquely identifier for the user’s system to the Eta telemetry server, only if the user had decided to opt-in - a preference stored in the user’s Etlas config file. All the requests to the telemetry server are logged and retained by TypeLead, Inc.</p>

                        <p>This is a sample of the request log stored on the telemetry server, sent by the Etlas build tool:</p>

                        <pre style="background: #2E3037; color: white;">91.230.47.3 - - [24/07/2017:02:25:07 +0000] "GET /metrics-api HTTP/1.1" 200 - "" "etlas/1.0.1.0 (osx; x86_64)"</pre>

                        <p>This includes:</p>

                        <ul>
                            <li>The IP address of the requestor.</li>
                            <li>The date and time of the request.</li>
                            <li>The HTTP request URL and method.</li>
                            <li>The HTTP protocol version.</li>
                            <li>The HTTP response status code.</li>
                            <li>The length (in bytes) of the response that is sent back.</li>
                            <li>A Referrer header.</li>
                            <li>The User Agent header, which includes the Etlas version.</li>
                        </ul>

                        <p>The Etlas build tool also queries a binary package server and decides whether to install a given package in binary form or compile from source. All the requests to the binary package server are logged and retained by TypeLead, Inc.</p>

                        <p>This is a sample of the request log stored on the binary package server, sent by the Etlas build tool:</p>

                        <pre style="background: #2E3037; color: white;">91.230.47.3 - - [20/07/2017:15:45:35 +0000] "GET /index HTTP/1.1" 304 290 "-" "etlas/1.0.1.0 (osx; x86_64)"</pre>

                        <p>This includes the same details as listed above, since the format is exactly the same.</p>

                        <h2>The Eta Website</h2>

                        <p>Like most website operators, TypeLead, Inc. collects non-personally-identifying information of the sort that web browsers and servers typically make available, such as the browser type, language preference, referring site, and the date and time of each visitor request. TypeLead, Inc.’s purpose in collecting non-personally identifying information is to better understand how the visitors of the Eta website use the website. From time to time, TypeLead, Inc. may release non-personally-identifying information in the aggregate, e.g., by publishing a report on trends in website usage.</p>

                        <p>TypeLead, Inc. also collects potentially personally-identifying information like Internet Protocol (IP) addresses. TypeLead, Inc. does not use such information to identify its visitors, however, and does not disclose such information, other than under the same circumstances that it uses and discloses personally-identifying information, as described below.</p>

                        <p>The Eta website uses Google Analytics to monitor and analyze user behavior. This service provides TypeLead, Inc. with information on users’ demographics, age, location, and interest categories, when such information is available. This information is not used to identify individual users, but can in some cases be very specific. You can learn more about the information gathered and retained by this service at the
                            <a href="https://support.google.com/analytics/answer/2700409?hl=en&utm_id=ad">Google Analytics privacy policy</a>. You can opt out of Google Analytics entirely with the <a href="https://support.google.com/analytics/answer/181881?hl=en&ref_topic=2919631">Google Analytics opt-out browser addon.</a></p>

                        <h2>Tour of Eta</h2>

                        <p>In order to access the tour you need to sign in. You can either Sign In with GitHub or Twitter.</p>

                        <p>When granting the Tour access, we request the following capabalities.</p>

                        <ul>
                            <li>Read Email: This is notify you with future versions and updates of the Tour of Eta.</li>
                            <li>Full Name and User Name: This is to create your account on the Tour of Eta.</li>
                            <li>Avatar: This is to create the avatar on the Tour of Eta account.</li>
                        </ul>
                        <p>You can opt-out of the Tour of Eta any time by Signing out.</p>

                        <h2>Collection of Personally Identifying Information</h2>

                        <p>In order to write information into the Eta telemetry server, users may decide to provide certain personally identifying information including but not limited to: email address, username, password, personal website, and account names on other services such as GitHub, Twitter, and IRC.</p>

                        <p>If users do not want their information tracked in this manner, they can opt out by following the instructions here. However, this means that some features of the Eta website will be unavailable to them.</p>

                        <h2>Use of Personally Identifying Information</h2>

                        <p>We may use personally identifying information we have collected about you, including your email address, to provide you with news, notes, and recommendations. You can opt out of receiving such messages at any time by using the “unsubscribe” links or directions at the ends of messages you receive. In addition, we use collected personally identifying information to operate our business and the Eta service. We do not disclose your personal information to unaffiliated third parties who may want to offer you their own products and services unless you have requested or authorized us to do so.</p>

                        <p>We may share your personal information with third parties or affiliates where it is necessary for us to complete a transaction or do something you have asked us to do. Likewise, we may share your personal information with third parties or affiliates with whom we have contracted to perform services on our behalf. Companies that act on our behalf are required to keep the personal information we provide to them confidential and to use the personal information we share only to provide the services we ask them to perform.</p>

                        <p>In addition, we may disclose personal information in the good faith belief that we are lawfully authorized to do so, or that doing so is reasonably necessary to comply with legal process or authorities, respond to any claims, or to protect the rights, property , or personal safety of TypeLead Inc., our users, our employees, or the public. In addition, information about our users, including personal information, may be disclosed or transferred as part of, or during negotiations of, any merger, sale of company assets, or acquisition.</p>

                        <h2>Cookies</h2>

                        <p>A cookie is a string of information that a website stores on a visitor’s computer, and that the visitor’s browser provides to the website each time the visitor returns.</p>

                        <p>The Eta website uses cookies to help identify and track visitors, their usage of the Eta website, and their website access credentials. Eta website visitors who do not wish to have cookies placed on their computers should set their browsers to refuse cookies before using TypeLead, Inc.’s websites, with the drawback that certain features of TypeLead, Inc.’s websites may not function properly without the aid of cookies.</p>

                        <h2>Disclosure of Log Information</h2>

                        <p>All user information is retained in raw form for such time as deemed appropriate by TypeLead, Inc. It is shared with employees and contractors of TypeLead, Inc., as needed to process information on TypeLead, Inc.’s behalf.</p>

                        <p>Raw log data is not shared with third parties, but may be shared in aggregate. For example, we may share the number of active Eta users in a given day, and occasionally TypeLead, Inc. may publish blog posts or reports on the Eta compiler or Eta website usage.</p>

                        <p>We also analyze log data for a variety of reasons, including counting up downloads and unique visitors, debugging production problems, tracking which versions of Eta and Etlas are in use in the wild, and researching how Eta packages are used together with one another. This helps us to better understand the usage patterns of Eta, and make better decisions about the evolving Eta in the future.</p>

                        <h2>Use by Minors</h2>

                        <p>We will refer to the Eta website, Etlas build tool (when opted-in for telemetry), and other related services as the “Eta services.” Eta services are not intended for use by minor children (under the age of 18). Parents and guardians should monitor the use of the Eta service by minor children. Children under age 13 should not use Eta services at all. If a child under age 13 submits personal information through any part of the service, and we become aware that the person submitting the information is under age 13, we will attempt to delete the information as soon as reasonably possible.</p>

                        <h2>Links to Other Websites</h2>

                        <p>The Eta website may contain links to other websites. Any personal information you provide on the linked pages is provided directly to that third party and is subject to that third party’s privacy policy. Except as described above, we are not responsible for the content or privacy and security practices and policies of websites to which we link. Links from the Eta service to third parties or to other sites are provided for your convenience. We encourage you to learn about their privacy and security practices and policies before providing them with personal information.</p>

                        <h2>United States Jurisdiction</h2>

                        <p>The Eta website and related services are hosted in the United States. This Privacy Policy is intended to comply with privacy laws in the United States and may not comply with all privacy laws in other countries.</p>

                        <p>If you are a non-US user of the service, by using our service and providing us with data, you acknowledge, agree and provide your consent that your personal information may be processed in the United States for the purposes identified in this Privacy Policy. In addition, such data may be stored on servers located outside your resident jurisdiction, which may have less stringent privacy practices than your own. By using the supporting Eta services and providing us with your data, you consent to the transfer of such data and any less stringent privacy practices.</p>

                        <h2>Contact Information</h2>

                        <p>If you have any questions or concerns about how we track user information, or how that information is used, please contact us at once.</p>

                        <p>You may contact TypeLead, Inc. by emailing <a href="mailto:contact@typelead.com" target="_top">contact@typelead.com.</a></p>

                        <h2>Privacy Policy Changes</h2>

                        <p>Although most changes are likely to be minor, TypeLead, Inc. may change its Privacy Policy from time to time, and in TypeLead, Inc.’s sole discretion. Any such changes will be posted on the Eta blog, and the detailed history of changes can be found in the <a href="https://github.com/typelead/eta/commits/master/docs/source/privacy-policy.rst">git repository history for this document.</a></p>

                        <p>TypeLead, Inc. encourages visitors to frequently check this page for any changes to its Privacy Policy. Your continued use of the Eta website, the Etlas build tool (if already opted-in), and any supporting services after any change in this Privacy Policy will constitute your acceptance of such change.</p>

                        <h2>License</h2>

                        <p>This document may be reused under a <a href="https://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike License.</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <mainFooter/>
    <style>
    div#site-menu-outer-container{
      height: 64px;
    }
    </style>
    <script type='text/javascript' src='/js/scripts/jquery.accordion.js'></script>
    <script type='text/javascript' src='/js/scripts/smoothscroll.js'></script>
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
