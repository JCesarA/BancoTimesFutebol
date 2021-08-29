<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">	
	<head>
		<title>MyTeam</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		
		<style>			
			body { 
				background-color: #0A2A12;				
				color: White;			  				  		
			}			
		
			/** {box-sizing: border-box}*/
			
			.mySlides {display: none}
			img {vertical-align: middle;}
			
			/* Slideshow container */
			.slideshow-container {
			  max-width: 1000px;
			  position: relative;
			  margin: auto;
			}
			
			/* Next & previous buttons */
			.prev, .next {
			  cursor: pointer;
			  position: absolute;
			  top: 47%;
			  width: auto;
			  padding: 16px;
			  margin-top: -22px;
			  color: yellow;
			  font-weight: bold;
			  font-size: 48px;
			  transition: 0.6s ease;
			  border-radius: 0 3px 3px 0;
			  user-select: none;
			}
			
						
			/* Position the "next button" to the right */
			.next {
			  right: 0;
			  border-radius: 3px 0 0 3px;
			}
			
			/* On hover, add a black background color with a little bit see-through */
			.prev:hover, .next:hover {
			  background-color: rgba(0,0,0,0.8);
			}
			
			a:hover { text-decoration: none; }
			
			/* Caption text */
			.text1 {
			  color: #f2f2f2;
			  font-size: 18px;
			  padding: 8px 12px;
			  position: absolute;
			  bottom: 16px;
			  width: 100%;
			  text-align: center;
			}
			.text2 {
			  color: #f2f2f2;
			  font-size: 14px;
			  padding: 8px 12px;
			  position: absolute;
			  bottom: -2px;
			  width: 100%;
			  text-align: center;
			}			
			
			/* Number text (1/3 etc) */
			.numbertext {
			  color: #f2f2f2;
			  font-size: 14px;
			  padding: 8px 12px;
			  position: absolute;
			  top: 0;
			}
			
			/* The dots/bullets/indicators */
			.dot {
			  cursor: pointer;
			  height: 15px;
			  width: 15px;
			  margin: 0 2px;
			  background-color: #bbb;
			  border-radius: 50%;
			  display: inline-block;
			  transition: background-color 0.6s ease;
			}
			
			.active, .dot:hover {
			  background-color: #717171;
			}			
			
			/* On smaller screens, decrease text size */
			@media only screen and (max-width: 300px) {
			  .prev, .next,.text1,.text2 {font-size: 11px}
			}			
		</style>		
	</head>	
	<body>
		
		<c:import url="/WEB-INF/jsp/menu.jsp"></c:import>
		<script>			
			window.addEventListener("load", function(){
			    if (localStorage.getItem("registro") !== "sim"){				
					var confere = "<c:out value='${acesso}'/>";			    
					localStorage.setItem("registro",confere);	
				}		 
			});		
		</script>	
	
		<div class="container">

			<!-- Se houver conteúdo em mensagem, esta é exibida -->
			<c:if test="${not empty mensagem}">				
				<div class="alert alert-info alert-dismissible fade in">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<strong> ${mensagem} </strong>
				</div>			
			</c:if>
		
			<h2>MyTeam: A sua plataforma de futebol</h2>
	
			<div class="slideshow-container">		
				
				<div class="mySlides">
					<div class="numbertext">
						1 / 9
					</div>
					<img src="img/JOGADORES.jpg" style="width:100%;">
					<div class="text1">
						WELCOME!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						BEM-VINDO!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						BIENVENIDO!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						BENVENUTO!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						BIENVENUE!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						WILLKOMMEN!
					</div>
					<div class="text2">
						Clique nas setas amarelas ou nos discos abaixo para percorrer os times.Clique em Times para acesso ao banco de dados.
					</div>
				</div>
	
				<div class="mySlides">
					<div class="numbertext">
						2 / 9
					</div>
				 	<img src="img/AMERICA.jpg" style="width:100%;">
					<div class="text1">
						AMÉRICA-RJ
					</div>
					<div class="text2">
						Rio de Janeiro - RJ - Brasil
					</div>
				</div>
	
				<div class="mySlides">
					<div class="numbertext">
						3 / 9
					</div>
				  	<img src="img/BOTAFOGO.jpg" style="width:100%;">
					<div class="text1">
						BOTAFOGO
					</div>
					<div class="text2">
						Rio de Janeiro - RJ - Brasil
					</div>
				</div>
	
				<div class="mySlides">
					<div class="numbertext">
						4 / 9
					</div>
				  	<img src="img/CORINTHIANS.jpg" style="width:100%;">
					<div class="text1">
						CORINTHIANS
					</div>
					<div class="text2">
						São Paulo - SP - Brasil
					</div>
				</div>
	
				<div class="mySlides">
					<div class="numbertext">
						5 / 9
					</div>
				  	<img src="img/FLAMENGO.jpg" style="width:100%;">
					<div class="text1">
						FLAMENGO
					</div>
					<div class="text2">
						Rio de Janeiro - RJ - Brasil
					</div>
				</div>
	
				<div class="mySlides">
					<div class="numbertext">
						6 / 9
					</div>
				  	<img src="img/FLUMINENSE.jpg" style="width:100%;">
					<div class="text1">
						FLUMINENSE
					</div>
					<div class="text2">
						Rio de Janeiro - RJ - Brasil
					</div>
				</div>
	
				<div class="mySlides">
					<div class="numbertext">
						7 / 9
					</div>
				  	<img src="img/GREMIO.jpg" style="width:100%;">
					<div class="text1">
						GRÊMIO
					</div>
					<div class="text2">
						Porto Alegre - Rio Grande do Sul - Brasil
					</div>
				</div>
				
				<div class="mySlides">
					<div class="numbertext">
						8 / 9
					</div>
				  	<img src="img/SAO_LUIZ.jpg" style="width:100%;">
					<div class="text1">
						SÃO LUIZ
					</div>
					<div class="text2">
						Ijuí - Rio Grande do Sul - Brasil
					</div>
				</div>			
	
				<div class="mySlides">
					<div class="numbertext">
						9 / 9
					</div>
				  	<img src="img/VASCO.jpg" style="width:100%;">
					<div class="text1">
						VASCO DA GAMA
					</div>
					<div class="text2">
						Rio de Janeiro - RJ - Brasil
					</div>
				</div>
	
				<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
				<a class="next" onclick="plusSlides(1)">&#10095;</a>
	
			</div>
			<br>
			<div style="text-align:center">
				<span class="dot" onclick="currentSlide(1)"></span> 
				<span class="dot" onclick="currentSlide(2)"></span> 
				<span class="dot" onclick="currentSlide(3)"></span>
				<span class="dot" onclick="currentSlide(4)"></span> 
				<span class="dot" onclick="currentSlide(5)"></span> 
				<span class="dot" onclick="currentSlide(6)"></span>			
				<span class="dot" onclick="currentSlide(7)"></span> 
				<span class="dot" onclick="currentSlide(8)"></span>					 
			</div>
	
			<script>
				var slideIndex = 1;
				showSlides(slideIndex);
				
				function plusSlides(n) {
				  showSlides(slideIndex += n);
				}
				
				function currentSlide(n) {
				  showSlides(slideIndex = n);
				}
				
				function showSlides(n) {
				  var i;
				  var slides = document.getElementsByClassName("mySlides");
				  var dots = document.getElementsByClassName("dot");
				  if (n > slides.length) {slideIndex = 1}    
				  if (n < 1) {slideIndex = slides.length}
				  for (i = 0; i < slides.length; i++) {
				      slides[i].style.display = "none";  
				  }
				  for (i = 0; i < dots.length; i++) {
				      dots[i].className = dots[i].className.replace(" active", "");
				  }
				  slides[slideIndex-1].style.display = "block";  
				  dots[slideIndex-1].className += " active";
				}	
			</script>
		</div>	
	</body>
</html>