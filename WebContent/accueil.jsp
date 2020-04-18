<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <style>
        
        body{
            font-family: latha;
            color:white;
            background: linear-gradient( rgba(0,0,0,0.65),rgba(0,0,0,0.65),rgba(0,0,0,0.38),rgba(0,0,0,0)
            )
                ,url(./images/ingredient.jpg)no-repeat;
            background-size: cover;
            
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
        
        .wd{
            width: 300px;
            height: 539px;
            background-color: black;
            opacity: 0.9;
            padding: 55px;
        }
        
        .wd h1{
            text-align: center;
            text-transform: uppercase;
            font-weight: 100px;
        }
        
        .wd h4{
            text-align: justify;
            color:darkgray;
            font-weight: normal;
        }
    
        .wd h2{
            text-align: center;
            text-transform: uppercase;
            font-weight: normal;
            margin: 40px auto;
        }
        
        .opt form , input[type="button"]{
            background-color: black;
            color:white;
            padding:10px;
            margin:-14px auto;
            padding-left: 50px;
            padding-right: 50px;
            text-align: center;
        }
       
        
        form, input[type="button"]:hover{background-color: green;}
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
    
    <div class="wd">
    
        <h1>Les Quatres </h1>
        
        <h4>Le site numéro 1 Au Maroc </h4>
        <h4>Afin de gèrer la création et la livraison de gâteaux sur commande.</h4>
        
        <h2> Bienvenue ^_^</h2>
        <div class="opt">
        <form action="" method="post">
        
        <a href="login.jsp">  <input type="button" value="Connexion"><br> </a>
    
            
            </form>
        
        </div>
    
    
    </div>
</body>
</html>