let navbar = document.querySelector("#navbar")


window.addEventListener("scroll", ()=>{
    if(window.scrollY > 0){
        navbar.classList.add("navbar-custom")
    }else {
        navbar.classList.remove("navbar-custom")
    }

});

function showSection(sectionId) {
    document.querySelectorAll('.content section').forEach(section => section.style.display = 'none');
    document.getElementById(sectionId).style.display = 'block';
}

function saveInfo(event) {
    event.preventDefault();
}

function aggiungiAnnuncio() {
    window.location.href = "addimmobile";
}

function salvaPreferenze() {
    // Save preferences logic
}

function salvaNotifiche() {
    // Save notifications logic
}

function cambiaPassword(event) {
    event.preventDefault();
}

document.addEventListener('DOMContentLoaded', () => {
    showSection('informazioni');
});
