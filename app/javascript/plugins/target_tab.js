const targetTabs = () => {
  const container = document.querySelector('.profil-container');

  if (container) {
    const targetAttr = container.getAttribute('target');
    const target = document.getElementById(targetAttr);
    const blockTarget = target.getAttribute('aria-controls');
    target.classList.remove('collapsed');
    target.setAttribute('aria-expanded', 'true');
    const block = document.getElementById(blockTarget);
    block.classList.add('show');
  }
};

export { targetTabs };
