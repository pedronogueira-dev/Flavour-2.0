import "bootstrap";
import { addEventListenersToInterests } from '../components/interests';
// import { picker } from '../plugins/datepicker';
import { calendarListener } from '../components/calendar';
import { addEventListenersToContacts } from '../components/contacts';

addEventListenersToInterests();
addEventListenersToContacts();

// picker();
calendarListener();


function openFullscreen(elem) {
  if (elem.requestFullscreen) {
    elem.requestFullscreen();
  } else if (elem.mozRequestFullScreen) { /* Firefox */
    elem.mozRequestFullScreen();
  } else if (elem.webkitRequestFullscreen) { /* Chrome, Safari and Opera */
    elem.webkitRequestFullscreen();
  } else if (elem.msRequestFullscreen) { /* IE/Edge */
    elem.msRequestFullscreen();
  }
}

openFullscreen(document.body)
