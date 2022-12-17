var slideIndex = 0;
var delay = 4000;
showSlides(slideIndex);

// Next/previous controls
function plusSlides(n) {
    showSlides(slideIndex += n);
    //sleep(delay);
}

// Thumbnail image controls
function currentSlide(n) {
    showSlides(slideIndex = n);
    //sleep(delay);
}

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    slideIndex++;
    if (slideIndex > slides.length) {
        slideIndex = 1
    }
    slides[slideIndex - 1].style.display = "block";
    setTimeout(showSlides, delay); // Change image every 4 seconds
}