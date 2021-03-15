const tabs = () => {

	const tabs = document.querySelectorAll('.tab');
	const tabContainers = document.querySelectorAll('.tab-container');

	if (tabs) {
	  tabs.forEach((tab) => {
	    tab.addEventListener('click', () => {
	      tabs.forEach((element) => {element.classList.remove('active')});
	      tab.classList.add('active');
	      tabContainers.forEach((container) => { container.classList.remove('active') });
	      const contentId = tab.id.split('-')[1];
	      const activeContainer = document.getElementById(`shops-${contentId}-container`);
	      activeContainer.classList.add('active');
	    });
	  });
	}
};

export { tabs };