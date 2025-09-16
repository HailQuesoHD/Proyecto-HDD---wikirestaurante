// Selecciona el input y los artículos de productos
const buscador = document.getElementById('buscador'); //nombre del buscador jamon
const productos = document.querySelectorAll('.cont_img'); //nombre del contenedor en el q estan los elementos q quieras buscar

buscador.addEventListener('input', (e) => {
    const texto = e.target.value.toLowerCase(); // Convierte a minúsculas para buscar de forma insensible a mayúsculas
    productos.forEach(producto => {
        const nombreProducto = producto.querySelector('p').textContent.toLowerCase(); // Toma el nombre del producto
        if (nombreProducto.includes(texto)) {
            producto.style.display = ''; // Muestra el producto si coincide
        } else {
            producto.style.display = 'none'; // Oculta el producto si no coincide
        }
    });
});
