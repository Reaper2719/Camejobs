function applyFilters() {
    const ubicacion = document.getElementById('filterUbicacion').value;
    const salario = document.getElementById('filterSalario').value;
    const contrato = document.getElementById('filterContrato').value;
    const empresa = document.getElementById('filterEmpresa').value;
    const categoria = document.getElementById('filterCategoria').value;

    const users = document.getElementsByClassName('oferta');

    for (let user of users) {
        const userUbicacion = user.getAttribute('data-ubicacion');
        const userSalario = user.getAttribute('data-salario');
        const userContrato = user.getAttribute('data-contrato');
        const userEmpresa = user.getAttribute('data-empresa');
        const userCategoria = user.getAttribute('data-categoria');

        const ubicacionMatch = !ubicacion || userUbicacion === ubicacion;
        const salarioMatch = !salario || userSalario === salario;
        const contratoMatch = !contrato || userContrato === contrato;
        const empresaMatch = !empresa || userEmpresa === empresa;
        const categoriaMatch = !categoria || userCategoria === categoria;

        if (ubicacionMatch && salarioMatch && contratoMatch && empresaMatch && categoriaMatch) {
            user.style.display = 'block'; 
        } else {
            user.style.display = 'none';
        }
    }
}