const hideFlash = () => {
  const body = document.querySelector('body');
  const flashes = document.querySelectorAll(".alert");
  flashes.forEach((flash) => {
    setTimeout(function () {
      flash.style.opacity = 0;
    }, 1000);
  })

}

export { hideFlash };
