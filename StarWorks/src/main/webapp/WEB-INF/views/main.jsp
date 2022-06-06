<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type = "text/css">
a{
text-decoration: none;
}
</style>
</head>
<body onload = "printClock()">
	
<ul class="nav nav-pills flex-column">
	<li>	
		<div class="card bg-light mb-3" style="max-width: 20rem;">
		  <div class="card-body">
    			<img src="/resources/img/pic1.PNG" width="100%" height="100%">
    			<br>
  			<br>
		    <div class="card-text"><div><sec:authentication property="principal.emp.dep"/>부서</div><div><sec:authentication property="principal.emp.grade"/> <sec:authentication property="principal.emp.name"/>님</div></div>
		  </div>
		</div>
	</li>
	<li>
	<div class="card bg-light mb-3" style="max-width: 20rem;">
	    	<div  style="border:1px solid #dedede; width:100%; height:60px; line-height:50px; color:#666;font-size:50px; text-align:center;" id="clock">
			</div>
			<div class="btn-group" role="group" aria-label="Basic example">
			<c:if test="${attendance.a_checkin != null }">
			  <button type="button" class="btn btn-secondary" id="workcheckbtn" disabled="disabled">${attendance.a_checkin}</button>
			</c:if>
			<c:if test="${attendance.a_checkin == null }">
			  <button type="button" class="btn btn-secondary" id="workcheckbtn" onclick="location.href='/member/checkin'">출근</button>
			</c:if>
			  <button type="button" class="btn btn-secondary" id="workcheckbtn">외근</button>
			<c:if test="${attendance.a_checkout != null }">
			  <button type="button" class="btn btn-secondary" id="workcheckbtn" disabled="disabled">${attendance.a_checkout}</button>
			</c:if>
			<c:if test="${attendance.a_checkout == null }">
			  <button type="button" class="btn btn-secondary" id="workcheckbtn" onclick="location.href='/member/checkout'">퇴근</button>
			</c:if>
			</div>
	</div>
	</li>
	<li class="nav-item">
    	<a class="nav-link" href="/member/organizationchart">조직도</a>
  </li>
</ul>
<div>
<ul class="mainCard">
	<li class="mainbox">
<div class="card bg-light mb-3" style="max-width: 20rem;">
  <div class="card-header"><img src="/resources/img/document.PNG">전자결제</div>
  <div class="card-body">
  <ul>
	  <li>
   	 	<a class="card-text" href="/testGit/document/insertForm.do">문서작성</a>
 	 </li>
	  <li>
   	 	<a class="card-text" href="#">수신함</a>
 	 </li>
	  <li>
   	 	<a class="card-text" href="/testGit/document/listDocumentSignCompleteAction.do"> 완료문서함</a>
 	 </li>
  </ul>
  </div>
</div>
	</li>
	<li class="mainbox">
<div class="card bg-light mb-3" style="max-width: 20rem;">
  <div class="card-header"><img src="/resources/img/calendar.PNG">일정관리</div>
  <div class="card-body">
  <ul>
	  <li>
   	 	<a class="card-text" href="/testGit/schedule/moveSchedule.do">일정관리</a>
 	 </li>
	  <li>
   	 	<a class="card-text" href="/testGit/schedule/insertForm.do">일정작성</a>
 	 </li>
	  <li>
   	 	<a class="card-text" href="/testGit/schedule/listAction.do">일정 전체조회</a>
 	 </li>
  </ul>
  </div>
</div>
	</li>
	<li class="mainbox">
<div class="card bg-light mb-3" style="max-width: 20rem;">
  <div class="card-header"><img src="/resources/img/board.PNG">공지사항</div>
  <div class="card-body">
  <ul>
	  <li>
   	 	<a class="card-text" href="/testGit/board/listNoticeAction.do">공지사항</a>
 	 </li>
	  <li>
   	 	<a class="card-text" href="/testGit/board/listReferenceroomAction.do">자료실</a>
 	 </li>
	  <li>
   	 	<a class="card-text" href="/testGit/Meetingroom/listReserveAction.do">회의실</a>
 	 </li>
  </ul>
  </div>
</div>
	</li>
</ul>
</div>
<div>
<ul class="mainCard">
	<li class="mainbox">
<div class="card bg-light mb-3" style="max-width: 20rem;">
  <div class="card-header"><img src="/resources/img/community.PNG">커뮤니티</div>
  <div class="card-body">
  <ul>
	  <li>
   	 	<a class="card-text" href="/testGit/community/listCommunityAction.do">중고거래게시판</a>
 	 </li>
	  <li>
   	 	<a class="card-text" href="/testGit/community/listCommunityClubAction.do">동아리게시판</a>
 	 </li>
	  <li>
   	 	<a class="card-text" href="/testGit/community/listCommunityCarfullAction.do">카풀게시판</a>
 	 </li>
  </ul>
  </div>
</div>
	</li>
	<li class="mainbox">
<div class="card bg-light mb-3" style="max-width: 20rem;">
  <div class="card-header"><img src="/resources/img/mypage.PNG">마이페이지</div>
  <div class="card-body">
  <ul>
	  <li>
   	 	<a class="card-text" href="#"> 개인정보</a>
 	 </li>
	  <li>
   	 	<a class="card-text" href="#"> 급여명세서</a>
 	 </li>
	  <li>
   	 	<a class="card-text" href="#"> 주소록</a>
 	 </li>
  </ul>
  </div>
</div>
	</li>
	<sec:authorize access="hasRole('ADMIN')">
	<li class="mainbox">
<div class="card bg-light mb-3" style="max-width: 20rem;">
  <div class="card-header"><img src="/resources/img/personel.PNG">인사관리</div>
  <div class="card-body">
  <ul>
	  <li>
   	 	<a class="card-text" href="/member/listEmpCheck"> 계정신청승인</a>
 	 </li>
	  <li>
   	 	<a class="card-text" href="#"></a>
 	 </li>
	  <li>
   	 	<a class="card-text" href="#"></a>
 	 </li>
  </ul>
  </div>
  
</div>
	</li>
	</sec:authorize>
</ul>
</div>
</body>
<%@include file="/WEB-INF/views/includes/footer.jsp"%>
</html>