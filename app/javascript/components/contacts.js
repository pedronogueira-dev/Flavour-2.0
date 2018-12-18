const addEventListenersToContacts = function() {

  // grab all of the forms and add event listeners to the check boxs If the forms exist

  // grabing all the forms for the user intrests
  const contacts = document.querySelectorAll(".edit_contact")

  // check that the variable intersts is not empty so that this JS is restricted
  // to the page we want.
  if ( contacts.length > 0) {
    // get each form by class name
    const submitButtons = document.getElementsByClassName("submit-interests");
    var i;
    // iterate over the forms when a evenlistener is triggered submit each form
    for(i=0; i<submitButtons.length; i++) {
      const form = submitButtons[i].closest("form")
      submitButtons[i].addEventListener("click", (event) => {

        form.submit();
      });
    }
  }
};

export { addEventListenersToContacts };

