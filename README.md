# README

* Ruby version 3.2.2

* Rails version 7.0.4

### Требования к ОС:
    $ sudo apt install postgresql
    $ sudo apt install libpq-dev
    $ sudo -u postgres psql
    #psql: CREATE ROLE your_name WITH PASSWORD 'your_password';
    #psql: ALTER ROLE your_name WITH SUPERUSER;
	#psql: ALTER ROLE your_name WITH LOGIN;

    $ sudo apt install npm

    - Установить nvm с помощью одной из следующих команд

    $ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

    Или

    $ wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

    $ nvm install 20.0.0

    $ npm install -g yarn

    - Установить Redis

### Перед запуском:
    bundle install
    yarn install

### Запускать с помощью 
    $ foreman start -f Procfile.dev

### Тестовые пользователи 
role: login (password)

admin: admin@mail.ru (123123)  
user: user@mail.ru (123123)

### Для работы шифрования заводимых паролей нужно прописать переменную окружения
Пример для Linux: export G1W2SK=lhWdjJcvsXgcGk1tmYS9iHcQCQM5OVlg
