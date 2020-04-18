<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
    	*{
  margin: 0;
  padding: 0;
  font-family: "montserrat",sans-serif;
}
 .box{ width: 700px;
        float:right;
        border:1px solid none;}
        
        .box ul li{
            width: 120px;
            float:left;
            margin: 10px auto;
            text-align: center;
        }
        
        .box ul li a{ text-decoration: none;
        color:darkgray;}
        
        .box ul li:hover{ background-color: green;}
        .box ul li a:hover{ color:white;}
.contact-section{
  background: url(./images/contactus.jpg) no-repeat center;
  background-size: cover;
  padding: 40px 0;
}
.contact-section h1{
  text-align: center;
  color: #ddd;
}
.border{
  width: 100px;
  height: 10px;
  background: #34495e;
  margin: 40px auto;
}

.contact-form{
  max-width: 600px;
  margin: auto;
  padding: 0 10px;
  overflow: hidden;
}

.contact-form-text{
  display: block;
  width: 100%;
  box-sizing: border-box;
  margin: 16px 0;
  border: 0;
  background: #111;
  padding: 20px 40px;
  outline: none;
  color: #ddd;
  transition: 0.5s;
}
.contact-form-text:focus{
  box-shadow: 0 0 10px 4px #34495e;
}
textarea.contact-form-text{
  resize: none;
  height: 120px;
}
.contact-form-btn{
  float: right;
  border: 0;
  background: #34495e;
  color: #fff;
  padding: 12px 50px;
  border-radius: 20px;
  cursor: pointer;
  transition: 0.5s;
}
.contact-form-btn:hover{
  background: #2980b9;
}
    	
    </style>
  </head>
  <body>
<div class="box">
    <ul type="none">
        <li><a href="accueil.jsp"> Home</a></li>

        <li><a href="About.jsp"> Team</a></li>
        <li><a href="contactus.jsp"> Contact US</a></li>
        </ul>
    </div>
<div class="contact-section">

  <h1>Contact Us</h1>
  <div class="border"></div>
  <form class="contact-form" action="index.html" method="post">
    <input type="text" class="contact-form-text" placeholder="Your name">
    <input type="email" class="contact-form-text" placeholder="Your email">
    <input type="text" class="contact-form-text" placeholder="Your phone">
    <textarea class="contact-form-text" placeholder="Your message"></textarea>
    <input type="submit" class="contact-form-btn" value="Send">
  </form>
</div>


  </body>
</html>
