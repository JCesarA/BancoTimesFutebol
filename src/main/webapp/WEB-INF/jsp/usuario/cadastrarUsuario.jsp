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
			
			.label2 {
			  	color: #fffde7;
			  	font-weight: bold;
			  	font-size: 22px;			  	
			}
		</style>		
	</head>
	<body>				
		<c:import url="/WEB-INF/jsp/menu.jsp"></c:import>		
		
		<c:set var="titulo" value="CADASTRAMENTO DE USUÁRIOS"/>
		<c:set var="rota" value="/incluirUsuario"/>
		<c:set var="metodo" value="post"/>
		<c:set var="botao" value="Confirmar"/>				

		<c:if test="${confirma.equals('usuarioEncontrado')}">
			<c:set var="titulo" value="CONSULTAR USUÁRIO"/>
			<c:set var="rota" value="/voltarLista"/>
			<c:set var="metodo" value="get"/>
			<c:set var="botao" value="Voltar"/>		
		</c:if>	
		
		<c:if test="${not empty consultaUsuarioLista}">
			<c:set var="titulo" value="INCLUIR USUÁRIO"/>
			<c:set var="rota" value="/incluirUsuarioLista"/>
			<c:set var="metodo" value="post"/>
			<c:set var="botao" value="Incluir"/>					
		</c:if>			
		
		<div class="container">
			<br>
			<p id="f1">${titulo}</p>			
			<br>
			<form action="${rota}" method="${metodo}">
				<label class = "label2">Nome:</label>			
				<div class="input-group">
					<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
					<input type="text" class="form-control" value = "${consultaUsuario.nomeUsuario}"  name="nomeUsuario" placeholder="Nome">
				</div>
				<br>			
				<label class = "label2">Time de futebol preferido:</label>			
				<div class="input-group">
					<span class="input-group-addon"><i class="glyphicon glyphicon-heart"></i></span>
					<input type="text" class="form-control" value = "${consultaUsuario.timeUsuario}" name="timeUsuario" placeholder="Meu time preferido">
				</div>
				<br>
				<label class = "label2">E-mail:</label>
				<div class="input-group">
					<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
					<input type="text" class="form-control" value = "${consultaUsuario.email}" name="email" placeholder="Email">
				</div>
				<br>
				<c:if test="${not confirma.equals('usuarioEncontrado')}">				
					<label class = "label2">Senha:</label>			
					<div class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
						<input type="password" class="form-control" name="senha" placeholder="Senha">
					</div>			
				</c:if>
				<br>
				<button type="submit" class="btn btn-default">${botao}</button>		  
			</form>
			<br>
			<br>
			<br>					  
		</div>	
	</body>
</html>