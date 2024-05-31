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
                        <input type="text" name="query" class="searchbar center" id="searchBar" value="${param.query}">
                    </div>
                    <div class="col-lg-1 clickable">
                        <button class="searchbutton" type="submit" title="Cerca"><i class="bi bi-search"></i></button>
                    </div>
                </div>
            </form>
        </div>

        <!-- div di spazio -->
        <div class="col-lg-2 col-md-0"></div>

        <!-- Menu -->
        <div class="col-lg-2 col-md-2 ">
            <div class="icon right clickableNoShadow" title="Account">
                <a href="login"><i class="bi icon bi-person-circle"></i></a>
            </div>
            <div class="icon right clickableNoShadow" title="Carrello">
                <a href="cart"><i class="bi icon bi-bag-fill"></i></a>
            </div>
        </div>
    </div>
</header>
<script>
    window.onload = function () {
        let searchBar = document.getElementById("searchBar");
        searchBar.oninput = function () {
            // parte richiesta asincrona
            fetch('AsyncSearch?q=' + searchBar.value)
                .then(response => response.json())
                .then(json => {
                        console.log(json);
                    }
                );
        }
    }
</script>