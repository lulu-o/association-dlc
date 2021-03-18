const selectAsButtons = () => {
  const selectField = document.getElementById('radius');
  const options = document.querySelectorAll(".option");
  options.forEach((option) => {
    option.addEventListener('click', () => {
      options.forEach((option) => { option.classList.remove('selected')});
      const optionValue = option.getAttribute('data-value');
      option.classList.add('selected');
      selectField.setAttribute('value', optionValue);
    });
  });
};

export { selectAsButtons };
