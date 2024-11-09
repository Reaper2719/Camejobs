const darkModeInput = document.querySelector('#darkmode');
                
darkModeInput.addEventListener('click', () => {
    // Alternar la clase 'dark' en el elemento raíz (html)
    document.documentElement.classList.toggle('dark');
    
    // Cambiar el texto del botón según el modo
    if (document.documentElement.classList.contains('dark')) {
        darkModeInput.textContent = 'Modo Claro';
    } else {
        darkModeInput.textContent = 'Modo Oscuro';
    }
});