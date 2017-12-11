<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="${request.contextPath}/menu" />

<div class="container">

	<c:url var="url" value="/reserva/filtrar" />
	<form:form action="${url}" method="get" modelAttribute="filtro">
		<div class="row">

			<div class="col-md-1" width="10">Responsável:</div>
			<div class="col-md-2">
				<form:input maxlength="30" path="nome_responsavel" size="30"
					class="form-control" />
			</div>

			<div class="col-md-1">Mesa:</div>
			<div class="col-md-2">
				<form:select class="form-control" items="${selectMesas}" length="30" path="mesa.id" />
			</div>
			<div class="col-md-3">
				<input type="submit" value="Pesquisar" class="btn btn-primary">
			</div>
		</div>
	</form:form>
 <br />
	<table class="table table-bordered">
		<tr>
		<td>
			<td>Data Início</td>
			<td>Data Fim</td>
			<td>Nº da Mesa</td>
			<td>Nº de Pessoas</td>
			<td>Nome do Responsável</td>
		</tr>

		<c:forEach items="${reservas}" var="reserva">
			<tr>
			<td width="10"><input type="radio" name="radioButton" value="${reserva.id}"/></td>
				<td>${reserva.dataInicial}</td>
				<td>${reserva.dataFinal}</td>
				<td>${reserva.mesa.numero}</td>
				<td>${reserva.num_Pessoas} Pessoas</td>
				<td>${reserva.nome_responsavel}</td>
			
			</tr>
		</c:forEach>
	</table>
	
	
	
	<c:url var="url" value="/reserva/novo" />
	<a href="${url}" class="btn btn-primary">Nova Reserva</a>
		
	<a href="" onclick="return updateForm()" class="btn btn-primary">Atualizar</a>
	<button onclick="return removeForm()" class="btn btn-danger">Deletar</button>
	
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
							var updateUrl = "/Restaurante/reserva/" + rb + "/remove";
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
				var updateUrl = "/Restaurante/reserva/" + rb + "/updateForm";
				window.location.href = updateUrl;
				//alert(updateUrl);	
				return false;
			}

		}
	</script>
	
	
	
</div>
