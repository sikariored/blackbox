import {Controller} from "@hotwired/stimulus";

export default class extends Controller {

    filterByModel(e) {
        let selectedValue = e.currentTarget.value;
        let filterElements = document.querySelectorAll('#history-table-body > tr');

        filterElements.forEach(row => {
            let cellValue = row.querySelector('td.destination-model').innerText;

            if (selectedValue === 'all') {
                row.style.display = '';
            } else {
                if (cellValue === selectedValue) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            }
        });
    }

    filterByName(e) {
        let inputValue = e.currentTarget.value;
        let filterElements = document.querySelectorAll('#history-table-body > tr');

        filterElements.forEach(row => {
            let cellValue = row.querySelector('td.destination-name').textContent;

            if (inputValue === '') {
                row.style.display = '';
            } else {
                if (cellValue.includes(inputValue)) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            }
        });
    }

    filterByDate(event) {
        let inputValue = event.currentTarget.value;
        let filterElements = document.querySelectorAll('#history-table-body > tr');

        filterElements.forEach(row => {
            let cellValue = row.querySelector('td.destination-date').getAttribute('data-iso-time');

            if (inputValue === '') {
                row.style.display = '';
            } else {
                if (cellValue.includes(inputValue)) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            }
        });
    }

    filterById(e) {
        let inputValue = e.currentTarget.value;
        let filterElements = document.querySelectorAll('#history-table-body > tr');

        filterElements.forEach(row => {
           let cellValue = row.querySelector('td.destination-id').innerText;

           if (inputValue === '') {
               row.style.display = '';
           } else {
               if (cellValue.includes(inputValue)) {
                   row.style.display = '';
               } else {
                   row.style.display = 'none';
               }
           }
        });
    }


}