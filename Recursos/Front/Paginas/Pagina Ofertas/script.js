function toggleDetailedCard(id) {
    const detailedCard = document.getElementById(id);
    detailedCard.classList.toggle('hidden');
}

function toggleOptions(id) {
    const optionsMenu = document.getElementById(id);
    optionsMenu.style.display = optionsMenu.style.display === "block" ? "none" : "block";
}

function toggleFavorite(event) {
    const button = event.currentTarget;
    button.classList.toggle('favorited');
    if (button.classList.contains('favorited')) {
        button.innerHTML = '<span style="color: red;">❤️</span> Agregado a favoritos';
    } else {
        button.innerHTML = '<span style="color: black;">❤️</span> Agregar a favoritos';
    }
}

// Cierra los menús de opciones al hacer clic fuera de ellos
window.onclick = function(event) {
    if (!event.target.matches('.options button')) {
        const dropdowns = document.getElementsByClassName("options-menu");
        for (let i = 0; i < dropdowns.length; i++) {
            dropdowns[i].style.display = "none";
        }
    }
};
