import {Controller} from "@hotwired/stimulus";

export default class extends Controller {

    search(event) {
        let inputText = event.target.value.toLowerCase();
        let usersItems = document.querySelectorAll('.user-item');
        let visibleIndex = 0;

        usersItems.forEach(item => {
            if (item.getAttribute('data-name').toLowerCase().includes(inputText) || item.getAttribute('data-login').toLowerCase().includes(inputText) || item.getAttribute('data-email').toLowerCase().includes(inputText)) {
                item.style.display = "";
                if (item.classList.contains('odd') || item.classList.contains('even')) {
                    item.classList.remove('odd', 'even');
                }

                if (visibleIndex %2 === 0) {
                    item.classList.add('even');
                } else {
                    item.classList.add('odd');
                }

                visibleIndex++;
            } else {
                item.style.display = 'none';
            }
        })

    }
}