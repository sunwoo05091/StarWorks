<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>calendar</title>
<%@include file="/WEB-INF/views/includes/header.jsp"%>


<ul class="nav nav-pills flex-column" style="position: absolute;">
	<div class="card bg-light mb-3" style="max-width: 20rem;">
		  <div class="card-body">
		    <svg xmlns="http://www.w3.org/2000/svg" class="d-block user-select-none" width="100%" height="130" aria-label="Placeholder: Image cap" focusable="false" role="img" preserveAspectRatio="xMidYMid slice" viewBox="0 0 318 180" style="font-size:1.125rem;text-anchor:middle">
    			<rect width="100%" height="100%" fill="#868e96"></rect>
    			<text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text>
  			</svg>
  			<br>
		    <div class="card-text"><div>인사부서</div><div>${emp.grade } ${emp.name }님</div></div>
		  </div>
	</div>
  <li class="nav-item">
    <a class="nav-link active" href="schedule">개인 일정</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="insertForm.do">일정 생성</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="listAction">일정 조회</a>
  <hr style="border: solid 1px gray;">
	<li>분류별 일정</li><br>
	<li style="text-decoration: none;"><a href="TypeScheduleAction.do?s_type=1" id="tag">- 개인</a></li><br>
	<li style="text-decoration: none;"><a href="TypeScheduleAction.do?s_type=2" id="tag">- 미팅</a></li><br>
	<li style="text-decoration: none;"><a href="TypeScheduleAction.do?s_type=3" id="tag">- 회의</a></li><br>
</ul>

<ol class="breadcrumb">
  <li class="breadcrumb-item"><a href="moveSchedule.do" id="tag">홈</a></li>
  <li class="breadcrumb-item"><a href="insertForm.do" id="tag">일정 생성</a></li>
  <li class="breadcrumb-item active"><a href="listAction.do" id="tag" >전체 조회<a></a></li>
</ol>

<div class="card-header">오늘 일정</div>
<c:forEach var="schedule" items="${schedule }">
<div class="card text-white bg-primary mb-3" style="font-size:10px; width: 200px; height: 100px; position: relative; margin-left: 220px;">
  <div class="card-body">
    <div class="card-title">${schedule.s_title } D+${schedule.remainingdays }</div>
  </div>
 </div>
</c:forEach>


  </body>
</html>