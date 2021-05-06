import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  if (document.querySelector('#banner-typed-text')){ 
    new Typed('#banner-typed-text', {
      strings: ["Movies Movies Movies!!!", "Check out my watchlist"],
      typeSpeed: 60,
      loop: true
    });
  } 
}

export { loadDynamicBannerText };