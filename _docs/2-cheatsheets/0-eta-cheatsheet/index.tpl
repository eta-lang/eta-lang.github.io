<!DOCTYPE html>
<html lang="en-US">

<head>
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="pinterest" content="nopin" />
    <title>Eta Cheatsheet | The Eta Programming Language</title>
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
                  <h1 class='heading--large'>Eta Cheatsheet</h1>

                  <p class='text--large mt--20'>A quick reference for Eta</p>
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

            <div class='row mt--20 center-xs'>

                <div class='col-xs-12 col-sm-4'>

                    <div class='box box--padding--top--20 text--left'>
                        <h3 class='heading--small color--purple mb--20 mt--20'>
            Hello World
          </h3>
                        <p style="color: black; font-size: 15px;" class="pl--20 bg--gray">Main.eta</p>
                        <div class="highlight">
                            <pre style="margin-left: -100px; font-family: 'Cousine', monospace; font-size: 12px; overflow-x: auto;">
                <!-- <span></span> -->
                <span class="kr">module</span> <span class="nn">Main</span> <span class="kr">where</span>
                <span class="nf">main</span> <span class="ow">::</span> <span class="kt">IO</span> <span class="nb">()</span>
                <span class="nf">main</span> <span class="ow">=</span> <span class="n">putStrLn</span> <span class="s">&quot;Hello World!&quot;</span>
            </pre>
                        </div>
                        <p class="mt--20 pb--20 pt--20 pl--20 color--white" style="background: #1C3041; font-family: 'Cousine', monospace; font-size: 12px;">$ etlas build</p>
                        <p class="pt--20 pl--20" style="background: #fff;">Or try it on <a href="https://tour.eta-lang.org"> Tour of Eta</a>. </p>
                    </div>

                </div>
                <div class='col-xs-12 col-sm-4 mt--xs--20'>
                    <div class='box box--padding--top--20 text--left'>
                        <h3 class='heading--small color--purple mb--20 mt--20'>
            Bindings
          </h3>
                        <p style="color: black; font-size: 15px;" class="pl--20 bg--gray">Binding declaration</p>
                        <div class="highlight">
                            <pre style="margin-left: -65px; padding-top: 20px; font-family: 'Cousine', monospace; font-size: 12px;">
            <span class="nf">myName</span> <span class="ow">::</span> <span class="kt">String</span>
            <span class="nf">myName</span> <span class="ow">=</span> <span class="s">&quot;Eta&quot;</span>

            <span class="nf">main</span> <span class="ow">::</span> <span class="kt">IO</span> <span class="nb">()</span>
            <span class="nf">main</span> <span class="ow">=</span> <span class="n">putStrLn</span> <span class="o">$</span> <span class="n">myName</span>
            </pre>
                        </div>
                    </div>
                </div>
                <div class='col-xs-12 col-sm-4 mt--xs--20'>
                    <div class='box box--padding--top--20 text--left'>
                        <h3 class='heading--small color--purple mb--20 mt--20'>
            Lists
          </h3>
                        <p style="color: black; font-size: 15px;" class="pl--20 bg--gray">List declaration</p>

                        <div class="highlight pb--20 pt--20">
                            <pre style="margin-left: 20px; font-family: 'Cousine', monospace; font-size: 12px; overflow-x: auto;"><span></span><span class="nf">users</span> <span class="ow">::</span> <span class="p">[</span><span class="kt">String</span><span class="p">]</span>
<span class="nf">users</span> <span class="ow">=</span> <span class="p">[</span> <span class="s">&quot;Tom&quot;</span><span class="p">,</span> <span class="s">&quot;Dick&quot;</span><span class="p">,</span> <span class="s">&quot;Harry&quot;</span> <span class="p">]</span>

