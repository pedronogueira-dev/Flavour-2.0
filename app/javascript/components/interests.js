const addEventListenersToInterests = function() {
  console.log('hey');

  // grab all of the forms and add event listeners to the check boxs If the forms exist

  const interests = document.querySelectorAll(".edit_user_interest")
  console.log(interests);

  if ( interests.length > 0) {
    interests.forEach((interest) => {
      const toggle = interest.querySelector(".switch");
      toggle.addEventListener("click", (event) => {
        console.log('boo!');
      });
    });
  }

};

export { addEventListenersToInterests };

