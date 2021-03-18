const hideFlash = () => {
  const body = document.querySelector('body');
  const flashes = document.querySelectorAll(".alert");
  flashes.forEach((flash) => {
    setTimeout(function () {
      body.classList.remove("preload");
      flash.style.opacity = 0;
    }, 1000);
  })

}

export { hideFlash };