<span class="nf">main</span> <span class="ow">::</span> <span class="kt">IO</span> <span class="nb">()</span>
<span class="nf">main</span> <span class="ow">=</span> <span class="n">print</span> <span class="o">$</span> <span class="n">users</span>
</pre></div>
                        <p style="color: black; font-size: 15px;" class="pl--20 mt--20 bg--gray">List operations</p>
                        <div class="highlight pb--20 pt--20"><pre style="margin-left: 20px; font-family: 'Cousine', monospace; font-size: 12px;"><span></span><span class="nf">main</span> <span class="ow">::</span> <span class="kt">IO</span> <span class="nb">()</span>
<span class="nf">main</span> <span class="ow">=</span> <span class="kr">do</span>
 <span class="n">print</span> <span class="o">$</span> <span class="n">head</span> <span class="n">users</span>
 <span class="n">print</span> <span class="o">$</span> <span class="n">tail</span> <span class="n">users</span>
</pre></div>

                    </div>
                </div>
            </div>

            <div class='row mt--20 center-xs'>

                <div class='col-xs-12 col-sm-4'>

                    <div class='box box--padding--top--20 text--left'>
                        <h3 class='heading--small color--purple mb--20 mt--20'>
            Functions
          </h3>
                        <p style="color: black; font-size: 15px;" class="pl--20 bg--gray">Basic structure</p>

                        <div class="highlight text--left pt--20 pb--20"><pre style="margin-left: 20px; font-family: 'Cousine', monospace; font-size: 12px; overflow-x: auto;"><span></span><span class="nf">function</span> <span class="ow">::</span> <span class="kr">type</span> <span class="ow">-&gt;</span> <span class="kr">type</span>
<span class="nf">function</span> <span class="n">x</span> <span class="ow">=</span> <span class="n">expr</span>

<span class="nf">function1</span> <span class="ow">::</span> <span class="kr">type</span> <span class="ow">-&gt;</span> <span class="p">[</span><span class="kr">type</span><span class="p">]</span> <span class="ow">-&gt;</span> <span class="kr">type</span>
<span class="nf">function1</span> <span class="n">x</span> <span class="n">xs</span> <span class="ow">=</span> <span class="n">expr</span>

<span class="nf">main</span> <span class="ow">=</span> <span class="kr">do</span> <span class="n">code</span>
       <span class="n">code</span>
       <span class="o">...</span>
</pre></div>

                    </div>

                </div>
                <div class='col-xs-12 col-sm-4 mt--xs--20'>
                    <div class='box box--padding--top--20 text--left'>
                        <h3 class='heading--small color--purple mb--20 mt--20'>
            Control Flow
          </h3>
                        <p style="color: black; font-size: 15px;" class="pl--20 bg--gray">if-then-else expression</p>

                        <div class="highlight pb--20 pt--20">
                            <pre style="margin-left: 20px; font-family: 'Cousine', monospace; font-size: 12px; overflow-x: auto;"><span></span><span class="nf">main</span> <span class="ow">=</span> <span class="kr">do</span>
   <span class="kr">if</span> <span class="mi">36</span> <span class="p">`</span><span class="n">rem</span><span class="p">`</span> <span class="mi">2</span> <span class="o">==</span> <span class="mi">0</span>
      <span class="kr">then</span> <span class="n">putStrLn</span> <span class="s">&quot;Number is Even&quot;</span>
   <span class="kr">else</span> <span class="n">putStrLn</span> <span class="s">&quot;Number is Odd&quot;</span>
</pre></div>

                    </div>
                </div>
                <div class='col-xs-12 col-sm-4 mt--xs--20'>
                    <div class='box box--padding--top--20 text--left'>
                        <h3 class='heading--small color--purple mb--20 mt--20'>
            Pattern Matching
          </h3>
                        <p style="color: black; font-size: 15px;" class="pl--20 bg--gray">This sets username to "Harry".</p>

                        <div class="highlight pt--20"><pre style="margin-left: 20px; font-family: 'Cousine', monospace; font-size: 12px; overflow-x: auto;"><span></span><span class="kr">data</span> <span class="kt">User</span> <span class="ow">=</span> <span class="kt">User</span> <span class="p">{</span> <span class="n">name</span> <span class="ow">::</span> <span class="kt">String</span><span class="p">,</span> <span class="n">age</span> <span class="ow">::</span> <span class="kt">Int</span> <span class="p">}</span>
  <span class="kr">deriving</span> <span class="kt">Show</span>

