// Asegurar que todos los modales estén ocultos al cargar la página
document.addEventListener("DOMContentLoaded", function () {
    let modales = document.getElementsByClassName("modal");
    for (let i = 0; i < modales.length; i++) {
        modales[i].style.display = "none";
    }
});

// Función para abrir el modal solo cuando se haga clic en una oferta
function abrirModal(id) {
    let modal = document.getElementById(id);
    if (modal) {
        modal.style.display = "flex"; // Se muestra solo al hacer clic en una oferta
        document.body.classList.add("modal-abierto");
    }
}

// Función para cerrar el modal correctamente
function cerrarModal(id) {
    let modal = document.getElementById(id);
    if (modal) {
        modal.style.display = "none";
        document.body.classList.remove("modal-abierto");
    }
}

// Cerrar modal si el usuario hace clic fuera del contenido
window.onclick = function(event) {
    let modales = document.getElementsByClassName("modal");
    for (let i = 0; i < modales.length; i++) {
        if (event.target === modales[i]) {
            modales[i].style.display = "none";
            document.body.classList.remove("modal-abierto");
        }
    }
};