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

	<div class="row container-fluid">
		<div class="col-sm-12">
			<h1 align="center">
				SINAV OKULLARI <small class="text-muted">YKS SINAV SORULARI</small>
			</h1>
			<blockquote class="blockquote" align="center">
				<footer class="blockquote-footer">GOZU YUKSEKLERDE
					OLANLARIN ADRESI!</footer>
			</blockquote>
			<p align="center">
				<img
					src="https://cdnd.toyzzshop.com/product/100x100/5aba8_Kartal.jpg"
					alt="" align="center" style="border-radius: 50px;">
			</p>
			<hr>
		</div>
	</div>
	<br>
	<br>
	<br>
	<div class="row container-fluid">
		<div class=col-sm-6>
			<a href='<s:url value="/questions"></s:url>'>
				<button type="button"
					class="btn btn-outline-primary btn-lg btn-block">SINAV
					SORULARINI HAZIRLA</button>
			</a>
		</div>
		<div class=col-sm-6>
			<a href='<s:url value="/exam"></s:url>'>
				<button type="button"
					class="btn btn-outline-secondary btn-lg btn-block">SINAV
					YAP</button>
			</a>
		</div>
	</div>



</body>
</html>
