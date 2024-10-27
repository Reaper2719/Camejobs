// Información para cada acordeón
const accordionData = {
    informacion1: {
        id: 'informacion1',
        text: `En <b>EMCALI</b> buscamos programador Junior con experiencia en el manejo de lenguajes para la creación de bases de datos, habilidad para método de relación de entidades y buen trabajo en equipo.<br>
            Salario: 3.200.000 con prestaciones de ley.<br>
            Tiempo: Jornadas rotativas de 8 horas, con entrada de 6 AM y 2 PM.<br>
            Experiencia: 1 año comprobable o sustentar proyectos propios.`
    },
    informacion2: {
        id: 'informacion2',
        text: `En <b>MOVISTAR</b> buscamos programador Junior con experiencia en diseño web y bases de datos.<br>
            Salario: 2.800.000 con prestaciones de ley.<br>
            Tiempo: Jornadas rotativas de 8 horas, con entrada de 8 AM y 4 PM.<br>
            Experiencia: 6 meses o más en diseño web.`
    },
    informacion3: {
        id: 'informacion3',
        text: `En <b>CLARO</b> buscamos estudiante de programación de Software en etapa productiva.<br>
            Salario: 1.200.000.<br>
            Tiempo: Media jornada.<br>
            Experiencia: No requerida, pero es deseable tener conocimientos previos.`
    }
};

// Función para crear el HTML del acordeón
function getAccordionHtml(infoId, infoText) {
    return `
        <div id="accordion-container" style="margin-left: 70px; width: 910px">
        <div id="${infoId}" style="display: none; padding: 10px; border: 1px solid #ccc; border-radius: 5px; position: relative;">
            <button onclick="closeAccordion('${infoId}')" style="position: absolute; top: 6px; right: 6px; background: #f44336; border: none; color: white; font-size: 18px; cursor: pointer; border-radius: 50%; width: 30px; height: 30px; text-align: center;">&times;</button>
            <p style="margin-top: 40px;">${infoText}</p>
            <button id="postular">Postularse</button>
        </div>
    `;
}

// Mostrar el acordeón
function showAccordion(id) {
    let info = document.getElementById(id);
    info.style.display = "block";  // Solo mostrar el acordeón
    event.preventDefault();
}

// Cerrar el acordeón al hacer clic en la "X"
function closeAccordion(id) {
    let info = document.getElementById(id);
    info.style.display = "none";  // Ocultar la ventana desplegable
}

// Cargar los acordeones en los contenedores correspondientes
function loadAccordions() {
    document.getElementById('accordion-container-emcali').innerHTML = getAccordionHtml(accordionData.informacion1.id, accordionData.informacion1.text);
    document.getElementById('accordion-container-movistar').innerHTML = getAccordionHtml(accordionData.informacion2.id, accordionData.informacion2.text);
    document.getElementById('accordion-container-claro').innerHTML = getAccordionHtml(accordionData.informacion3.id, accordionData.informacion3.text);
}

// Cargar los acordeones al cargar la página
window.onload = loadAccordions;
