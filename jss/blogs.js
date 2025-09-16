// Rutas de las imágenes que deseas alternar
const imagenes = ["../imagenes/david_deprimido.png", "../imagenes/david_deprimido2.png"];
let indiceActual = 0;

// Obtén el elemento de la imagen por su ID
const imagenElement = document.getElementById('queso');

// Función para cambiar la imagen
function cambiarImagen() {
    indiceActual = (indiceActual + 1) % imagenes.length; // Alterna entre 0 y 1
    imagenElement.src = imagenes[indiceActual]; // Cambia el src de la imagen
}

// Configura el intervalo para cambiar la imagen cada 500 ms (medio segundo)
setInterval(cambiarImagen, 500);
