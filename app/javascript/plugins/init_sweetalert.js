// app/javascript/plugins/init_sweetalert.js
import swal from 'sweetalert';

const initSweetalert = (selector, options = {}) => {
  const swalButtons = document.querySelectorAll(selector);
  if (swalButtons.length > 0) { // protect other pages
    swalButtons.forEach(swalButton => {
      swalButton.addEventListener('click', () => {
        swal(options);
      });
    });
  }
};

export { initSweetalert };