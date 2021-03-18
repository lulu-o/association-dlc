const hideFlash = () => {
  const flashes = document.querySelectorAll(".alert");
  flashes.forEach((flash) => {
    setTimeout(function () {
      flash.style.opacity = 0;
    }, 2000);
  })

}

export { hideFlash };
