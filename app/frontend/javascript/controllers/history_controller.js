import {Controller} from "@hotwired/stimulus";

export default class extends Controller {
    connect() {
        console.log('connected to ' + this.element.value)
    }

    filter(e) {
        console.log('clicked ' + this.element.value)
    }
}