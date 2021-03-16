const favs = () => {

	const heart = document.getElementById('heart-fav');
	if (heart) {
	  heart.addEventListener('click', () => {
	    heart.classList.add('heartpop');
	    setTimeout(() => {
	      heart.classList.remove('heartpop');
	    }, 400);
	  });
	}
};

export { favs };