<span class="nf">user</span> <span class="ow">::</span> <span class="kt">User</span>
<span class="nf">user</span> <span class="ow">=</span> <span class="kt">User</span> <span class="s">&quot;Harry&quot;</span> <span class="mi">42</span>

<span class="nf">main</span> <span class="ow">::</span> <span class="kt">IO</span> <span class="nb">()</span>
<span class="nf">main</span> <span class="ow">=</span> <span class="kr">do</span>
  <span class="kr">let</span> <span class="kt">User</span> <span class="p">{</span> <span class="n">name</span> <span class="ow">=</span> <span class="n">userName</span> <span class="p">}</span> <span class="ow">=</span> <span class="n">user</span>
  <span class="n">print</span> <span class="n">userName</span><br/>
</pre></div>

                    </div>
                </div>
            </div>

            <div class='row mt--50 center-lg'>
                <div class='col-lg-12'>
                    <h2 class='heading--large color--purple mb--20'>
          Types
        </h2>
                </div>
            </div>

            <div class='row mt--20 center-xs' id="eta-name-origin">
                <div class='col-lg-6 col-xs-12 col-sm-6'>
                    <div class='box box--padding--top--20'>
                        <h3 class='heading--small color--purple mb--20 mt--20 text--left'> Common Types </h3>
                        <div style="overflow-x: auto;">
                            <table style="width: 100%;">
                                <tbody>
                                    <tr>
                                        <td class="text--left"><span class="code-highlight">True</span> <em>/</em> <span class="code-highlight">False</span></td>
                                        <td class="text--right"><span class="code-highlight">Bool</span></td>
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr>
                                        <td class="text--left"><span class="code-highlight">72</span></td>
                                        <td class="text--right"><span class="code-highlight">Int</span> (32 bits)</td>
                                    </tr>
                                    <tr>
                                        <td class="text--left"><span class="code-highlight">3.14</span></td>
                                        <td class="text--right"><span class="code-highlight">Float</span> (32 bits)</td>
                                    </tr>
                                    <tr>
                                        <td class="text--left"><span class="code-highlight">3.14</span></td>
                                        <td class="text--right"><span class="code-highlight">Double</span> (64 bits)</td>
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr>
                                        <td class="text--left"><span class="code-highlight">'h'</span></td>
                                        <td class="text--right"><span class="code-highlight">Char</span></td>
                                    </tr>

                                    <tr>
                                        <td class="text--left"><span class="code-highlight">"hello"</span></td>
                                        <td class="text--right"><span class="code-highlight">String</span></td>
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr>
                                        <td class="text--left"><span class="code-highlight">['a','b','c']</span>same as <span class="code-highlight">"abc"</span></td>
                                        <td class="text--right"><span class="code-highlight">[a]</span> (List)</td>
                                    </tr>
                                    <tr>
                                        <td class="text--left"><span class="code-highlight">(1, 2)</span></td>
                                        <td class="text--right"><span class="code-highlight">(Int,Int)</span> (Tuple)</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class='row mt--50 center-lg'>
                <div class='col-lg-12'>
                    <h2 class='heading--large text--center color--purple mb--20'>
          Modules
        </h2>
                </div>
            </div>

            <div class='row mt--20 center-xs'>

                <div class='col-xs-12 col-sm-4'>

                    <div class='box box--padding--top--20 text--left'>
                        <h3 class='heading--small color--purple mb--20 mt--20'>
            Declaring Module
          </h3>
                        <p style="color: black; font-size: 15px;" class="pl--20 bg--gray">New module named Main</p>
                        <div class="highlight pt--20">
                            <pre style="margin-left: -85px; font-family: 'Cousine', monospace; font-size: 12px; overflow-x: auto;">
              <span class="kr">module</span> <span class="nn">Main</span> <span class="kr">where</span>
              <span class="nf">main</span> <span class="ow">::</span> <span class="kt">IO</span> <span class="nb">()</span>
              <span class="nf">main</span> <span class="ow">=</span> <span class="n">putStrLn</span> <span class="s">&quot;Eta&#39;s first module!&quot;</span>
 </pre></div>

                    </div>

                </div>
                <div class='col-xs-12 col-sm-4 mt--xs--20'>
                    <div class='box box--padding--top--20 text--left'>
                        <h3 class='heading--small color--purple mb--20 mt--20'>
            Importing
          </h3>
                        <p style="color: black; font-size: 15px;" class="pl--20 bg--gray">Importing Data.Time Module</p>
                        <div class="highlight pt--20 pb--20"><pre style="margin-left: 20px; font-family: 'Cousine', monospace; font-size: 12px;"><span></span><span class="kr">import</span> <span class="nn">Data.Time</span>

