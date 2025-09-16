let index = 0;
let autoAdvance; // Variable para manejar el auto avance

function moverSlide(direccion) {
    const slides = document.querySelector('.slides');
    const totalSlides = Math.ceil(document.querySelectorAll('.slide').length); // Total de grupos de imágenes

    // Mueve el índice según la dirección
    index += direccion;

    // Si el índice es menor que 0, vuelve al último grupo de imágenes
    if (index < 0) {
        index = totalSlides - 1;
    }

    // Si el índice es mayor que el número total de grupos de imágenes, vuelve al primero
    if (index >= totalSlides) {
        index = 0;
    }

    // Mueve el carrusel al grupo de imágenes correspondiente
    slides.style.transform = `translateX(${-index * 50}%)`; // Cambia a -index * 100%

    // Reinicia el auto avance al mover manualmente
    iniciarAutoAvance();
}

function iniciarAutoAvance() {
    // Limpia cualquier auto avance previo
    clearInterval(autoAdvance);

    // Configura el auto avance
    autoAdvance = setInterval(() => {
        moverSlide(1); // Avanza al siguiente slide automáticamente
    }, 5000); // Cambia de slide cada 3 segundos
}

function detenerAutoAvance() {
    clearInterval(autoAdvance); // Detiene el auto avance
}

// Inicia el auto avance al cargar la página
document.addEventListener('DOMContentLoaded', iniciarAutoAvance);
