import flatpickr from 'flatpickr';
import 'flatpickr/dist/flatpickr.css';

const availabilityDate = document.getElementById('availability_date');

const picker = () => {
  let min = new Date();
  min.setDate(min.getDate() + 7);

  let max = new Date();
  max.setDate(min.getDate() + 14);

  if (availabilityDate) {
    flatpickr(availabilityDate, {
      minDate: min,
      maxDate: max,
      altInput: true,
      altFormat: "F j, Y",
      dateFormat: "Y-m-d"
    });
  }
};

export { picker };