<span class="nf">main</span> <span class="ow">=</span> <span class="kr">do</span>
    <span class="n">now</span> <span class="ow">&lt;-</span> <span class="n">getCurrentTime</span>
    <span class="n">print</span> <span class="n">now</span>
</pre></div>

                    </div>
                </div>
                <div class='col-xs-12 col-sm-4 mt--xs--20'>
                    <div class='box box--padding--top--20 text--left'>
                        <h3 class='heading--small color--purple mb--20 mt--20'>
            Qualified Imports
          </h3>
                        <p style="color: black; font-size: 15px;" class="pl--20 bg--gray">Qualified is similar to aliases</p>
                        <div class="highlight pt--20"><pre style="margin-left: 20px; font-family: 'Cousine', monospace; font-size: 12px; overflow-x: auto;"><span></span><span class="kr">import</span> <span class="k">qualified</span> <span class="nn">Text.Printf</span> <span class="k">as</span> <span class="n">T</span>

<span class="nf">main</span> <span class="ow">::</span> <span class="kt">IO</span> <span class="nb">()</span>
<span class="nf">main</span> <span class="ow">=</span> <span class="kt">T</span><span class="o">.</span><span class="n">printf</span> <span class="s">&quot;Hello %s! Your score is 100.&quot;</span> <span class="s">&quot;Harry&quot;</span><br/>
</pre></div>

                    </div>
                </div>
            </div>

            <div class='row mt--50 center-lg'>
                <div class='col-lg-12'>
                    <h2 class='heading--large color--purple mb--20'>
          Foreign Function Interface
        </h2>
                </div>
            </div>

            <div class='row mt--20 center-xs'>
                <div class='col-lg-6 col-xs-12 col-sm-6'>
                    <div class='box box--padding--top--20'>
                        <div class="row">
                            <div class="col-lg-12 col-xs-12">
                                <h3 class='heading--medium mb--20 color--purple'>
                Java Wrapper Type
              </h3>

                                <p style="color: black; font-size: 15px;" class="text--left pl--20 mt--20 bg--gray">Referencing a Java class inside of Eta</p>
                                <div class="highlight text--left pt--20">
                                    <pre style="margin-left: 30px; font-family: 'Cousine', monospace; font-size: 12px; overflow-x: auto;"><span></span><span class="kr">data</span> <span class="kt">JInteger</span> <span class="ow">=</span> <span class="kt">JInteger</span> <span class="o">@</span><span class="n">java</span><span class="o">.</span><span class="n">lang</span><span class="o">.</span><span class="kt">Integer</span>
  <span class="kr">deriving</span> <span class="kt">Class</span>

