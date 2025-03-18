function applyFilters() {
    const searchText = document.getElementById('searchBar').value.toLowerCase();
    const ubicacion = document.getElementById('filterUbicacion').value;
    const salario = document.getElementById('filterSalario').value;
    const empresa = document.getElementById('filterEmpresa').value;

    const users = document.getElementsByClassName('oferta-card');

    for (let user of users) {
        const oferta = user.querySelector('.oferta'); // accede al contenido interno

        const userUbicacion = oferta.getAttribute('data-ubicacion');
        const userEmpresa = oferta.getAttribute('data-empresa');
        const userTitulo = oferta.getAttribute('data-titulo').toLowerCase();
        const userDescripcion = oferta.getAttribute('data-descripcion').toLowerCase();

        let userSalario = oferta.getAttribute('data-salario');
        // Limpiar salario (quitar "$", "," y "(Mensual)")
        userSalario = parseInt(userSalario.replace(/[$.,\s()]/g, ''));

        // Evaluación del rango de salario
        let salarioMatch = false;
        if (!salario) {
            salarioMatch = true; // Si no selecciona nada, todo entra
        } else {
            const [min, max] = salario.split('-');
            if (max === 'mas') {
                salarioMatch = userSalario >= parseInt(min);
            } else {
                salarioMatch = userSalario >= parseInt(min) && userSalario <= parseInt(max);
            }
        }

        // Filtros activos de filtros
        const ubicacionMatch = !ubicacion || userUbicacion === ubicacion;
        const empresaMatch = !empresa || userEmpresa === empresa;

         // Buscar palabra clave en título, descripción o empresa
         const searchMatch =
         userTitulo.includes(searchText) ||
         userDescripcion.includes(searchText) ||
         userEmpresa.toLowerCase().includes(searchText) ||
         searchText === ""; // Si está vacío, entra todo
  

        // Mostrar u ocultar tarjeta
        if (ubicacionMatch && salarioMatch && empresaMatch && searchMatch) {
            user.style.display = 'block';
        } else {
            user.style.display = 'none';
        }
    }
}

document.addEventListener('DOMContentLoaded', function () {
    const toggleFiltrosBtn = document.getElementById('toggleFiltros');
    const filtrosContainer = document.getElementById('filtrosContainer');

    toggleFiltrosBtn.addEventListener('click', function () {
        filtrosContainer.classList.toggle('show'); // Clase CSS que muestra/oculta
    });
});