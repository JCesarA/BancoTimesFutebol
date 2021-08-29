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
			  
			a.one:link, a.one:visited {
				background-color: Yellow;
				color: Black;
				padding: 5px 25px;
				text-align: center;
				text-decoration: none;
				display: inline-block;
				font-size: 20px;
			}
				
			a.one:hover, a.one:active {
				background-color: blue;
				color: White;
				font-weight: bold;	
			}
			
			th{
				color: White;
				font-weight: bold;
				font-size: 20px;
			}
			
			td{
				font-size: 16px;
			}
			
			.label1 {
			  	color: White;
			  	font-weight: bold;
			  	font-size: 20px;			
			}
			
			.opcao {
			  	color: Black;			  	
			  	font-size: 16px;
			  /*	width: 400px;	*/	
			  	height: 34px;
			}					 
		</style>		
	</head>
	<body>				
		<c:import url="/WEB-INF/jsp/menu.jsp"></c:import>		
			
		<script>		
			window.addEventListener("load", function(){			    
				if(localStorage.getItem("registro") !== "sim") {
				    document.getElementById("ocultaDIV").style.display='none';				
					window.alert("ACESSO RESTRITO! É necessário fazer login.");
					window.location.replace("http://localhost:8080/login");		  		    
				}
			});	
		</script>
		
		<div id="ocultaDIV" class="container">				
				<!-- Se houver conteúdo em mensagem, esta é exibida -->
				<c:if test="${not empty mensagem}">				
					<div class="alert alert-info alert-dismissible fade in">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<strong>Sucesso!</strong> ${mensagem}
					</div>			
				</c:if>				
				<br> 
				<a class="one" href="/time">Incluir novo time</a>
				<br>
				<br>				
				<!-- Se houver time cadastrado, a listagem é exibida -->
				<c:if test="${not empty times}">			 			
					<p id="f1">Quantidade de times: ${times.size()}</p>
					
					<form action="/time/ordenar" method = "post">	
				 		
				 		<label class = "label1">Ordenar por </label>
						<select class = "opcao"  name = "sortBy" >
							<option value = "nome">Nome</option>
							<option value = "anoFundacao">Ano de Fundação</option>			  	
						</select>
						<button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-sort-by-alphabet"></i></button>
		
					</form>
					<br>
					<table class="table">
					    <thead>
					      <tr>
					        <th>Id</th>
					        <th>NOME</th>
					        <th>ANO DE FUNDAÇÃO</th>
					        <th></th>
					        <th></th>
					      </tr>
					    </thead>
					    <tbody>
					    	<c:set var="contador" value="1"/>			    	
					    	<c:forEach var="time" items="${times}">				     
							    <c:choose> 
									<c:when test="${(contador % 2)==0}">
										<tr class="warning">
									</c:when>    
									<c:otherwise>
										<tr class="success">    
									</c:otherwise>
								</c:choose>					      
							        <td>${time.id}</td>
							        <td>${time.nome}</td>
							        <td>${time.anoFundacao}</td>							       
							        <td><a href ="/time/${time.id}/consultar">Consultar</a></td>
							        <td><a href ="/time/${time.id}/excluir">Excluir</a></td>
					      		</tr>					      
							    <c:set var="contador" value="${contador + 1}" /> 
						    </c:forEach>  
					    </tbody>
					</table>
				</c:if>
				
				<c:if test="${empty times}">
					<br>
					<p id="f1">Não há times cadastrados!</p>			
				</c:if>			
		</div>	
	</body>
</html>