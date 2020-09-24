<style>
.dropbtn {
    background-color: inherit;
    color: white;
    padding: 5px;
    font-size: 14px;
    font-weight: 300;
    border: none;
    font-family: 'Roboto';
    text-transform: uppercase;
}

.mobile-nav .dropbtn{
  font-size: 22px;
  text-transform: none;
  padding-left: 0px;
}

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #ffffff;
    min-width: 160px;
    box-shadow: 0px 10px 40px 0px rgba(47, 47, 47, 0.1);
    z-index: 1;
}

.mobile-nav .dropdown-content{
  position: static;
  background-color: inherit;
  min-width: inherit;
  box-shadow: 0px 0px 0px 0px #000000;
}

.dropdown-content a {
    color: #5333ed;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    font-size: 14px;
}

.dropdown-content a:hover {background-color: inherit;}

.mobile-nav .dropdown-content a:hover {background-color: none;}

.dropdown:hover .dropdown-content {
    display: block;
}

.dropdown:hover .dropbtn {
    background-color: inherit;
}

</style>
<div class='container hero-menu'>
    <div class='row'>
        <div class='col-xs-12 pt--50 pt--md--30 pt--xs--30'>
            <div id='site-menu-outer-container'>
                <div class='site-menu-container' id='site-menu'>
                    <div class='site-menu'>
                        <div class='site-menu__logo'>
                            <a href='https://eta-lang.org'>
                              <img alt="Eta Logo" headerLogo src="/images/eta-logo.svg" style="height: 20px;">
                            </a>
                        </div>
                        <input type='checkbox' id='hamburger-menu-trigger'>
                        <nav class='site-menu__nav'>
                            <ul>
                                <li>
                                    <a class='active ' href="/"><span>Home</span></a>
                                </li>
                                <li>
                                    <div class="dropdown">
                                        <button class="dropbtn active">Documentation
                                        <img src="/images/arrow-down.svg" height="10px;">
                                        </button>
                                        <div class="dropdown-content dropdown-hide">
                                            <a href="/docs">Docs Home</a>
                                            <a href="/docs/user-guides">User Guides</a>
                                            <a href="/docs/tutorials">Tutorials</a>
                                            <a href="/docs/cheatsheets">Cheatsheets</a>
                                            <a href="/docs/faq">FAQ</a>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="dropdown">
                                        <button class="dropbtn active">Community
                                          <img src="/images/arrow-down.svg" height="10px;">
                                        </button>
                                        <div class="dropdown-content dropdown-hide">
                                            <a href="/community">Community Home</a>
                                            <a href="/contribute">Contribute</a>
                                            <a href="/contribute/proposals">Proposals</a>
                                            <a href="/contribute/bug-report">Bug Reports</a>
                                            <a href="/contribute/gsoc/2018">GSoC 2018</a>
                                        </div>
                                    </div>
                                </li>

                                <li>
                                    <a class=' ' href="https://tour.eta-lang.org/"><span>Tour of Eta</span></a>
                                </li>
                                <li>
                                    <a class=' ' href="https://blog.eta-lang.org"><span>Blog</span></a>
                                </li>
                                <li>
                                    <a class=' ' href="https://github.com/typelead/eta" target="_blank"><span>GitHub</span></a>
                                </li>
                                <li>
                                    <a class='login' href="/docs/user-guides/eta-user-guide/installation/methods"><span>Install</span></a>
                                </li>
                            </ul>
                        </nav>

                        <label for='hamburger-menu-trigger' class='show-xs-only'>
                        <svg class="" style=" "  width="24" height="24" viewBox="0 0 24 24"><g fill-rule="nonzero" fill="white"><path d="M24 4.5c0 .825-.675 1.5-1.5 1.5h-21C.675 6 0 5.325 0 4.5S.675 3 1.5 3h21c.825 0 1.5.675 1.5 1.5zM24 12c0 .825-.675 1.5-1.5 1.5h-21C.675 13.5 0 12.825 0 12s.675-1.5 1.5-1.5h21c.825 0 1.5.675 1.5 1.5zM24 19.5c0 .825-.675 1.5-1.5 1.5h-21C.675 21 0 20.325 0 19.5S.675 18 1.5 18h21c.825 0 1.5.675 1.5 1.5z"/></g></svg>
                        </label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
