import "bootstrap";
import { addEventListenersToInterests } from '../components/interests';
// import { picker } from '../plugins/datepicker';
import { calendarListener } from '../components/calendar';
import { addActiveStatusToTab } from '../components/tab_active';

addEventListenersToInterests();

// picker();
calendarListener();
addActiveStatusToTab();
