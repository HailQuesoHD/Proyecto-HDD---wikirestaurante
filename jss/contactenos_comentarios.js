document.getElementById("form-comentario").addEventListener("submit", function (e) {
    e.preventDefault(); // Evita el envío del formulario

    // Obtener los valores ingresados
    const nombre = document.getElementById("nombre_com").value.trim();
    const comentario = document.getElementById("comentario").value.trim();

    // Validar que los campos no estén vacíos
    if (!nombre || !comentario) {
        let mensajeError = document.getElementById("mensaje-error");
        if (!mensajeError) {
            mensajeError = document.createElement("div");
            mensajeError.id = "mensaje-error";
            mensajeError.style.color = "red";
            mensajeError.textContent = "Por favor, completa ambos campos.";
            this.appendChild(mensajeError); // Agrega el mensaje al formulario
        }
        return;
    }

    // Eliminar mensaje de error si existe
    const mensajeError = document.getElementById("mensaje-error");
    if (mensajeError) mensajeError.remove();

    // Crear un nuevo div para el comentario
    const nuevoComentario = document.createElement("div");
    nuevoComentario.className = "comentario";
    nuevoComentario.innerHTML = `<p><strong>${nombre}:</strong> ${comentario}</p>`;

    // Agregar el nuevo comentario al inicio de la sección de comentarios publicados
    const comentariosPublicados = document.getElementById("comentarios-publicados");
    comentariosPublicados.insertBefore(nuevoComentario, comentariosPublicados.firstChild);

    // Limpiar los campos del formulario
    document.getElementById("nombre").value = "";
    document.getElementById("comentario").value = "";
});
