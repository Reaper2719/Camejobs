function ampliarImagen(src) {
    document.getElementById('modal-img').src = src;
    document.getElementById('modal').style.display = 'flex';
}
document.getElementById('modal').addEventListener('click', function() {
    this.style.display = 'none';
});