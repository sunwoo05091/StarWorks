<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/includes/header.jsp"%>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/vanillajs-datepicker@1.1.4/dist/js/datepicker-full.min.js"></script>
<link rel = "stylesheet" href="/resources/CSS/organization.css" type = "text/css">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<!--한국어  달력 쓰려면 추가 로드-->
</head>
<body onload = "printClock()">


<ul class="nav nav-pills flex-column">
	<li>
		<div class="card bg-light mb-3" style="max-width: 20rem;">
		  <div class="card-body">
		    <svg xmlns="http://www.w3.org/2000/svg" class="d-block user-select-none" width="100%" height="130" aria-label="Placeholder: Image cap" focusable="false" role="img" preserveAspectRatio="xMidYMid slice" viewBox="0 0 318 180" style="font-size:1.125rem;text-anchor:middle">
    			<rect width="100%" height="100%" fill="#868e96"></rect>
    			<text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text>
  			</svg>
  			<br>
		    <div class="card-text"><div><sec:authentication property="principal.emp.dep"/>부서</div><div><sec:authentication property="principal.emp.grade"/> <sec:authentication property="principal.emp.name"/>님</div></div>
</ul>
<ol class="breadcrumb">
  <li class="breadcrumb-item"><a href="mainAction.do">홈</a></li>
  <li class="breadcrumb-item active">조직도</li>
</ol>
<div class="tree">
    <ul>
		<li>
			<button type="button" class="btn btn-outline-info">사장</button>
			<ul>
				<li>
					<button type="button" class="btn btn-outline-info">부사장</button>
					<ul>
						<li>
							<button type="button" class="btn btn-outline-secondary" onClick = "location.href = 'listOrganizationchart?dno=1'">인사</button>
						</li>
						<li>
							<button type="button" class="btn btn-outline-secondary" onClick = "location.href = 'listOrganizationchart?dno=5'">총무</button>
						</li>
					</ul>
				</li>
				<li>
					<button type="button" class="btn btn-outline-info">이사</button>
					<ul>
						<li>
							<button type="button" class="btn btn-outline-secondary" onClick = "location.href = 'listOrganizationchart?dno=3'">개발</button>
						</li>
						<li>
							<button type="button" class="btn btn-outline-secondary" onClick = "location.href = 'listOrganizationchart?dno=2'">영업</button>
						</li>
					</ul>
				</li>
			</ul>
		</li>
	</ul>
</div>
</body>
<%@include file="/WEB-INF/views/includes/footer.jsp"%>
</html>