</pre></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class='col-lg-6 col-xs-12 col-sm-6 pt--xs--20'>
                    <div class='box box--padding--top--20'>
                        <div class="row">
                            <div class="col-lg-12 col-xs-12">
                                <h3 class='heading--medium mb--20 color--purple'>
               Java Foreign Import Declarations
             </h3>
                                <p style="color: black; font-size: 15px;" class="text--left pl--20 mt--20 bg--gray">Import a Java method as an Eta monadic action</p>
                                <div class="highlight text--left pt--20"><pre style="margin-left: 30px; overflow-x: auto; font-family: 'Cousine', monospace; font-size: 12px;"><span></span><span class="nf">foreign</span> <span class="kr">import</span> <span class="nn">java</span> <span class="n">unsafe</span> <span class="n">coalesce</span> <span class="ow">::</span> <span class="kt">Int</span> <span class="ow">-&gt;</span> <span class="kt">Java</span> <span class="kt">JavaDoubleRDD</span> <span class="kt">JavaDoubleRDD</span><br/>
</pre></div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class='row mt--20 center-xs' id="marshalling-between-java-and-eta-types">
                <div class='col-lg-6 col-xs-12 col-sm-6'>
                    <div class='box box--padding--top--20'>
                        <h3 class='heading--small color--purple mb--20 mt--20 text--left'>
            Marshalling Between Java and Eta Types
          </h3>
                        <div style="overflow-x: auto;">
                            <table style="width: 100%;">

                                <tbody>
                                    <tr>
                                        <td class="text--left color--eta text--semibold">Java Type</td>
                                        <td class="text--right color--eta text--semibold">Eta Type</td>
                                    </tr>
                                    <tr>
                                        <td class="text--left"><span class="code-highlight">boolean</span></td>
                                        <td class="text--right"><span class="code-highlight">Bool</span></td>
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr>
                                        <td class="text--left"><span class="code-highlight">byte</span></td>
                                        <td class="text--right"><span class="code-highlight">Byte</span></td>
                                    </tr>
                                    <tr>
                                        <td class="text--left"><span class="code-highlight">short</span></td>
                                        <td class="text--right"><span class="code-highlight">Short</span></td>
                                    </tr>
                                    <tr>
                                        <td class="text--left"><span class="code-highlight">char</span></td>
                                        <td class="text--right"><span class="code-highlight">JChar</span></td>
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr>
                                        <td class="text--left"><span class="code-highlight">int</span></td>
                                        <td class="text--right"><span class="code-highlight">Int</span></td>
                                    </tr>

                                    <tr>
                                        <td class="text--left"><span class="code-highlight">long</span></td>
                                        <td class="text--right"><span class="code-highlight">Int64</span></td>
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr>
                                        <td class="text--left"><span class="code-highlight">float</span></td>
                                        <td class="text--right"><span class="code-highlight">Float</span></td>
                                    </tr>
                                    <tr>
                                        <td class="text--left"><span class="code-highlight">double</span></td>
                                        <td class="text--right"><span class="code-highlight">Double</span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class='col-lg-6 col-xs-12 col-sm-6 pt--xs--20'>
                    <div class='box box--padding--top--20'>
                        <h3 class='heading--small color--purple mb--20 mt--20 text--left'>
           Primitive Arrays in Eta
         </h3>
                        <div style="overflow-x: auto;">
                            <table>

                                <tbody>
                                    <tr>
                                        <td class="text--left color--eta text--semibold">Java Type</td>
                                        <td class="text--center color--eta text--semibold">Array Type</td>
                                        <td class="text--right color--eta text--semibold">Element Type</td>
                                    </tr>
                                    <tr>
                                        <td class="text--left"><span class="code-highlight">boolean[]</span></td>
                                        <td class="text--center"><span class="code-highlight">JBooleanArray</span></td>
                                        <td class="text--right"><span class="code-highlight">Bool</span></td>
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr>
                                        <td class="text--left"><span class="code-highlight">byte[]</span></td>
                                        <td class="text--center"><span class="code-highlight">JByteArray</span></td>
                                        <td class="text--right"><span class="code-highlight">Byte</span></td>
                                    </tr>
                                    <tr>
                                        <td class="text--left"><span class="code-highlight">short[]</span></td>
                                        <td class="text--center"><span class="code-highlight">JShortArray</span></td>
                                        <td class="text--right"><span class="code-highlight">Short</span></td>
                                    </tr>
                                    <tr>
                                        <td class="text--left"><span class="code-highlight">char[]</span></td>
                                        <td class="text--center"><span class="code-highlight">JCharArray</span></td>
                                        <td class="text--right"><span class="code-highlight">JChar</span></td>
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr>
                                        <td class="text--left"><span class="code-highlight">int[]</span></td>
                                        <td class="text--center"><span class="code-highlight">JIntArray</span></td>
                                        <td class="text--right"><span class="code-highlight">Int</span></td>
                                    </tr>

                                    <tr>
                                        <td class="text--left"><span class="code-highlight">long[]</span></td>
                                        <td class="text--center"><span class="code-highlight">JLongArray</span></td>
                                        <td class="text--right"><span class="code-highlight">Int64</span></td>
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr>
                                        <td class="text--left"><span class="code-highlight">float</span></td>
                                        <td class="text--center"><span class="code-highlight">JFloatArray</span></td>
                                        <td class="text--right"><span class="code-highlight">Float</span></td>
                                    </tr>
                                    <tr>
                                        <td class="text--left"><span class="code-highlight">double</span></td>
                                        <td class="text--center"><span class="code-highlight">JDoubleArray</span></td>
                                        <td class="text--right"><span class="code-highlight">Double</span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>

            <div class='row mt--20 center-xs'>

                <div class='col-xs-12 col-sm-4'>

                    <div class='box box--padding--top--20 text--left'>
                        <h3 class='heading--small color--purple mb--20 mt--20'>
            Instance Methods
          </h3>
                        <p style="color: black; font-size: 15px;" class="pl--20 bg--gray">Import <a href="https://docs.oracle.com/javase/7/docs/api/java/io/File.html#canExecute()">boolean canExecute()</a> from the <a href="https://docs.oracle.com/javase/7/docs/api/java/io/File.html">java.io.File</a> class.</p>
