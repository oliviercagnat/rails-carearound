const initCosmeImage = () => {
  const video = document.querySelector('.image-video');
  const startbutton = document.querySelector('.image-startbutton');
  const canvas = document.createElement('canvas');
  let width = 400;    // We will scale the photo width to this
  let height = 0;
  let streaming = false;
  navigator.mediaDevices.getUserMedia({ video: true, audio: false, facingMode: 'user' })
    .then(function (stream) {
      video.srcObject = stream;
      video.play();
    })
    .catch(function (err) {
      console.log("An error occurred: " + err);
    });
  video.addEventListener('canplay', function (ev) {
    if (!streaming) {
      height = video.videoHeight / (video.videoWidth / width);
      video.setAttribute('width', width);
      video.setAttribute('height', height);
      canvas.setAttribute('width', width);
      canvas.setAttribute('height', height);
      streaming = true;
    }
  }, false);

const takePicture = async () => {
  var context = canvas.getContext('2d');
  canvas.width = width;
  canvas.height = height;
  context.drawImage(video, 0, 0, width, height);
  let data = await new Promise((resolve) => {
    canvas.toBlob(resolve, 'image/png');
  });
  // Wrap the selfie and an automated title in a formData
  const formData = new FormData();
  formData.append('cosmetic[cosmetic_image]', data, 'cosme_image.png');
  formData.append('cosmetic[name]', `Picture taken on ${(new Date).toString()}`);
  // Change the 📸 button to ✅ and freeze the video
  // when the selfie is taken
  startbutton.innerText = "✅";
  video.pause();
  // Send the selfie to Rails backend to store it
  const newForm = document.getElementById("cosmetic_cosmetic_image");
  newForm.append('cosmetic[cosmetic_image]', data, 'cosme_image.png');

    let response = await fetch('/cosmetics', {
      method: 'POST',
      body: formData
    });

    let result = await response.json();

    alert(result.message);
  window.location.href("")
}

navigator.mediaDevices.getUserMedia({ video: true, audio: false })
  .then(function (stream) {
    video.srcObject = stream;
    video.play();
  })
  .catch(function (err) {
    console.log("An error occurred: " + err);
  });
video.addEventListener('canplay', function (ev) {
  if (!streaming) {
    height = video.videoHeight / (video.videoWidth / width);
    video.setAttribute('width', width);
    video.setAttribute('height', height);
    canvas.setAttribute('width', width);
    canvas.setAttribute('height', height);
    streaming = true;
  }
}, false);

startbutton.addEventListener('click', (event) => {
  event.preventDefault();
  takePicture();
});
}


export { initCosmeImage };
