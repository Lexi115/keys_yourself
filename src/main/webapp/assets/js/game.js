let genreList = [];
let genresSelect = document.getElementById("genresSelect");
let genreListUl = document.getElementById("genreListUl");
let genreInput = document.getElementById("genreInput");
let myForm = document.getElementById("myForm");
let btnFile = document.getElementById("btnFile");
let imageField = document.getElementById("imageField");
let imagePreview = document.getElementById("imagePreview");

btnFile.onclick = function () {
    imageField.click();
}

imageField.onchange = function (event) {
    let photo = event.target.files[0];

    // Se è maggiore di 10 MB, scarta
    if (photo.size > 10 * 1024 * 1024) {
        alert('Il file è troppo grande (max 10 MB)');
        imageField.value = null;
        return false;
    }

    // Se non è un immagine, scarta
    if (!photo.type.startsWith('image')) {
        alert('Il file caricato non è un\'immagine');
        imageField.value = null;
        return false;
    }

    // Se non è un file .jpeg / .jpg, scarta
    let photoName = photo.name.toLowerCase();
    if (!photoName.endsWith('.jpg') && !photoName.endsWith('.jpeg')) {
        alert('Il file caricato non è un .jpg o .jpeg');
        imageField.value = null;
        return false;
    }

    // crea url temporaneo per immagine
    imagePreview.src = URL.createObjectURL(photo);

    imagePreview.onload = function () {
        // libera memoria
        URL.revokeObjectURL(imagePreview.src);
    }
}

myForm.onsubmit = function () {
    genresToString();

    if (genreInput.value === '') {
        alert('Aggiungere almeno un genere!');
        return false;
    }

    if (imageField.value === null) {
        alert('Caricare una immagine!');
    }
}

genresSelect.oninput = function () {
    let genreId = genresSelect.value;
    let genreName = document.getElementById("genre-" + genreId).innerHTML;
    addGenre(genreId, genreName);
}


function printGenreList() {
    genreListUl.innerHTML = "";

    genreList.forEach(genre => {
        let li = document.createElement('li');
        let xSpan = document.createElement('span');

        xSpan.innerHTML = '<i style="color:red; padding-right: 5px" class="bi bi-x-lg"></i>';
        xSpan.classList.add("clickableNoShadow");
        xSpan.onclick = function () {
            removeGenre(genre);
        }
        li.appendChild(xSpan);
        let genreName = document.createTextNode(genre.name); // innerHTML non va bene qui
        li.appendChild(genreName);
        genreListUl.appendChild(li);
    });

    console.log(genreList);
}

function addGenre(genreId, genreName) {
    if (!genreListContains(genreId)) {
        genreList.push({
            id: genreId,
            name: genreName
        });
    }
    printGenreList();
    genresSelect.value = null;
}

function genreListContains(genreId) {
    for (let i = 0; i < genreList.length; i++) {
        let obj = genreList[i];
        if (obj.id === genreId) {
            return true;
        }
    }

    return false;
}

function removeGenre(genre) {
    const index = genreList.indexOf(genre);
    if (index > -1) {
        genreList.splice(index, 1);
    }
    printGenreList();
}
function genresToString(){
    let resultString = "";
    for (let i = 0; i < genreList.length; i++) {
        resultString += genreList[i].id + ",";
    }
    resultString = resultString.slice(0, -1); // rimuove ultimo carattere (la virgola)
    genreInput.value = resultString;
}
