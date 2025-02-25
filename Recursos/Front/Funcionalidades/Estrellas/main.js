const btnResena = document.getElementById('btn-resena');
const modal = document.getElementById('modal');
const cerrarModal = document.getElementById('cerrar-modal');
const estrellas = document.querySelectorAll('.estrellas-seleccion i');
const puntajeInput = document.getElementById('puntaje');

let calificaciones = { 1: 0, 2: 0, 3: 0, 4: 0, 5: 0 };
let totalCalificaciones = 0;
let sumaCalificaciones = 0;

// Abrir modal
btnResena.addEventListener('click', () => modal.style.display = 'flex');

// Cerrar modal
cerrarModal.addEventListener('click', () => modal.style.display = 'none');

// Selección de estrellas
estrellas.forEach((estrella) => {
    estrella.addEventListener('click', () => {
        const valor = estrella.getAttribute('data-valor');
        puntajeInput.value = valor;

        // Remover la clase 'seleccionada' de todas las estrellas
        estrellas.forEach((e) => e.classList.remove('seleccionada'));

        // Añadir la clase 'seleccionada' a las estrellas seleccionadas y anteriores
        for (let i = 0; i < valor; i++) {
            estrellas[i].classList.add('seleccionada');
        }
    });
});

// Enviar reseña
document.getElementById('submit-resena').addEventListener('click', () => {
    const nombre = document.getElementById('nombre').value;
    const estrellas = parseInt(puntajeInput.value);
    const comentario = document.getElementById('comentario').value;

    if (nombre && estrellas && comentario) {
        calificaciones[estrellas]++;
        totalCalificaciones++;
        sumaCalificaciones += estrellas;

        // Actualizar calificación promedio
        document.getElementById('calificacion-promedio').textContent = (sumaCalificaciones / totalCalificaciones).toFixed(1);

        // Actualizar barras de calificación
        for (let i = 1; i <= 5; i++) {
            const porcentaje = totalCalificaciones > 0 ? (calificaciones[i] / totalCalificaciones) * 100 : 0;
            document.getElementById(`contador-${i}`).textContent = calificaciones[i];
            document.getElementById(`barra-${i}`).style.width = `${porcentaje}%`;
        }

        // Añadir nueva reseña
        const nuevaResena = document.createElement('div');
        nuevaResena.classList.add('resena');
        nuevaResena.innerHTML = `<h4>${nombre} - <span class="estrellas">${'★'.repeat(estrellas)}</span></h4><p>${comentario}</p>`;
        document.getElementById('lista-resenas').appendChild(nuevaResena);

        // Cerrar modal y resetear formulario
        modal.style.display = 'none';
        document.getElementById('nombre').value = '';
        document.getElementById('comentario').value = '';
        puntajeInput.value = '0';
        estrellas.forEach((e) => e.classList.remove('seleccionada'));
    } else {
        alert('Por favor completa todos los campos.');
    }
});