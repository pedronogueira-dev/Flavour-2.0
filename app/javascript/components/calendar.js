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

  if (day.children.length == 0 ){
    // let date = new Date(day.innerText);
    // date.setHours(0,0,0,0);
    // let min_date = new Date();
    // min_date.setDate(min_date.getDate() + 7);
    // min_date.setHours(0,0,0,0);
    // let max_date = new Date();
    // max_date.setDate(min_date.getDate() + 7);
    // max_date.setHours(0,0,0,0);

    // if(date >= min_date && date <= max_date){
      let date = new Date(day.innerText)
      date.setHours(0,0,0,0);
      if(scheduling_day(date)){
        // debugger;
        day.classList.add("selectable-day");
        day.addEventListener('click', (event) => {

        console.log(">>>CREATE AVAILABILITY");
        reserveAvailability(date);
      });
    }
  }else{
     day.classList.add("applied-day");
  }
};

const calendarListener = () => {
  if(days){
    days.forEach((day) => {
      addDayListener(day);
    })
  }
};

const scheduling_day = (date) =>{

  let min_date = new Date();
  min_date.setDate(min_date.getDate() + 7);
  min_date.setHours(0,0,0,0);
  let max_date = new Date();
  max_date.setDate(min_date.getDate() + 14);
  max_date.setHours(0,0,0,0);

  return date >= min_date && date <= max_date
};

export { calendarListener };
