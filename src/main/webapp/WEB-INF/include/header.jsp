        <header class="sticky">
                <div class="row sticky navbar" id="row-menu" style="display: flex">
                    <!-- Logo -->
                    <div class="col-lg-2 col-md-12 flexHorizontal">
                        <a href="${pageContext.request.contextPath}/">
                            <img class="logo" src="${pageContext.request.contextPath}/assets/images/logo.png">
                        </a>
                    </div>

                    <div class="col-lg-2 col-md-0 col-sm-0"></div>

                    <!-- Barra di ricerca -->
                    <div class="col-lg-4 col-md-0 col-sm-0">
                        <form action="${pageContext.request.contextPath}/search" method="get">
                            <div class="row">
                                <div class="col-lg-10">
                                    <input type="text" name="query" class="searchbar" id="searchBar" value="${param.query}" placeholder="Cerca qui!">
                                </div>
                                <div class="col-lg-2 clickable">
                                    <button class="searchbutton" type="submit" title="Cerca"><i class="bi bi-search"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>

                    <!-- div di spazio -->
                    <div class="col-lg-1 col-md-0 col-sm-0"></div>

                    <!-- Menu -->
                    <div class="flexEnd col-lg-3 col-md-0 col-sm-0">
                        <span class="icon clickableNoShadow" title="Account">
                            <a href="${pageContext.request.contextPath}/profile"><i class="bi icon bi-person-circle"></i></a>
                        </span>
                        <span class="icon clickableNoShadow right" title="Carrello">
                            <a href="${pageContext.request.contextPath}/cart"><i class="bi icon bi-bag-fill"></i></a>
                        </span>
                    </div>

                    <!-- Menu (tablet e mobile) -->
                    <div class="col-lg-0 col-md-12 col-sm-12">
                        <div id="mobileButtons">
                            <div class="col-md-4 col-sm-4">
                                <div class="icon flexHorizontal clickableNoShadow" title="Account">
                                    <a href="${pageContext.request.contextPath}/profile"><i class="bi icon bi-person-circle"></i></a>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-4">
                                <div class="center clickableNoShadow">
                                    <button id="searchbutton" class="searchbutton" type="button" title="Cerca" style="border-radius: 30px" onclick="location.href = '${pageContext.request.contextPath}/search?query=';"><i class="bi bi-search"></i></button>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-4">
                                <div class="icon flexHorizontal clickableNoShadow" title="Carrello">
                                    <a href="${pageContext.request.contextPath}/cart"><i class="bi icon bi-bag-fill"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            <!-- Search bar per mobile -->
            <div class="row" id="row-searchBar" style="display: none">
                <div class="col-lg-0 col-md-12 col-sm-12">
                    <form action="search" method="get">
                        <div class="row">
                            <div class="col-lg-0 col-md-1 col-sm-2">
                                <button class="searchbutton" type="button" title="Home" onclick="location.href = '${pageContext.request.contextPath}/';"><i class="bi bi-house"></i></button>
                            </div>
                            <div class="col-lg-0 col-md-10 col-sm-8">
                                <input type="text" name="query" class="searchbar center" id="searchBarMobile" value="${param.query}" placeholder="Cerca qui!">
                            </div>
                            <div class="col-lg-0 col-md-1 col-sm-2">
                                <button class="searchbutton" type="submit" title="Cerca"><i class="bi bi-search"></i></button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </header>
        <script>
            let searchResult = document.getElementById('search-result');
            let mobileSearchBar = document.getElementById("row-searchBar");
            let menuBar = document.getElementById("row-menu");

            window.onload = function () {
                let searchBar = document.getElementById("searchBar");
                searchBar.onfocus = function () {
                    // reindirizza alla pagina di ricerca
                    if(!searchResult){
                        location.href = "${pageContext.request.contextPath}/search?query=";
                    }
                }

                window.onresize = function() {
                    // Solo se ci troviamo nella pagina di search
                    if (searchResult) {
                        switchBars();
                    }
                }

                if (searchResult) {
                    switchBars();
                }
            }

            function switchBars() {

                const mediaQuery = window.matchMedia('(max-width: 768px)')

                if(mediaQuery.matches){

                    // è un dispositivo mobile
                    mobileSearchBar.style.display = 'flex';
                    menuBar.style.display = 'none';
                    console.log(" matches");
                }
                else {
                    // NON è un dispositivo mobile
                    mobileSearchBar.style.display = 'none';
                    menuBar.style.display = 'flex';
                    console.log("not matches");
                }
            }
        </script>