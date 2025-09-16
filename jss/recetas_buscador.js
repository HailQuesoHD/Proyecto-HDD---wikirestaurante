// Selecciona el input y las secciones de recetas
const buscador = document.getElementById('buscador');
const recetas = document.querySelectorAll('.cont_receta1');

buscador.addEventListener('input', (e) => {
    const texto = e.target.value.toLowerCase(); // Convierte a minúsculas para búsqueda insensible a mayúsculas
    recetas.forEach(receta => {
        const tituloReceta = receta.querySelector('.cont-titulo_recetario').textContent.toLowerCase(); // Toma el texto del título
        if (tituloReceta.includes(texto)) {
            receta.style.display = ''; // Muestra la receta si coincide
        } else {
            receta.style.display = 'none'; // Oculta la receta si no coincide
        }
    });
});
