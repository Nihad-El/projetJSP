<%@page import="beans.Client"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="beans.Occupation"%>
<%@page import="service.OccupationService"%>
<%@page import="controller.OccupationController"%>
<%@page import="ma.projet.controlleur.deconnexion"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<script src="scripts/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="scripts/occ.js" type="text/javascript"></script>
<meta charset="UTF-8">
</head>
<body>


	<div class="container-scroller">


		<jsp:include page="header2.jsp"></jsp:include>
		<jsp:include page="header.jsp"></jsp:include>


		<div class="container-fluid page-body-wrapper">
			<div class="main-panel">
				<div class="content-wrapper pb-0">

					<div class="content">

						<!-- reservaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaatioooooooooooooooooon -->



						<div class="col-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Réservation d'une salle</h4>


									<div class="form-group">
										<label for="exampleInputName1">Date</label> <input
											class="form-control" type="date" id="date" name="date"
											min="2022-01-01" max="2023-12-31">
									</div>

									<div class="form-group">
										<label for="exampleInputName1">Numéro de salle</label> <select
											class="form-control" id="code" name="code">
											<%
											String login = "root";
											String password = "";
											String driver = "com.mysql.cj.jdbc.Driver";
											String url = "jdbc:mysql://localhost/emsi?serverTimezone=UTC";
											Class.forName(driver);
											String sql = "select id,code from salle";
											Connection cn = DriverManager.getConnection(url, login, password);
											PreparedStatement ps = cn.prepareStatement(sql);
											ResultSet rs = ps.executeQuery();
											while (rs.next() == true) {
											%>
											<option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%>
											</option>
											<%
											}
											%>
										</select>
									</div>

									<div class="form-group">
										<label for="exampleInputName1">Heure</label> <select
											class="form-control" name="heureDebut" id="heureDebut">
											<%
											Class.forName(driver);
											String sql2 = "select id,heureDebut,heureFin from crenom";
											Connection cn2 = DriverManager.getConnection(url, login, password);
											PreparedStatement ps2 = cn2.prepareStatement(sql2);
											ResultSet rs2 = ps2.executeQuery();
											while (rs2.next() == true) {
											%>
											<option value="<%=rs2.getInt(1)%>"><%=rs2.getString(2)%>

											</option>
											<%
											}
											%>
										</select>
									</div>


									<div class="form-group">
										<label for="exampleInputName1">Client</label> <input
											class="form-control" type="text" id="matricule" name="matricule" value="">
									</div>
									
									



									<button class="btn btn-light" id="add" type="submit">Envoyer</button>




								</div>
							</div>
						</div>

					</div>



					<div class="col-lg-12 grid-margin stretch-card">
						<div class="card">
							<div class="card-body">


								<div class="table-responsive">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>id</th>
												<th>Date</th>
												<th>Salle</th>
												<th>heuredebut</th>
												<th>heurefin</th>
												<th>Matricule</th>
												<th>Statut</th>
											</tr>
										</thead>

										<tbody id="content">

										</tbody>

									</table>
								</div>
							</div>
						</div>
					</div>




				</div>
			</div>
		</div>
	</div>





	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>