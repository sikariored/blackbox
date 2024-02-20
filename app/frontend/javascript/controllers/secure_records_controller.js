import {Controller} from "@hotwired/stimulus";

export default class extends Controller {
    copyToClipboard(text) {
        // Пытаемся скопировать текст в буфер обмена
        navigator.clipboard.writeText(text)
            .catch(err => {
                console.error('Ошибка копирования в буфер обмена: ', err);
            });
    }

    scaleButtonAnimation(button) {
        // Увеличение масштаба кнопки
        button.style.transform = 'scale(1.2)';

        // Задержка в миллисекундах (1000 миллисекунд = 1 секунда)
        const delay = 100;

        // Ждем заданное время, затем возвращаем масштаб к исходному значению
        setTimeout(() => {
            button.style.transform = 'scale(1)';
        }, delay);
    }

    show(e) {
        const button = e.currentTarget;
        const password = document.getElementById('secure-record-password');

        if (button.classList.contains('closed')) {
            button.classList.replace('closed', 'opened')
            password.innerHTML = password.dataset.password;
            document.getElementById('eye-icon').src = "/images/eye_opened.png";
            this.scaleButtonAnimation(button);
            return
        }

        if (button.classList.contains('opened')) {
            button.classList.replace('opened', 'closed')
            password.innerHTML = '********';
            document.getElementById('eye-icon').src = "/images/eye_closed.png";
            this.scaleButtonAnimation(button);
        }
    }

    copy(e) {
        const button = e.currentTarget;
        const password = document.getElementById('secure-record-password');
        this.copyToClipboard(password.dataset.password);

        this.scaleButtonAnimation(button);
    }
}
