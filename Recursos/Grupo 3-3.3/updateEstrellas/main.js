// Datos de calificaciones
let calificaciones = { 1: 0, 2: 0, 3: 0, 4: 0, 5: 0 };
let totalCalificaciones = 0;
let sumaCalificaciones = 0;
let calificacionSeleccionada = 0;

// Función para actualizar la calificación promedio y la gráfica de barras
function actualizarCalificacion() {
    let promedio = totalCalificaciones > 0 ? (sumaCalificaciones / totalCalificaciones).toFixed(1) : 0;
    document.getElementById('calificacion-promedio').textContent = promedio;

    // Actualizar las barras de calificación
    for (let i = 1; i <= 5; i++) {
        let barra = document.getElementById(`barra-${i}`);
        let contador = document.getElementById(`contador-${i}`);
        let porcentaje = (calificaciones[i] / totalCalificaciones) * 100 || 0;
        barra.style.width = `${porcentaje}%`;
        contador.textContent = calificaciones[i];
    }
}

// Función para manejar el clic en las estrellas
const estrellas = document.querySelectorAll('.estrella');
estrellas.forEach(estrella => {
    estrella.addEventListener('click', function () {
        calificacionSeleccionada = parseInt(this.getAttribute('data-calificacion'));

        // Marcar la estrella seleccionada
        estrellas.forEach(estrella => estrella.classList.remove('seleccionada'));
        for (let i = 0; i < calificacionSeleccionada; i++) {
            estrellas[i].classList.add('seleccionada');
        }

        // Mostrar modal para escribir reseña
        document.getElementById('modal').style.display = 'flex';
    });
});

// Función para agregar una reseña
function agregarResena(nombre, comentario, calificacion) {
    const seccionResenas = document.getElementById('seccion-resenas');
    const nuevaResena = document.createElement('div');
    nuevaResena.classList.add('resena');
    nuevaResena.innerHTML = `
        <h4>${nombre} - <span class="estrellas">${'★'.repeat(calificacion)}</span></h4>
        <p class="comentario">${comentario}</p>
    `;
    seccionResenas.prepend(nuevaResena);
}

// Manejar envío de reseña
document.getElementById('submit-resena').addEventListener('click', function () {
    const nombre = document.getElementById('nombre').value;
    const comentario = document.getElementById('comentario').value;

    // Validar que haya una calificación seleccionada
    if (calificacionSeleccionada > 0) {
        // Actualizar calificaciones
        calificaciones[calificacionSeleccionada]++;
        totalCalificaciones++;
        sumaCalificaciones += calificacionSeleccionada;

        // Agregar reseña
        agregarResena(nombre, comentario, calificacionSeleccionada);

        // Resetear modal
        document.getElementById('modal').style.display = 'none';
        document.getElementById('nombre').value = '';
        document.getElementById('comentario').value = '';
        estrellas.forEach(estrella => estrella.classList.remove('seleccionada'));

        // Actualizar gráficos
        actualizarCalificacion();
    }
});

// Cerrar modal
document.getElementById('cerrar-modal').addEventListener('click', function () {
    document.getElementById('modal').style.display = 'none';
});
