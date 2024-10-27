// Inicializar EmailJS con tu USER_ID
(function(){
    emailjs.init("TU_USER_ID"); // Reemplaza TU_USER_ID con el ID de usuario que te dio EmailJS
})();

// Escuchar el envío del formulario
document.getElementById('send-email-form').addEventListener('submit', function(event) {
    event.preventDefault();  // Prevenir que la página se recargue

    // Obtener los valores del formulario
    const imgURL = document.getElementById('image-url').value;
    const title = document.getElementById('title').value;
    const description = document.getElementById('description').value;
    const salary = document.getElementById('salary').value;
    const time = document.getElementById('time').value;
    const experience = document.getElementById('experience').value;
    const accordionInfo = document.getElementById('accordion-info').value;

    // Parámetros del correo a enviar
    const templateParams = {
        image_url: imgURL,
        title: title,
        description: description,
        salary: salary,
        time: time,
        experience: experience,
        accordion_info: accordionInfo
    };

    // Enviar el correo usando EmailJS
    emailjs.send('service_6o9bljo', 'Ttemplate_eg7wcul', templateParams)
    .then(function(response) {
        console.log('Correo enviado con éxito!', response.status, response.text);
        alert("Tarjeta enviada exitosamente por correo.");
    }, function(error) {
        console.log('Fallo al enviar el correo.', error);
        alert("Hubo un error al enviar el correo.");
    });
});
