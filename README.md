# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

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
    - Установить nvm и nodejs 20.0.0    

    $ npm install -g yarn

### Перед запуском:
    bundle install
    yarn install

### Запускать с помощью 
    $ foreman start -f Procfile.dev
