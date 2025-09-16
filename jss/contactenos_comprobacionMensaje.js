document.querySelector('.enviar_datos').addEventListener('submit_escribenos', function(event) {
    // Prevenir el envío del formulario
    event.preventDefault();

    // Obtener los campos del formulario
    const nombre = document.getElementById('nombre');
    const email = document.getElementById('email');
    const asunto = document.getElementById('asunto');
    const mensaje = document.getElementById('mensaje');

    // Reiniciar estilos de error
    resetErrorStyles([nombre, email, asunto, mensaje]);

    // Variable para rastrear errores
    let hasError = false;

    // Validar campos
    if (nombre.value.trim() === "") {
        showError(nombre, 'Por favor, ingresa tu nombre.');
        hasError = true;
    }

    if (email.value.trim() === "") {
        showError(email, 'Por favor, ingresa tu correo electrónico.');
        hasError = true;
    } else if (!validateEmail(email.value)) {
        showError(email, 'Por favor, ingresa un correo válido.');
        hasError = true;
    }

    if (asunto.value.trim() === "") {
        showError(asunto, 'Por favor, selecciona un asunto.');
        hasError = true;
    }

    if (mensaje.value.trim() === "") {
        showError(mensaje, 'Por favor, ingresa tu mensaje.');
        hasError = true;
    }

    // Si no hay errores, enviar el formulario
    if (!hasError) {
        alert('Formulario enviado con éxito.');
        this.submit(); // Solo enviará si todos los campos son válidos
    }
}); 

// Mostrar mensaje de error
function showError(input, message) {
    const errorDiv = document.createElement('div');
    errorDiv.className = 'error-message';
    errorDiv.textContent = message;
    input.parentElement.appendChild(errorDiv);
    input.style.borderColor = 'red';
}

// Reiniciar estilos de error
function resetErrorStyles(inputs) {
    inputs.forEach(input => {
        input.style.borderColor = '';
        const error = input.parentElement.querySelector('.error-message');
        if (error) {
            error.remove();
        }
    });
}

// Validar formato de email
function validateEmail(email) {
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailPattern.test(email);
}
