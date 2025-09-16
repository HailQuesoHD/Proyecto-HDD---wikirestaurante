// Selecciona el input y los artículos de productos
const buscador = document.getElementById('buscador');
const productos = document.querySelectorAll('.producto_d1');

buscador.addEventListener('input', (e) => {
    const texto = e.target.value.toLowerCase(); // Convierte a minúsculas para buscar de forma insensible a mayúsculas
    productos.forEach(producto => {
        const nombreProducto = producto.querySelector('h3').textContent.toLowerCase(); // Toma el nombre del producto
        if (nombreProducto.includes(texto)) {
            producto.style.display = ''; // Muestra el producto si coincide
        } else {
            producto.style.display = 'none'; // Oculta el producto si no coincide
        }
    });
});
