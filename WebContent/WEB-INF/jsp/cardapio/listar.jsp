<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="${request.contextPath}/menu" />

<div class="container">
	
	<c:url var="url" value="/cardapio/filtrar" />
	<form:form action="${url}" method="get" modelAttribute="filtro">
		<div class="row">
		<div class="col-md-1">Categoria:</div>
 			<div class="col-md-2">
 				<form:select  class="form-control" items="${selectDeCategoria}" length="30"
 					path="categoria.id" />
 			</div>

			<div class="col-md-1">Nome:</div>
			<div class="col-md-2">
				<form:input maxlength="30" path="nome" size="30"
					class="form-control" />
			</div>
			<div class="col-md-3">
				<input type="submit" value="Pesquisar" class="btn btn-primary">
			</div>
		</div>
	</form:form>
	<br>
	<script type="text/javascript"  src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js">
     		$(document).ready(function() {
         		// get current URL path and assign 'active' class
         		var pathname = window.location.pathname;
         		alert (pathname);
         		$('.nav > li > a[href="'+pathname+'"]').parent().addClass('active');
         	});     		
     		alert("bla");
	</script>
	<table class="table table-bordered">
		<tr>
		<td>
			<td>Descrição</td>
			<td>Preço</td>
			<td>Status</td>
			<td>Categoria</td>
		</tr>

		<c:forEach items="${cardapios}" var="cardapio">
			<tr>
				<td width="10"><input type="radio" name="radioButton" value="${cardapio.id}"/></td>
				<td>${cardapio.nome}</td>
				<td>${cardapio.preco}</td>
				<td>${cardapio.status}</td>
				<td>${cardapio.categoria.nome}</td>
			</tr>
		</c:forEach>
	</table>
	
	<script>
		function findSelection(field) {
			var test = document.getElementsByName(field);
			var sizes = test.length;

			for (i = 0; i < sizes; i++) {
				if (test[i].checked == true) {
					//alert(test[i].value);
					return test[i].value;
				}
			}
		}

		function removeForm() {

			swal({
				title : "Voce irá deletar permanetemente!",
				text : "Deseja deletar?",
				icon : "warning",
				buttons : true,
				dangerMode: true,
				buttons : ["Não","Sim"]
			})
			.then((willDelete) =>{
				if (willDelete){
					var rb = findSelection("radioButton");
					if (typeof rb !== 'undefined') {
							var updateUrl = "/Restaurante/cardapio/" + rb + "/remove";
							window.location.href = updateUrl;
							//alert(updateUrl);	
							return false
						}
					}
				});
			}

		function updateForm() {

			var rb = findSelection("radioButton");
			if (typeof rb !== 'undefined') {
				var updateUrl = "/Restaurante/cardapio/" + rb + "/updateForm";
				window.location.href = updateUrl;
				//alert(updateUrl);	
				return false;
			}

		}
	</script>
	<c:url var="url" value="/cardapio/novo" />
	<a href="${url}" class="btn btn-primary">Novo Cardapio</a>

	<c:url var="url" value="/cardapio/${cardapio.id}" />
	<a href="" onclick="return updateForm()" class="btn btn-primary">Atualizar</a>
	<button onclick="return removeForm()"class="btn btn-danger">Deletar</button>
		
	<c:if test="${cardapio.status == 'Não-Ativo'}">
		<a href="${url}/ativar" class="btn btn-primary">Ativar</a>
	</c:if>
	
	<c:if test="${cardapio.status == 'Ativo'}">
		<a href="${url}/desativar" class="btn btn-primary">Desativar</a>
	</c:if>


</div>
