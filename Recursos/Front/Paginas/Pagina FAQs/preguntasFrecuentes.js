// Cambiar entre temas generales
document.querySelectorAll('.topic-item').forEach(topic => {
    topic.addEventListener('click', () => {
        // Eliminar la clase "active" de todos los temas y ocultar todas las secciones FAQ
        document.querySelectorAll('.topic-item').forEach(item => item.classList.remove('active'));
        document.querySelectorAll('.faq-topic').forEach(topicContent => topicContent.style.display = 'none');

        // Marcar el tema seleccionado como activo y mostrar su FAQ
        topic.classList.add('active');
        const selectedTopicId = topic.getAttribute('data-topic');
        document.getElementById(selectedTopicId).style.display = 'block';
    });
});

// Mostrar y ocultar respuestas de FAQ
document.querySelectorAll('.faq-question').forEach(button => {
    button.addEventListener('click', () => {
        const answer = button.nextElementSibling;

        // Verificar si la FAQ está abierta
        if (button.classList.contains('active')) {
            button.classList.remove('active');
            answer.classList.remove('open');
            answer.style.height = '0';
            button.querySelector('.arrow-icon').style.transform = "rotate(0deg)";
        } else {
            // Cerrar otras preguntas abiertas
            document.querySelectorAll('.faq-question').forEach(btn => {
                btn.classList.remove('active');
                btn.nextElementSibling.classList.remove('open');
                btn.nextElementSibling.style.height = '0';
                btn.querySelector('.arrow-icon').style.transform = "rotate(0deg)";
            });

            // Abrir la FAQ seleccionada
            button.classList.add('active');
            answer.classList.add('open');
            answer.style.height = answer.scrollHeight + 'px';
            button.querySelector('.arrow-icon').style.transform = "rotate(180deg)";
        }
    });
});