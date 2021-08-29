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
				background-color:#0A2A12;
				background-image: url('img/CAMPO.jpg');
				background-position: center;		/* Center and scale the image nicely */
				background-repeat: no-repeat;
				background-size: cover;				/* Sets background image to cover entire element */
				background-position: 50% -5%;      	/* Sets reference point to scale from */
			}
			  
			#f1 {
			  	color: White;
			  	font-weight: bold;
			  	font-size: 30px;			  	
			}
			
			#f2 {
			  	color: #fffde7;
			  	font-weight: bold;
			  	font-size: 22px;			  	
			}			

		</style>		
	</head>
	<body>				
		<c:import url="/WEB-INF/jsp/menu.jsp"></c:import>	
		
		<div class="container">		
		
			<c:if test="${not usuario.isCadastro()}">			
				<!-- Se houver conteúdo em mensagem, esta é exibida -->
				<c:if test="${not empty mensagem}">				
					<div class="alert alert-danger alert-dismissible fade in">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<h4><strong>${mensagem}</strong> </h4>
					</div>			
				</c:if>
			</c:if>
			
			<c:if test="${usuario.isCadastro()}">									
				<c:if test="${not empty mensagem}">				
					<div class="alert alert-info alert-dismissible fade in">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<strong> ${mensagem} </strong>
					</div>			
				</c:if>				
			</c:if>			
			<br>
			<p id="f1">ACESSO DE USUÁRIOS</p>			
			<br> 
			<form action="/fazerLogin" method="post">
				<div class="input-group">
					<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
					<input type="text" class="form-control" name="email" placeholder="E-mail">
				</div>
				<br>
				<div class="input-group">
					<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
					<input type="password" class="form-control" name="senha" placeholder="Senha">
				</div>
				<br> 
				<button type="submit">Entrar</button>
				<br>
				<br>
				<br>
				<c:if test="${not usuario.isCadastro()}">									
					<c:if test="${empty mensagem}">				
						<p id="f2">Ainda não tem cadastro? Clique no botão abaixo.</p>
						<button type="submit" formaction="/cadastrarUsuario">Cadastrar</button>
					</c:if>				
				</c:if>			
			</form>					  
		</div>	
	</body>
</html>