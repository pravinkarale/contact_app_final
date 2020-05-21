
* Ruby version used :- 2.4.3

* Rails version used :- 5.2.4.3 

* database used :- mysql

*  start mysql service by below command
   
   service mysql start

* kindly rename file config/local_env.yaml_example to config/local_env.yaml 

* To save enironment variable, we maintian file named local_env.yml
  
  kindly update variables value with your credentials. 

* Added 'delayed-job' to deliver email at background
	
* to start delayed job service run below command 
  
  rake jobs:work

* First Name, Lat Name, Email, Message are the compulsory fields in 'send message' form.

* Added Rspec for model and api controller testing
   
  - model Testing :- Written test cases for model validation to test below compulsory fields 
    first_name, last_name, email, message
  - Api Testing :- Trying to save record with valid & invalid data.

* To test model validation, run command rspec spec/models

* To test API, run command rspec spec/controllers


* Below are the curl command to test Api

Curl Request for English translation

curl -v -s -X POST 'http://localhost:3000/api/contact_messages' \
    -H 'Content-Type: application/json' \
    -d '{"contact_message":{"first_name": "maria", "last_name": "desouza", "email": "mariad@gmail.com", "message": "How are you?", "locale": "en"}}' \
    | python -mjson.tool

Curl Request for Spanish translation

curl -v -s -X POST 'http://localhost:3000/api/contact_messages' \
    -H 'Content-Type: application/json' \
    -d '{"contact_message":{"first_name": "maria", "last_name": "desouza", "email": "mariad@gmail.com", "message": "¿Cómo estás?", "locale": "es"}}' \
    | python -mjson.tool
