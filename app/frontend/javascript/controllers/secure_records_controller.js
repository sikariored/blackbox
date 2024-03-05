import {Controller} from "@hotwired/stimulus";

export default class extends Controller {

    copyToClipboard(text) {
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

    showPassword(e) {
        const button = e.currentTarget;
        const password = document.querySelector('.secure-record-password');
        let eyeIcon = button.closest('.show-buttons').querySelector('.eye-icon');

        if (button.classList.contains('closed')) {
            button.classList.replace('closed', 'opened')
            password.innerHTML = password.dataset.password;
            eyeIcon.src = "/images/eye_opened.png";
            this.scaleButtonAnimation(button);
            return
        }

        if (button.classList.contains('opened')) {
            button.classList.replace('opened', 'closed')
            password.innerHTML = '********';
            eyeIcon.src = "/images/eye_closed.png";
            this.scaleButtonAnimation(button);
        }
    }

    showPasswordInField(e) {

        const button = e.currentTarget;
        const password = button.closest('.form-field').querySelector('.field-secure-record-password');
        let eyeIcon = button.closest('.show-buttons').querySelector('.eye-icon');

        if (button.classList.contains('closed')) {
            button.classList.replace('closed', 'opened')
            password.type = 'text';
            eyeIcon.src = "/images/eye_opened.png";
            this.scaleButtonAnimation(button);
            return
        }

        if (button.classList.contains('opened')) {
            button.classList.replace('opened', 'closed');
            password.type = 'password';
            eyeIcon.src = "/images/eye_closed.png";
            this.scaleButtonAnimation(button);
        }
    }

    copyPassword(e) {
        const button = e.currentTarget;
        const password = document.querySelector('.secure-record-password');
        if ('password' in password.dataset && password.dataset.password.length > 0) {
            this.copyToClipboard(password.dataset.password);
        }
        this.scaleButtonAnimation(button);
    }

    copyPasswordInField(e) {
        const button = e.currentTarget;
        const password = button.closest('.form-field').querySelector('.field-secure-record-password');
        this.copyToClipboard(password.value);
        this.scaleButtonAnimation(button);
    }

    copyLogin(e) {
        const button = e.currentTarget;
        const login = document.getElementById('secure-record-login');
        this.copyToClipboard(login.innerText);
        this.scaleButtonAnimation(button);
    }

    generatePassword(e) {
        const button = e.currentTarget;
        const password = button.closest('.form-field').querySelector('.field-secure-record-password');
        this.scaleButtonAnimation(button);

        function randomPassword(length) {
            const charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#%&()-_=+";
            let randomPassword = "";
            for (let i = 0; i < length; ++i) {
                const randomIndex = Math.floor(Math.random() * charset.length);
                randomPassword += charset[randomIndex];
            }
            return randomPassword;
        }

        password.value = randomPassword(12);
        this.checkSecurityOfPassword();
    }

    checkSecurityOfPassword(e) {

        let passwordField = document.querySelector('.field-secure-record-password');
        let password = passwordField.value;
        let passwordFieldDefaultBorderColor = 'rgba(195, 231, 255, 0.27)';
        let strength = calculatePasswordStrength(password);
        let dangerColor = 'rgb(255, 28, 81)';
        let warningColor = 'rgb(255, 179, 0)';
        let successColor = 'rgb(126, 255, 167)';


        function calculatePasswordStrength(password) {
            let length = password.length;
            let hasUpperCase = /[A-Z]/.test(password);
            let hasLowerCase = /[a-z]/.test(password);
            let hasNumbers = /[0-9]/.test(password);
            let hasSpecialChars = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/.test(password);


            let strength = 0;

            // Проверка длины пароля
            if (length >= 8) {
                strength += 10;
            } else if (length >= 12) {
                strength += 20;
            }

            // Проверка наличия букв в разных регистрах
            if (hasUpperCase && hasLowerCase) {
                strength += 20;
            }

            // Проверка наличия цифр
            if (hasNumbers) {
                strength += 15;
            }

            // Проверка наличия специальных символов
            if (hasSpecialChars) {
                strength += 15;
            }

            return strength;
        }

        if (strength < 30) {
            passwordField.style.borderColor = dangerColor;
        } else if (strength < 60) {
            passwordField.style.borderColor = warningColor;
        } else {
            passwordField.style.borderColor = successColor;
        }

        if (passwordField.value === '') {
            passwordField.style.borderColor = passwordFieldDefaultBorderColor;
        }
    }

    check(e) {
        console.log(e.currentTarget.id);
    }

}
