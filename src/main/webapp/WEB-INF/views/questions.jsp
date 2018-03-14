<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<title>Home</title>
</head>
<body>
	<h1 align="center">SINAV SORULARINI HAZIRLA</h1>
	<hr>
	<br>
	<div class="row container-fluid">
		<div class="col-sm-5">
			<h3>SINAV SORUSU GIR</h3>
			<hr>
			<form action='<s:url value="/questionadd" ></s:url>' method="post">
				<div class="card" style="width: 24rem;">
					<div class="card-body">
						<div class="form-group">
							<label for="soruekle">SORU EKLE</label>
							<textarea class="form-control" name="question" id="soruekle"
								placeholder="SORU GIRINIZ" rows="3"></textarea>
							<br>
							<div class=col-sm-12 align=right>
								<input type="submit" class="col-sm-4 btn btn-outline-primary"
									value=" EKLE ">
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="col-sm-7">
			<h3>SINAV SORUSU DUZENLE</h3>
			<hr>
			<c:if test="${not empty qLs }">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">No:</th>
							<th scope="col">Soru</th>
							<th scope="col">İşlem</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${ qLs }">

							<tr>
								<td>${ item.getqId() }</td>
								<td>${ item.getQuestion() }</td>
								<td><a
									href='<s:url value="/options/${ item.getqId() }"></s:url>'>
										<button type="button" class="btn btn-outline-primary btn-sm">Secenek
											Ekle</button>
								</a> <a href='<s:url value="/questions/${ item.getqId() }"></s:url>'>
										<button type="button" class="btn btn-outline-danger btn-sm">Soruyu
											Sil</button>
								</a></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</c:if>
		</div>
	</div>
</body>
</html>
