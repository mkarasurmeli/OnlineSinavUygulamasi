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
	<div class=container>
		<h1 align="center">
			SINAV OKULLARI <br> <small class="text-muted">YKS
				SINAVINA HOSGELDINIZ</small>
		</h1>
		<hr>
		<c:if test="${ empty examSt }">
			<a href='<s:url value="/examStart"></s:url>'>
				<button type="button" class="btn btn-primary btn-lg btn-block">SINAVA
					BASLA</button>
			</a>
		</c:if>
		<c:if test="${ not empty examSt }">
			<label> ${examSt} </label>
			<div class="row container-fluid">
				<div class="col-sm-12" align="center">
					<div class="card" style="width: 50rem;">
						<div class="card-body">
							<div class="form-group">
								<form action='<s:url value="/examx"></s:url>' method="POST">
									<h3>${ i }-${ question}</h3>
									<c:if test="${ not empty examLs }">
										<c:forEach var="item" items="${ examLs }">
											<div class="form-group row container-fluid ">
												<div class="custom-control custom-radio">
													<input type="radio" id="${ item.getoId() }" name="option"
														value="${ item.getoId() }" class="custom-control-input">
													<label class="custom-control-label"
														for="${ item.getoId() }">${ item.getOption() }</label>
												</div>
											</div>
										</c:forEach>
										<div class=row>
											<div class=col-sm-12 align="right">
												<input type="submit" value="ILERI"
													class="btn btn-outline-danger btn-sm">
											</div>
										</div>
									</c:if>
									<c:if test="${ empty examLs }">
										<h1>SINAV TAMAMLANDI</h1>
										<a href='<s:url value="/result"></s:url>'>
											<button type="button"
												class="btn btn-primary btn-lg btn-block">SONUÇ SAYFASINA İLERLE</button>
										</a>
									</c:if>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>
	</div>
</body>
</html>




