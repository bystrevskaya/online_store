function changeImg(img) {
    imgMain['src'] = img['target']['src'];
}

function changeImgToDefault() {
    imgMain['src'] = imgMainURL;
}

const imgMain = document.querySelector('.product__images-main');
const imgSmall = document.querySelectorAll('.product__images-small');

const minusButton = document.querySelector('.product__info-minus');
const countInput = document.querySelector('.product__info-count');
const plusButton = document.querySelector('.product__info-plus');

imgMain['src'] = imgSmall[0]['src'];
imgMain['alt'] = imgSmall[0]['alt'];

const imgMainURL = imgSmall[0]['src'];

imgSmall.forEach(img => {
    img.onmouseover = changeImg;
    img.onmouseout = changeImgToDefault;
}) 

countInput.addEventListener('change', checkPositivity)

minusButton.onclick = function() { countInput.value -= 1; checkPositivity(); }
plusButton.onclick = function() { countInput.value = parseInt(countInput.value) + 1; checkPositivity(); }