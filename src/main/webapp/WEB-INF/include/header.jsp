<header>
    <div class="row sticky navbar">
        <!-- Logo -->
        <div class="col-lg-2 col-md-10">
            <a href="index.jsp">
            <img class="logo" src="assets/images/logo.png">
            </a>
        </div>

        <div class="col-lg-2 col-md-0"></div>

        <!-- Barra di ricerca -->
        <div class="col-lg-4 col-md-0">
            <form action="search" method="get">
                <div class="row">
                    <div class="col-lg-11">
                        <input type="text" name="query" class="searchbar center" value="${param.query}">
                    </div>
                    <div class="col-lg-1 clickable">
                        <button class="searchbutton" type="submit"><i class="bi bi-search"></i></button>
                    </div>
                </div>
            </form>
        </div>

        <!-- div di spazio -->
        <div class="col-lg-3 col-md-0"></div>

        <!-- Menu -->
        <div class="col-lg-1 col-md-2 ">
            <div class="icon right clickableNoShadow">
                <a href="login"><i class="bi icon bi-person-circle"></i></a>
            </div>
        </div>
    </div>
</header>