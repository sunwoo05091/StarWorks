<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/includes/header.jsp"%>
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
  <li class="breadcrumb-item"><a href="/">홈</a></li>
  <li class="breadcrumb-item"><a href="/member/organizationchart">조직도</a></li>
  <li class="breadcrumb-item active">${dep }부</li>
</ol>
<table class="table table-hover">
<thead>
    <tr class="table-dark">
      <th class = "th_e_no" scope="col">사번</th>
      <th class = "th_id" scope="col">아이디</th>
      <th class = "th_name" scope="col">이름</th>
      <th class = "th_p_no" scope="col">전화번호</th>
      <th class = "th_hiredate" scope="col">입사일자</th>
      <th class = "th_d_no" scope="col">부서</th>
      <th class = "th_grade" scope="col">직급</th>
    </tr>
</thead>
<tbody>
	<c:forEach var = "emp" items = "${list }">
			<tr class="table-light">
		      <td scope="row">${emp.e_no }</td>
		      <td>${emp.id }</td>
		      <td>${emp.name }</td>
		      <td>${emp.phone_number }</td>
		      <td>${emp.hiredate }</td>
		      <td>${emp.dep }</td>
		      <td>${emp.grade }</td>
			</tr>
	</c:forEach>
</tbody>
</table>
</body>
<%@include file="/WEB-INF/views/includes/footer.jsp"%>
</html>