const days = document.querySelectorAll('.day');

// const requestDelete = (date) => {
//   console.log(date);

//   fetch("/availability", {
//     method: "DELETE",
//     headers: {
//       "Content-Type": "application/json",
//       "X-CSRF-Token": Rails.csrfToken()
//     },
//     credencials: 'same-origin',
//     body: JSON.stringify({ date: date })
//   }
//   )
//     .then(response => {
//       console.log(response);
//       response.json() })
//     .then((data) => {
//       console.log(data.hits); // Look at local_names.default

//     });
// }

const reserveAvailability = (date) => {
  console.log(date);
  fetch("/availabilities", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "X-CSRF-Token": Rails.csrfToken()
    },
    credencials: 'same-origin',
    body: JSON.stringify({ date: date })
  }
  )
    .then(response => {
      console.log(response);
      response.json() })
    .then((data) => {
      document.location.reload(true);
    });
}

const addDayListener = (day) => {
  day.addEventListener('click', (event) => {
    let target = event.currentTarget;
    if (target.children.length == 0) {
      // console.log(">>>DELETE AVAILABILITY");
      // requestDelete(new Date(target.innerText));
    // }else{
      console.log(">>>CREATE AVAILABILITY");
      reserveAvailability(new Date(target.innerText));
    }
  });
};

const calendarListener = () => {
  if(days){
    days.forEach((day) => {
      addDayListener(day);
    })
  }
};

export { calendarListener };
