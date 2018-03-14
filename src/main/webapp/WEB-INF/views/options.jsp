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

	<h1 align="center">SECENEK EKLEME SAYFASI</h1>
	<hr>
	<form action='<s:url value="/options/${qId}" ></s:url>' method="post">
		<div class="row container-fluid">
			<div class="col-sm-12" align="center">
				<div class="card" style="width: 50rem;">
					<div class="card-body">
						<div class="form-group">
							<label for="secenekekle"> ${qId} - ${question} </label>
							<div class=row>
								<div class=col-sm-9>
									<textarea class="form-control" name="option" id="secenekekle"
										placeholder="SECENEK GIRINIZ..." rows="1"></textarea>
								</div>
								<div class=col-sm-3>
									<select name=DY class="form-control">
										<option value="YANLIŞ">YANLIŞ</option>
										<option value="DOĞRU">DOĞRU</option>
									</select>
								</div>
							</div>
							<br>
							<div class=col-sm-12 align=right>
								<input type="submit" class="col-sm-4 btn btn-outline-primary"
									value=" EKLE ">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<div class="row container-fluid">
		<div class="col-sm-12" align="center">
			<div class="card" style="width: 50rem;">
				<div class="card-body">
					<div class="form-group">
						<label> ${ qId } - ${ question } </label>
						<hr>

						<c:forEach var="item" items="${ optionsLs }">
							<div class="form-group row container-fluid ">
								<div class="col-sm-8 custom-control custom-radio" align="left">
									<input type="radio" class="custom-control-input"
										id="${ item.getoId() }" value="${ item.getoId() }"
										name="option"><label class="custom-control-label"
										for="${ item.getoId() }">${ item.getOption() }</label>
								</div>
								<div class="col-sm-2" align="center">
									<label> ${item.getAnswer()} </label>
								</div>
								<div class=col-sm-2 align="center">
									<a
										href='<s:url value="/optionDelete/${ item.getqId() }/${ item.getoId() }"></s:url>'>
										<button type="button" class="btn btn-outline-danger btn-sm">Sil</button>
									</a>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
