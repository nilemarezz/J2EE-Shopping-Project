INT303 Term Project 
- E-Commerce Web app 
- Responsive Webapp with bootstrap 

Email:pcmprojectz@gmail.com 
pass:int303project

Ref: http://zetcode.com/tutorials/jeetutorials/sendingemail/
   : Bootstrap


sql script:
create table "SIT".ACCOUNT
(
	USERNAME VARCHAR(30) not null primary key,
	PASSWORD VARCHAR(40) not null,
	NAME VARCHAR(30),
	EMAIL VARCHAR(50),
	ACTIVATEKEY VARCHAR(40),
	REGDATE TIMESTAMP,
	ACTIVATEDATE TIMESTAMP,
	ADDRESS VARCHAR(150)
) 

run
localhost   : http://localhost:8080/MyProjectWebApp/view/state/landing.html
Kmutt-Secure: http://10.5.5.157:8080/MyProjectWebApp/view/state/landing.html
eduroam     : http://10.5.43.91:8080/MyProjectWebApp/view/state/landing.html
	

	
