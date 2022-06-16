<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>calendar</title>
<%@include file="/WEB-INF/views/includes/header.jsp"%>
<style type="text/css">
   .pageBox{
      width: 700px;
      margin-left: 430px;
   }
</style>
</head>
<body background="ECF1F8">

<ul class="nav nav-pills flex-column" style="position: absolute;">
	<div class="card bg-light mb-3" style="max-width: 20rem;">
		  <div class="card-body">
		    <svg xmlns="http://www.w3.org/2000/svg" class="d-block user-select-none" width="100%" height="130" aria-label="Placeholder: Image cap" focusable="false" role="img" preserveAspectRatio="xMidYMid slice" viewBox="0 0 318 180" style="font-size:1.125rem;text-anchor:middle">
    			<rect width="100%" height="100%" fill="#868e96"></rect>
    			<text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text>
  			</svg>
  			<br>
		    <div class="card-text"><div>인사 부서</div><div>${emp.grade } ${emp.name }님</div></div>
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
  </li>
  <hr style="border: solid 1px gray;">
	<li>분류별 일정</li><br>
	<li style="text-decoration: none;"><a href="TypeScheduleAction.do?s_type=1" id="tag">- 개인</a></li><br>
	<li style="text-decoration: none;"><a href="TypeScheduleAction.do?s_type=2" id="tag">- 미팅</a></li><br>
	<li style="text-decoration: none;"><a href="TypeScheduleAction.do?s_type=3" id="tag">- 회의</a></li><br>
</ul>

<ol class="breadcrumb">
  <li class="breadcrumb-item"><a href="schedule" id="tag">홈</a></li>
  <li class="breadcrumb-item"><a href="insertSchedule" id="tag">일정 생성</a></li>
  <li class="breadcrumb-item active"><a href="listAction" id="tag" >전체 조회<a></a></li>
</ol>

 <table class="table table-hover" style="position: relative; width: 1000px; margin-left: 300px;">
    	<tr class="table-dark">
    		<td>번호
    		<td>제목
    		<td>시작일
    		<td>마감일
    		<td>남은 기간
    		<td>상태
    	</tr>
    	<c:forEach var="schedule" items="${ScheduleListModel }">
    	<tr class="table-light">
    		<td><a href="scheduleDetailAction.do?s_no=${schedule.s_no}" style="text-decoration: none;">${schedule.s_no }</a></td>
    		<td>${schedule.s_title }</td>
    		
    		<td>
    			<fmt:parseDate var="dt" value="${schedule.s_startday }" pattern="yyyy-MM-dd"/>
    			<fmt:formatDate value="${dt }" pattern="yyyy-MM-dd"/>
    		</td>
    		<td>
    			~<fmt:parseDate var="dt" value="${schedule.s_finishday }" pattern="yyyy-MM-dd"/>
    			<fmt:formatDate value="${dt }" pattern="yyyy-MM-dd"/>	
    		</td>
    		<td>D+${schedule.remainingdays }</td>
    		<td>${schedule.situation }&nbsp;&nbsp;&nbsp;</td>
    	</tr>
    	</c:forEach>
    </table>
<%-- <div class="pageBox">
 <ul  class="pagination">
		<c:if test="${ScheduleListModel.startPage >= 6 }">
	<li class="page-item active">
		<a href="SchedulePageAction.do?pageNum=${ScheduleListModel.startPage-1 }"class="page-link">이전</a>
	</li>
	</c:if>
	
	<c:forEach var="pageNo" begin="${ScheduleListModel.startPage }" end="${ScheduleListModel.endPage }">
		<c:if test="${ScheduleListModel.requestPage == pageNo }"><b></c:if>
		<li class="page-item active">
			<a href="SchedulePageAction.do?pageNum=${pageNo }" style="text-decoration: none;">${pageNo }&nbsp&nbsp</a>
		</li>
		<c:if test="${ScheduleListModel.requestPage == pageNo }"></b></c:if>
	</c:forEach>
	<c:if test="${ScheduleListModel.endPage <  ScheduleListModel.totalPage}">
	<li class="page-item active">	
		<a href="SchedulePageAction.do?pageNum=${ScheduleListModel.endPage + 1 }">이후</a>
	</li>
	</c:if>
        <c:if test="${ScheduleListModel.endPage < ScheduleListModel.totalPage}">
            <li class="page-item">
                <a class="page-link" href="SchedulePageAction.do?pageNum=${ScheduleListModel.endPage + 1}">&raquo;</a>
            </li>
        </c:if>
       </ul>
      </div> --%>
    <br>
  </body>
</html>