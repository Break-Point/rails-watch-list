import { initSweetalert } from '../plugins/init_sweetalert';

document.addEventListener('turbolinks:load', () => {
  // Call your JS functions here
  // [...]
  initSweetalert('#sweet-alert-demo', {
    title: "A nice alert",
    text: "This is a great alert, isn't it?",
    icon: "success"
  });
});