import "bootstrap";
import { addEventListenersToInterests } from '../components/interests';
import { picker } from '../plugins/datepicker';
addEventListenersToInterests();

picker();
