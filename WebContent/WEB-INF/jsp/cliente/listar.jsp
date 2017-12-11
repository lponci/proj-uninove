<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="${request.contextPath}/menu" />

<div class="container">
	<p>Bem vindo, ${usuario.nome}</p>
	<c:url var="url" value="/cliente/filtrar" />
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
	<br>
	
	<table class="table table-bordered">
		<tr>
			<td></td>
			<td>Nome</td>
			<td>Rua</td>
			<td>Cep</td>
			<td>Bairro</td>
		</tr>
		<c:forEach items="${clientes}" var="cli">
			<tr>
	
				<td width="10"><input type="radio" name="radioButton" value="${cli.id}"/></td>
				<td>${cli.nome}</td>
				<td>${cli.endereco.rua}</td>
				<td>${cli.endereco.cep}</td>
				<td>${cli.endereco.bairro}</td>
					<c:url var="url" value="${cli.id}"/>
			</tr>
		</c:forEach>
	</table>
	<script type="text/javascript">
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
							var updateUrl = "/Restaurante/cliente/" + rb + "/remove";
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
				var updateUrl = "/Restaurante/cliente/" + rb + "/updateForm";
				window.location.href = updateUrl;
				//alert(updateUrl);	
				return false;
			}

		}
	</script>
	<a href="/Restaurante/cliente/novo" class="btn btn-primary">Novo</a>
	<a href="" onclick="return updateForm()" class="btn btn-primary">Atualizar</a>
	<button onclick="return removeForm()" class="btn btn-danger">Deletar</button>

</div>
