<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

    <c:import url="${request.contextPath}/menu" />

	<div class="container" >
		
		<c:url var="url" value="/mesa/filtrar" />
		<form:form action="${url}" method="get" modelAttribute="filtro">
			<div class="row">
				<div class="col-md-1">De Reserva:</div>
				<div class="col-md-2">
					<form:select class="form-control" items="${selectDeReserva}"  length="30" path="deReserva" />
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
				<td>Número</td>
				<td>Capacidade</td>
				<td>De Reserva</td>
			</tr>

			<c:forEach items="${mesas}" var="mesa">
				<tr>
					<td width="10"><input type="radio" name="radioButton" value="${mesa.id}"/></td>
					<td>${mesa.numero}</td>
					<td>${mesa.capacidade} Pessoas</td>
					<c:if test="${mesa.deReserva == false}">
 						<td>Não</td>
					</c:if>
					<c:if test="${mesa.deReserva == true}">
 						<td>Sim</td>
					</c:if>					
				</tr>
			</c:forEach>
		</table>
	<c:url var="url" value="/mesa/novo" />
	<a href="${url}" class="btn btn-primary">Nova Mesa</a>

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
							var updateUrl = "/Restaurante/mesa/" + rb + "/remove";
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
				var updateUrl = "/Restaurante/mesa/" + rb + "/updateForm";
				window.location.href = updateUrl;
				//alert(updateUrl);	
				return false;
			}

		}
	</script>

</div>