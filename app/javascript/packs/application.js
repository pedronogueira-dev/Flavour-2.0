import "bootstrap";
import { addEventListenersToInterests } from '../components/interests';
// import { picker } from '../plugins/datepicker';
import { calendarListener } from '../components/calendar';
import { addEventListenersToContacts } from '../components/contacts';

addEventListenersToInterests();
addEventListenersToContacts();

// picker();
calendarListener();
