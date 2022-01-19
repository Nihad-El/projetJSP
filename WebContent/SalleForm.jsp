<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="beans.Salle"%>
<%@page import="service.SalleService"%>
<%@page import="controller.SalleController"%>
<%@page import="ma.projet.controlleur.deconnexion"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="scripts/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="scripts/salle.js" type="text/javascript"></script>
<title>Gestion des salles</title>
</head>
<body>


	<div class="container-scroller">


		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="Menu.jsp"></jsp:include>


		<div class="container-fluid page-body-wrapper">
			<div class="main-panel">
				<div class="content-wrapper pb-0">


					<div class="content">

						<div class="col-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Ajout d'une salle</h4>
									<div class="form-group">
										<label for="exampleInputName1">Code</label> <input required=""
											type="text" class="form-control" value="" name="code"
											id="code" placeholder="Veuillez insérer le code" />
									</div>

									<div class="form-group">
										<label for="exampleInputName1">Capacite</label> <input
											required="" type="text" class="form-control" value=""
											name="capacite" id="capacite" placeholder="Veuillez insérer la capacite" />
									</div>

									<div class="form-group">
										<label for="exampleInputName1" >Type</label> <select
											name="type" id="type" class="form-control">
											<option value="Theorique">Theorique</option>
											<option value="Pratique">Pratique</option>
										</select>

									</div>



									<button class="btn btn-light" id="add" type="submit">Envoyer</button>




								</div>
							</div>
						</div>









						<div class="col-lg-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">

									</p>
									<div class="table-responsive">
										<table class="table table-bordered">
											<thead>
												<tr>
													<th>id</th>
													<th>Code</th>
													<th>Capacite</th>
													<th>Type</th>
													<th>Supprimer</th>
													<th>Modifier</th>
												</tr>
											</thead>

											<tbody id="content">

											</tbody>

										</table>
									</div>
								</div>
							</div>
						</div>



						<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>