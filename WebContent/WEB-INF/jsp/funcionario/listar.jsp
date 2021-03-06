<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="${request.contextPath}/menu" />

<div class="container">
	<c:url var="url" value="/funcionario/filtrar" />
	<form:form action="${url}" method="get" modelAttribute="filtro">
		<div class="row">
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
	<br />
	<table class="table table-bordered">
		<tr>
			<td></td>
			<td>Nome</td>
			<td>Cargo</td>
			<td>CPF</td>
			<td>Sal�rio</td>
		</tr>

		<c:forEach items="${funcionarios}" var="fun">
			<tr>
				<td width="10px"><input type="radio" name="radioButton" value="${fun.id}"/></td>
				<td>${fun.nome}</td>
				<td>${fun.cargo}</td>
				<td>${fun.cpf}</td>
				<td>${fun.salario}</td>
			
			</tr>
		</c:forEach>
	</table>
		<c:url var="url" value="/funcionario/novo" />
	<a href="${url}" class="btn btn-primary">Novo</a>
	<a href="" onclick="return updateForm()" class="btn btn-primary">Editar</a>
	<button onclick="return removeForm()" class="btn btn-danger">Deletar</button>
					
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
				title : "Voce ir� deletar permanetemente!",
				text : "Deseja deletar?",
				icon : "warning",
				buttons : true,
				dangerMode: true,
				buttons : ["N�o","Sim"]
			})
			.then((willDelete) =>{
				if (willDelete){
					var rb = findSelection("radioButton");
					if (typeof rb !== 'undefined') {
							var updateUrl = "/Restaurante/funcionario/" + rb + "/remove";
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
				var updateUrl = "/Restaurante/funcionario/" + rb + "/editar";
				window.location.href = updateUrl;
				//alert(updateUrl);	
				return false;
			}

		}
	</script>
</div>