<div class="highlight pb--20 pt--20"><pre style="margin-left: 20px; font-family: 'Cousine', monospace; font-size: 12px; overflow-x: auto;"><span></span><span class="kr">foreign import java unsafe</span> <span class="n">canExecute</span> <span class="ow">::</span> <span class="kt">Java</span> <span class="kt">File</span> <span class="kt">Bool</span><br/>
</pre></div>

                    </div>

                </div>
                <div class='col-xs-12 col-sm-4 mt--xs--20'>
                    <div class='box box--padding--top--20 text--left'>
                        <h3 class='heading--small color--purple mb--20 mt--20'>
            Static Methods
          </h3>
                        <p style="color: black; font-size: 15px;" class="pl--20 bg--gray">Import <a href="https://docs.oracle.com/javase/7/docs/api/java/io/File.html#createTempFile">File createTempFile(String, String)</a> from the <a href="https://docs.oracle.com/javase/7/docs/api/java/io/File.html">java.io.File</a> class.</p>
<div class="highlight pb--20 pt--20"><pre style="margin-left: 20px; font-family: 'Cousine', monospace; font-size: 12px; overflow-x: auto;"><span></span><span class="kr">foreign import java unsafe</span> <span class="s">&quot;@static java.io.File.createTempFile&quot;</span>
  <span class="n">createTempFile</span>  <span class="ow">::</span> <span class="kt">String</span> <span class="ow">-&gt;</span> <span class="kt">String</span> <span class="ow">-&gt;</span> <span class="kt">Java</span> <span class="n">a</span> <span class="kt">File</span>
</pre></div>

                    </div>
                </div>
                <div class='col-xs-12 col-sm-4 mt--xs--20'>
                    <div class='box box--padding--top--20 text--left'>
                        <h3 class='heading--small color--purple mb--20 mt--20'>
            Constructors
          </h3>
                        <p style="color: black; font-size: 15px;" class="pl--20 bg--gray">Import <a href="https://docs.oracle.com/javase/7/docs/api/java/io/File.html#File(java.lang.String)">File(String)</a> from the <a href="https://docs.oracle.com/javase/7/docs/api/java/io/File.html">java.io.File</a> class.</p>
