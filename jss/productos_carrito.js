// Array para guardar los productos seleccionados
let carrito = [];

// Función para agregar productos al carrito
function agregarAlCarrito(nombre, precio) {
    // Añade el producto al carrito
    carrito.push({ nombre, precio });
    alert(`${nombre} se ha agregado al carrito.`);
    // Opcional: Guardar en localStorage para persistencia
    localStorage.setItem('carrito', JSON.stringify(carrito));
}
