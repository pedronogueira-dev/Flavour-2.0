import "bootstrap";
import { addEventListenersToInterests } from '../components/interests';

import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

addEventListenersToInterests();
flatpickr(".datepicker", {})