<div class="highlight pt--20 pb--20"><pre pre style="margin-left: 20px; font-family: 'Cousine', monospace; font-size: 12px; overflow-x: auto;"><span></span><span class="kr">foreign import java unsafe</span> <span class="s">&quot;@new&quot;</span> <span class="n">newFile</span>  <span class="ow">::</span> <span class="kt">String</span> <span class="ow">-&gt;</span> <span class="kt">Java</span> <span class="n">a</span> <span class="kt">File</span><br/>
</pre></div>

                    </div>
                </div>
            </div>

            <div class='row mt--20 center-xs'>

                <div class='col-xs-12 col-sm-4'>

                    <div class='box box--padding--top--20 text--left'>
                        <h3 class='heading--small color--purple mb--20 mt--20'>
            Instance Fields
          </h3>
                        <p style="color: black; font-size: 15px;" class="pl--20 bg--gray">Import <a href="http://grepcode.com/file/repository.grepcode.com/java/root/jdk/openjdk/7u40-b43/java/io/File.java/#165">private String path</a> from the <a href="https://docs.oracle.com/javase/7/docs/api/java/io/File.html">java.io.File</a> class.</p>
<div class="highlight pb--20 pt--20"><pre style="margin-left: 20px; font-family: 'Cousine', monospace; font-size: 12px; overflow-x: auto;"><span></span><span class="kr">foreign import java unsafe</span> <span class="s">&quot;@field path&quot;</span> <span class="n">getFilePath</span>  <span class="ow">::</span> <span class="kt">Java</span> <span class="kt">File</span> <span class="kt">String</span><br/>
</pre></div>

                    </div>

                </div>
                <div class='col-xs-12 col-sm-4 mt--xs--20'>
                    <div class='box box--padding--top--20 text--left'>
                        <h3 class='heading--small color--purple mb--20 mt--20'>
            Static Fields
          </h3>
                        <p style="color: black; font-size: 15px;" class="pl--20 bg--gray">Import <a href="https://docs.oracle.com/javase/7/docs/api/java/io/File.html#pathSeparator">String pathSeparator</a> from the <a href="https://docs.oracle.com/javase/7/docs/api/java/io/File.html">java.io.File</a> class.</p>
<div class="highlight pb--20 pt--20"><pre style="margin-left: 20px; font-family: 'Cousine', monospace; font-size: 12px; overflow-x: auto;"><span></span><span class="kr">foreign import java unsafe</span> <span class="s">&quot;@static @field java.io.File.pathSeparator&quot;</span>
  <span class="n">getPathSeparator</span>  <span class="ow">::</span> <span class="kt">Java</span> <span class="n">a</span> <span class="kt">String</span>
</pre></div>

                    </div>
                </div>
            </div>

            <div class='row mt--50 center-lg'>
                <div class='col-lg-12'>
                    <h2 class='heading--large color--purple mb--20'>
          Concurrency
        </h2>
                </div>
            </div>

            <div class='row mt--20 center-xs mb--60'>

                <div class='col-xs-12 col-sm-4'>

                    <div class='box box--padding--top--20 text--left'>
                        <h3 class='heading--small color--purple mb--20 mt--20'>
            forkIO
          </h3>
                        <p style="color: black; font-size: 15px;" class="pl--20 bg--gray">Use all the cores of your CPU</p>

                        <div class="highlight pt--20"><pre style="margin-left: 15px; font-family: 'Cousine', monospace; font-size: 12px; overflow-x: auto;"><span></span><span class="kr">import</span> <span class="nn">Control.Concurrent</span>

