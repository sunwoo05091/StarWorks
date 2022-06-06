<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
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
	</li>
</ul>
<ol class="breadcrumb">
  <li class="breadcrumb-item"><a href="/">홈</a></li>
  <li class="breadcrumb-item"><a href="#">인사관리</a></li>
  <li class="breadcrumb-item active">계정승인 신청</li>
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
      <th class = "th_grade" scope="col">권한</th>
      <th class = "th_approve" scope="col">승인</th>
    </tr>
</thead>
<tbody>
	<c:forEach var = "emp" items = "${list }">
		<c:if test="${emp.signupcheck == 0 }">
			<tr class="table-light">
		      <td scope="row">${emp.e_no }</td>
		      <td>${emp.id }</td>
		      <td>${emp.name }</td>
		      <td>${emp.phone_number }</td>
		      <form action = "/member/listEmpCheck" method = "post">
				<input type = "hidden" name = "e_no" value = "${emp.e_no }">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
		      <td>
				<input type="text" id="datePicker" class="form-control" value="" name = "hiredate">
				</td>
		      <td>    
		      <div class="form-group">
			      <select class="form-select" id="exampleSelect1" name = "dep">
			        <option value="인사">인사</option>
			        <option value="개발">개발</option>
			        <option value="영업">영업</option>
			        <option value="임원">임원</option>
			        <option value="총무">총무</option>
			      </select>
		    	</div>
		    </td>
		      <td>
		      <div class="form-group">
			      <select class="form-select" id="exampleSelect1" name = "grade">
			        <option value="사원">사원</option>
			        <option value="주임">주임</option>
			        <option value="대리">대리</option>
			        <option value="과장">과장</option>
			        <option value="차장">차장</option>
			        <option value="부장">부장</option>
			        <option value="이사">이사</option>
			        <option value="사장">사장</option>
			      </select>
		    	</div>
			</td>	
		      <td>
		      <div class="form-group">
			      <select class="form-select" id="exampleSelect1" name = "auth">
			        <option>일반</option>
			        <option>관리자</option>
			      </select>
		    	</div>
			</td>	
		      <td><button type="submit" class="btn btn-outline-light" id = "approveSignUp">승인</button></td>
		    </tr>
	      </form>
	    </c:if>
	</c:forEach>
</tbody>
</table>
</body>
<%@include file="/WEB-INF/views/includes/footer.jsp"%>
</html>