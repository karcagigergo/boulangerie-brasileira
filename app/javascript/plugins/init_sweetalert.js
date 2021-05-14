import swal from 'sweetalert';

const initSweetalert = (selector, options = {}, callback = () => {}) => {
  const swalButton = document.querySelector(selector);
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal(options).then(callback); // <-- add the `.then(callback)`
    });
  }
};

export { initSweetalert };

// initSweetalert('#sweet-alert', {
//   title: "Are you sure?",
//   text: "This action cannot be reversed",
//   icon: "warning"
// }, (value) => {
//   if (value) {
//     const link = document.querySelector('#delete-link');
//     link.click();
//   }
// });