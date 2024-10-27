document.addEventListener("DOMContentLoaded", () => {
    const formulario = document.getElementById("empresaForm");
    const nombreDisplay = document.getElementById("nombre-display");
    const sloganDisplay = document.getElementById("slogan-display");
    const descripcionDisplay = document.getElementById("descripcion-display");
    const logrosDisplay = document.getElementById("logros-display");
    const empresaLogo = document.getElementById("empresa-logo");
    const empleadosImg = document.getElementById("empleados-img");
    const modal = document.getElementById("confirmModal");
    const modalMessage = document.getElementById("modal-message");
    const confirmBtn = document.getElementById("confirm-btn");
    const cancelBtn = document.getElementById("cancel-btn");
    let actionType = '';

    // Manejar el evento de envío del formulario
    formulario.addEventListener("submit", (event) => {
        event.preventDefault(); // Evitar el envío del formulario
        actionType = 'guardar';
        showModal("¿Está seguro de guardar los datos de la empresa?");
    });

    // Manejar el evento de cancelación
    const cancelarBtn = document.querySelector(".cancelar-btn");
    cancelarBtn.addEventListener("click", (event) => {
        actionType = 'cancelar';
        showModal("¿Está seguro de cancelar la acción?");
    });

    // Función para mostrar el modal
    function showModal(message) {
        modalMessage.textContent = message;
        modal.classList.remove("hidden");
    }

    // Confirmar la acción en el modal
    confirmBtn.addEventListener("click", () => {
        modal.classList.add("hidden");

        if (actionType === 'guardar') {
            // Obtener los valores de los campos del formulario
            const nombreEmpresa = document.getElementById("nombreEmpresa").value;
            const sloganEmpresa = document.getElementById("sloganEmpresa").value;
            const descripcionEmpresa = document.getElementById("descripcionEmpresa").value;
            const logrosEmpresa = document.getElementById("logrosEmpresa").value;
            const logoEmpresaFile = document.getElementById("logoEmpresa").files[0];
            const imagenEmpleadosFile = document.getElementById("imagenEmpleados").files[0];

            // Mostrar los datos en el cuerpo principal
            nombreDisplay.textContent = nombreEmpresa;
            sloganDisplay.textContent = sloganEmpresa;
            descripcionDisplay.textContent = descripcionEmpresa;
            logrosDisplay.textContent = logrosEmpresa;

            // Mostrar el logo de la empresa
            if (logoEmpresaFile) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    empresaLogo.src = e.target.result;
                }
                reader.readAsDataURL(logoEmpresaFile);
            }

            // Mostrar la imagen de empleados
            if (imagenEmpleadosFile) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    empleadosImg.src = e.target.result;
                }
                reader.readAsDataURL(imagenEmpleadosFile);
            }

            // Reiniciar el formulario
            formulario.reset();
        } else if (actionType === 'cancelar') {
            // Aquí puedes agregar la lógica que necesites si se cancela
            console.log("Acción cancelada");
        }
    });

    // Cerrar el modal al presionar "No"
    cancelBtn.addEventListener("click", () => {
        modal.classList.add("hidden");
    });
});