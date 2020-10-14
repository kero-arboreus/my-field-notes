document.addEventListener('DOMContentLoaded', function(){
  const ImageList = document.getElementById('image_list');

  const createImageHTML = (blob) => {

    const imageElement = document.createElement('div');
    imageElement.setAttribute('class', "image-element")
    let imageElementNum = document.querySelectorAll('.image-element').length

    const blobImage = document.createElement('img');
    blobImage.setAttribute('src', blob);

    const inputHTML = document.createElement('input')
    inputHTML.setAttribute('id', `article_image_${imageElementNum}`)
    inputHTML.setAttribute('name', 'article[images][]')
    inputHTML.setAttribute('type', 'file')

    imageElement.appendChild(blobImage);
    imageElement.appendChild(inputHTML);
    ImageList.appendChild(imageElement);
    blobImage.width = 150;
    blobImage.height = 150;
   
    inputHTML.addEventListener('change', (e) => {
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);
    
    createImageHTML(blob);
    })
  }
  
    document.getElementById('article_image').addEventListener('change', (e) => {
    let file = e.target.files[0];
    let blob = window.URL.createObjectURL(file);

    createImageHTML(blob)
   });
 });
