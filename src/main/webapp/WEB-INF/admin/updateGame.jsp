<%@ page import="com.sicappiello.keysyourself.util.FileSize" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Modifica gioco</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../assets/css/style.css" rel="stylesheet">
    <link href="../assets/css/custom.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico">
</head>
<body>
<jsp:include page="/WEB-INF/include/header.jsp" />
<main>
    <div class="container w-90">
        <div class="row">
            <p class="lead">Modifica gioco</p>
        </div>

        <form action="editGame?id=${game.id}" method="post" id="myForm" enctype="multipart/form-data">
            <div class="row">
                <!-- Colonna dati del gioco -->
                <div class="col-lg-7 col-md-12 col-sm-12 p-6">
                    <jsp:include page="/WEB-INF/include/infoAlert.jsp" />
                    <jsp:include page="/WEB-INF/include/errorAlert.jsp" />
                    <div>
                        <h4>Dettagli gioco</h4>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 p-1">
                                <input name="name" type="text" class="input" id="name" placeholder="Nome" value="${game.name}" pattern=".{1,150}" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 p-1">
                                <input name="producer" type="text" class="input" id="producer" placeholder="Produttore" value="${game.producer}" pattern=".{1,50}" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 p-1">
                                <textarea name="description" class="input" id="description" placeholder="Descrizione del gioco qui..." minlength="5" maxlength="2000" required>${game.description}</textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3 col-md-6 col-sm-12 p-1">
                                <input name="price" type="number" step="0.01" class="input" id="price" placeholder="Prezzo" min="0" value="${game.price}" pattern="^\d{1,10}.\d{2}$" required>
                            </div>
                        </div>
                    </div>

                    <div>
                        <h4>Generi gioco</h4>
                        <div class="row">
                            <div class="col-lg-6 col-md-12 col-sm-12 p-1">
                                <select class="input" id="genresSelect">
                                    <option value="null" selected>Seleziona un genere</option>
                                    <c:forEach items="${applicationScope.genreList}" var="genre">
                                        <option id="genre-${genre.id}" value="${genre.id}">${genre.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-lg-5 col-md-12 col-sm-12 p-1 riepilogoContainer offset-md-0" style="margin-left:  3%; min-height:20px;">
                                <ul id="genreListUl" style="list-style-type: none;">
                                    <!-- lista generi riempita dinamicamente -->
                                </ul>
                            </div>
                        </div>

                        <input type="hidden" name="genres" id="genreInput">
                    </div>
                </div>

                <!-- Colonna aggiunta immagine -->
                <div class="col-lg-5 col-md-12 col-sm-12 p-6">
                    <h4>Modifica immagine gioco</h4>
                    <div class="riepilogoContainer">
                        <div class="thumbnail">
                            <img id="imagePreview" src="../assets/images/games/${game.id}.jpg" alt="Anteprima immagine">
                        </div>
                        <input type="file" class="input" style="display: none;" name="image" id="imageField">
                        <button class="fieldButton clickableNoShadow" type="button" id="btnFile"><i class="bi bi-cloud-upload"></i> Carica immagine</button>
                        <p style="margin-bottom: 0"><b>Max:</b> <%=FileSize.MAX_MB %> MB</p>
                    </div>

                    <button type="submit" class="mt-6 fieldButton clickableNoShadow">
                        <i class="bi bi-gear-wide-connected"></i> Modifica gioco
                    </button>
                </div>
            </div>
        </form>
    </div>
</main>

<script src="${pageContext.request.contextPath}/assets/js/game.js" type="text/javascript"></script>

<script>
    // Stampa generi del gioco già inseriti
    <c:forEach items="${game.genres}" var="genre">
    genreList.push({
        id: ${genre.id},
        name: "${genre.name}"
    });
    </c:forEach>
    printGenreList();
</script>
</body>
</html>