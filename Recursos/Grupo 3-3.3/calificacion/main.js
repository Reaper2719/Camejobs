// Abrir modal
const btnResena = document.getElementById('btn-resena');
const modal = document.getElementById('modal');
const cerrarModal = document.getElementById('cerrar-modal');

btnResena.addEventListener('click', () => {
    modal.style.display = 'flex';
});

cerrarModal.addEventListener('click', () => {
    modal.style.display = 'none';
});

// Enviar reseña
const submitResena = document.getElementById('submit-resena');
const seccionResenas = document.getElementById('seccion-resenas');

submitResena.addEventListener('click', () => {
    const nombre = document.getElementById('nombre').value;
    const estrellas = document.getElementById('estrellas').value;
    const comentario = document.getElementById('comentario').value;

    if (nombre && estrellas && comentario) {
        const nuevaResena = document.createElement('div');
        nuevaResena.classList.add('resena');

        nuevaResena.innerHTML = `
            <h4>${nombre}</h4>
            <div class="fecha">${new Date().toLocaleDateString('es-ES', { year: 'numeric', month: 'long', day: 'numeric' })}</div>
            <div class="estrellas">${'★'.repeat(estrellas) + '☆'.repeat(5 - estrellas)}</div>
            <div class="comentario">${comentario}</div>
        `;

        seccionResenas.appendChild(nuevaResena);
        modal.style.display = 'none';

        // Reiniciar el formulario
        document.getElementById('nombre').value = '';
        document.getElementById('estrellas').value = '5';
        document.getElementById('comentario').value = '';
    } else {
        alert('Por favor completa todos los campos.');
    }
});
