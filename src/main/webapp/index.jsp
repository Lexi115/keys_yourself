<%@ page import="com.sicappiello.keysyourself.util.Functions" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="./assets/css/style.css" rel="stylesheet">
    <link href="./assets/css/custom.css" rel="stylesheet">
</head>
<body>
<jsp:include page="WEB-INF/include/header.jsp" />
<jsp:include page="WEB-INF/include/errorAlert.jsp" />
<jsp:include page="WEB-INF/include/infoAlert.jsp" />

<main>

    <!-- Banner -->
    <div class="bg-container">

        <section class="hero">

            <h1 class="hero-title">Benvenuto</h1>
            <p class="hero-subtitle">Scopri i migliori giochi ai prezzi più bassi del mercato</p>

        </section>
        <!-- Sfondo scorrevole -->

        <div class="hero-bg"></div>

    </div>
    <!-- Parte principale -->
    <div class="container w-90">

        <section>
            <h2>Giochi del giorno</h2>
        </section>

        <section>
            <h2>Selezionati per te</h2>
        </section>

        <section>
            <h2>Sotto i €10</h2>
        </section>


    </div>
</main>
<script>
    // JavaScript può essere aggiunto qui
</script>
</body>
</html>
