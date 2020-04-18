<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title></title>
<style type="text/css">
	*{
	margin :0;
	padding :0;
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
	body{
		background : url(./images/register.png) no-repeat;
		background-position : center;
		background-size : cover;
		font-family : sans-serif;
		margin-top : 40px;
	}
	.regform{
		width : 800px;
		background-color : rgb(0,0,0,0.6);
		margin : auto;
		color : #FFFFFF;
		padding : 10px 0px 10px 0px;
		text-align : center;
		border-radius : 15px 15px 0px 0px;
	}
	.main{
		background-color : rgb(0,0,0,0.5);
		width : 800px;
		margin : auto;
	}
	form{
		padding:10px;
	}
	#name{
		width : 100%;
		height : 100px;	
	}
	.name{
		margin-left : 25px;
		margin-top : 30px;
		width : 125px;
		color : white;
		font-size : 18px;
		font-weight : 700;
	}
	.firstname{
		position : relative;
		left : 200px;
		top : -37px;
		line-height : 40px;
		border-radius : 6px;
		padding : 0 22px;
		font-size : 16px;
	}
	.lastname{
		position : relative;
		left : 417px;
		top : -80px;
		line-height : 40px;
		border-radius : 6px;
		padding :0 22px;
		font-size : 16px;
		color : #555;
	}
	.firstlabel{
		position : relative;
		color : #E5E5E5;
		text-transform : capitalize;
		font-size : 14px;
		left : 203px;
		top : -45px;
		}
	.lastlabel{
		position : relative;
		color : #E5E5E5;
		text-transform : capitalize;
		font-size : 14px;
		left : 485px;
		top : -75px;
		}
	.email{
		position : relative;
		left : 200px;
		top : -37px;
		line-height : 40px;
		width:480px;
		border-radius : 6px;
		padding :0 22px;
		font-size : 16px;
		color : #555;
	}
	
.password{
		position : relative;
		left : 200px;
		top : -37px;
		line-height : 40px;
		width:200px;
		border-radius : 6px;
		padding :0 22px;
		font-size : 16px;
		color : #555;
	}
	
	button {
		background-color : #3BAF9F;
		display : block;
		margin : 20px 0px 0px 20px;
		text-align : center;
		border-radius : 12px;
		border : 2px solid #366473;
		padding  : 14px 110px;
		outline : none;
		color : white;
		cursor : pointer;
		transition : 0.25px;
		 
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
<div class="regform"><h1>S'inscrire</h1></div>
<div class="main">
	<form method="post" action="insertionPath">
		<div id="name">
		<h2 class="name">Nom Complet</h2>
		<input class="firstname" type="text" name="nom"> <br>
		<label class="firstlabel">Prénom </label>
		<input class="lastname" type="text" name="prenom"><br>
		<label class="lastlabel">Nom </label>
		</div>
		<h2 class="name"> Email </h2>
		<input class="email" type="text" name="email">
			
		<h2 class="name"> Mot de passe </h2>
		<input class="password" type="password" name="mdp">
		
		
		
	<button type="submit">S'inscrire</button>		
	</form>
</div>
</body>
</html>