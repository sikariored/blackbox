import {Controller} from "@hotwired/stimulus";

export default class extends Controller {
    filter(e) {

        let modelValue = document.querySelector('#model-select').value.toLowerCase();
        let nameValue = document.querySelector('#name-select').value.toLowerCase();
        let idValue = document.querySelector('#id-select').value.toLowerCase();
        let dateValue = document.querySelector('#date-select').value;
        let actionValue = document.querySelector('#action-select').value.toLowerCase();

        let rows = document.querySelectorAll('.history-table-body > tr');

        rows.forEach((row, index) => {
            let rowModel = row.querySelector(".destination-model").textContent.toLowerCase();
            let rowName = row.querySelector(".destination-name").textContent.toLowerCase();
            let rowId = row.querySelector(".destination-id").textContent.toLowerCase();
            let rowDate = row.querySelector(".destination-date").getAttribute("data-iso-time");
            let rowAction = row.querySelector(".destination-action").textContent.toLowerCase();

            let showRow = true;

            if (modelValue !== "all" && rowModel !== modelValue) {
                showRow = false;
            }

            if (nameValue !== "" && !rowName.includes(nameValue)) {
                showRow = false;
            }

            if (idValue !== "" && !rowId.includes(idValue)) {
                showRow = false;
            }

            if (dateValue !== "" && !rowDate.includes(dateValue)) {
                showRow = false;
            }

            if (actionValue !== "all" && rowAction !== actionValue) {
                showRow = false;
            }

            if (showRow) {
                row.style.display = "";
            } else {
                row.style.display = "none";
            }

            if (index % 2 === 0) {
                row.classList.add("even-row");
                row.classList.remove("odd-row");
            } else {
                row.classList.add("odd-row");
                row.classList.remove("even-row");
            }
        });
    }

    wipeFilters(e) {
        document.querySelector('#model-select').value = "all";
        document.querySelector('#name-select').value = "";
        document.querySelector('#id-select').value = "";
        document.querySelector('#date-select').value = "";
        document.querySelector('#action-select').value = "all";
        this.filter(e);
    }
}















    // filterByModel(e) {
    //     let selectedValue = e.currentTarget.value;
    //     let filterElements = document.querySelectorAll('#history-table-body > tr');
    //
    //     filterElements.forEach(row => {
    //         let cellValue = row.querySelector('td.destination-model').innerText;
    //
    //         if (selectedValue === 'all') {
    //             row.style.display = '';
    //         } else {
    //             if (cellValue === selectedValue) {
    //                 row.style.display = '';
    //             } else {
    //                 row.style.display = 'none';
    //             }
    //         }
    //     });
    // }
    //
    // filterByName(e) {
    //     let inputValue = e.currentTarget.value;
    //     let filterElements = document.querySelectorAll('#history-table-body > tr');
    //
    //     filterElements.forEach(row => {
    //         let cellValue = row.querySelector('td.destination-name').textContent;
    //
    //         if (inputValue === '') {
    //             row.style.display = '';
    //         } else {
    //             if (cellValue.includes(inputValue)) {
    //                 row.style.display = '';
    //             } else {
    //                 row.style.display = 'none';
    //             }
    //         }
    //     });
    // }
    //
    // filterByDate(event) {
    //     let inputValue = event.currentTarget.value;
    //     let filterElements = document.querySelectorAll('#history-table-body > tr');
    //
    //     filterElements.forEach(row => {
    //         let cellValue = row.querySelector('td.destination-date').getAttribute('data-iso-time');
    //
    //         if (inputValue === '') {
    //             row.style.display = '';
    //         } else {
    //             if (cellValue.includes(inputValue)) {
    //                 row.style.display = '';
    //             } else {
    //                 row.style.display = 'none';
    //             }
    //         }
    //     });
    // }
    //
    // filterById(e) {
    //     let inputValue = e.currentTarget.value;
    //     let filterElements = document.querySelectorAll('#history-table-body > tr');
    //
    //     filterElements.forEach(row => {
    //        let cellValue = row.querySelector('td.destination-id').innerText;
    //
    //        if (inputValue === '') {
    //            row.style.display = '';
    //        } else {
    //            if (cellValue.includes(inputValue)) {
    //                row.style.display = '';
    //            } else {
    //                row.style.display = 'none';
    //            }
    //        }
    //     });
    // }