<span class="nf">main</span> <span class="ow">=</span> <span class="kr">do</span>
  <span class="n">forkIO</span> <span class="o">$</span> <span class="kr">do</span>
    <span class="n">putStrLn</span> <span class="s">&quot;Yay! i&#39;m in thread!&quot;</span>
  <span class="n">putStrLn</span> <span class="s">&quot;I&#39;m important i&#39;m in Main thread!&quot;</span>
</pre></div>

                    </div>

                </div>
                <div class='col-xs-12 col-sm-4 mt--xs--20'>
                    <div class='box box--padding--top--20 text--left'>
                        <h3 class='heading--small color--purple mb--20 mt--20'>
            Channels
          </h3>
                        <p style="color: black; font-size: 15px;" class="pl--20 bg--gray">Channels help communicating with threads</p>
                        <div class="highlight"><pre style="margin-left: 20px; padding-top: 20px; font-family: 'Cousine', monospace; font-size: 12px; overflow-x: auto;"><span></span><span class="kr">import</span> <span class="nn">Control.Concurrent.Chan</span> <span class="p">(</span><span class="nf">newChan</span><span class="p">,</span> <span class="nf">writeChan</span><span class="p">,</span> <span class="nf">readChan</span><span class="p">)</span>

<span class="nf">main</span> <span class="ow">=</span> <span class="kr">do</span>
    <span class="n">messages</span> <span class="ow">&lt;-</span> <span class="n">newChan</span>
    <span class="n">writeChan</span> <span class="n">messages</span> <span class="s">&quot;unbounded&quot;</span>
    <span class="n">writeChan</span> <span class="n">messages</span> <span class="s">&quot;channels&quot;</span>

    <span class="n">msg</span> <span class="ow">&lt;-</span> <span class="n">readChan</span> <span class="n">messages</span>
    <span class="n">putStrLn</span> <span class="n">msg</span>
    <span class="n">putStrLn</span> <span class="o">=&lt;&lt;</span> <span class="n">readChan</span> <span class="n">messages</span><br/>
</pre></div>
                    </div>
                </div>
                <div class='col-xs-12 col-sm-4 mt--xs--20'>
                    <div class='box box--padding--top--20 text--left'>
                        <h3 class='heading--small color--purple mb--20 mt--20'>
            MVar
          </h3>
                        <p style="color: black; font-size: 15px;" class="pl--20 bg--gray">MVar is a single-element Channel</p>
                        <div class="highlight pt--20"><pre style="margin-left: 20px; font-family: 'Cousine', monospace; font-size: 12px; overflow-x: auto;"><span></span><span class="kr">import</span> <span class="nn">Control.Concurrent.MVar</span> <span class="p">(</span><span class="nf">newEmptyMVar</span><span class="p">,</span> <span class="nf">takeMVar</span><span class="p">,</span> <span class="nf">putMVar</span><span class="p">)</span>

<span class="nf">p</span> <span class="ow">::</span> <span class="kt">IO</span> <span class="kt">Int</span>
<span class="nf">p</span> <span class="ow">=</span> <span class="kr">do</span>
  <span class="n">num</span> <span class="ow">&lt;-</span> <span class="n">newEmptyMVar</span>
  <span class="n">forkIO</span> <span class="o">$</span> <span class="n">putMVar</span> <span class="n">num</span> <span class="mi">7</span>
  <span class="n">forkIO</span> <span class="o">$</span> <span class="n">putMVar</span> <span class="n">num</span> <span class="mi">9</span>
  <span class="n">takeMVar</span> <span class="n">num</span>

<span class="nf">main</span> <span class="ow">=</span> <span class="kr">do</span>
  <span class="n">v</span> <span class="ow">&lt;-</span> <span class="n">p</span>
  <span class="n">putStr</span> <span class="o">$</span> <span class="n">show</span> <span class="n">v</span><br/>
</pre></div>

                        <p class="pt--10"><span class="code-highlight">putMVar</span>blocks if MVar has a value.</p>
                        <p><span class="code-highlight">takeMVar</span>blocks if MVar is empty.</p>
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
