<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StarWorks</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style type = "text/css">
a{
text-decoration: none;
}
</style>
</head>
<body onload = "printClock()">
	
<div id="container">
<div class="card bg-light mb-3 mainitem mainitem1" style="min-width : 20rem;">
		<div class="card bg-light mb-3" style="max-width: 20rem;">
		  <div class="card-body" style="height: 230px;">
  			<img src="/resources/img/pic1.PNG" width="100%" height="110%">
  		  </div>
		</div>
	  <div class="card-text"><div><sec:authentication property="principal.emp.dep"/>부서 <sec:authentication property="principal.emp.grade"/> <sec:authentication property="principal.emp.name"/>님</div></div>
  	
		<div class="card bg-light mb-3" style="max-width: 20rem;">
	    	<div style="border:1px solid #dedede; width:100%; height:100px; line-height:100px; color:#666;font-size:100px; text-align:center;" id="clock">
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
</div>
<div class="card bg-light mb-3 mainitem mainitem2" style="min-width : 20rem;" id="item2">
<div id="chart_div"></div>
<table class="table table-hover">
  <thead>
    <tr class="table-dark">
      <td>오늘의 근무시간</td>
      <td>총 근무 시간</td>
      <td>남은 연차</td>
    </tr>
  </thead>
  <tbody>
  	<tr style="font-size : 200%;">
  		<td>09:00 ~ 18:00</td>
  		<td>50 / 52</td>
  		<td>8 / 15</td>
  	</tr>
  </tbody>
</table>
</div>
<div class="card bg-light mb-3 mainitem mainitem3" style="min-width : 20rem;">
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
<div class="card bg-light mb-3 mainitem mainitem4" style="min-width : 20rem;">
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
<div class="card bg-light mb-3 mainitem mainitem5" style="min-width : 20rem;">
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
<div class="card bg-light mb-3 mainitem mainitem6" style="min-width : 20rem;">
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
<div class="card bg-light mb-3 mainitem mainitem7" style="min-width : 20rem;">
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
	<sec:authorize access="hasRole('ADMIN')">
<div class="card bg-light mb-3 mainitem mainitem8" style="min-width : 20rem;">
  <div class="card-header"><img src="/resources/img/personel.PNG">인사관리</div>
  <div class="card-body">
  <ul>
	  <li>
   	 	<a class="card-text" href="/member/listEmpCheck"> 계정신청승인</a>
 	 </li>
	  <li>
   	 	<a class="card-text" href="#">근태기록 조회</a>
 	 </li>
	  <li>
   	 	<a class="card-text" href="#">연차기록 조회</a>
 	 </li>
  </ul>
  </div>
  
</div>
	</sec:authorize>
</div>
</body>
<script>
google.charts.load('current', {packages: ['corechart', 'bar']});
google.charts.setOnLoadCallback(drawBasic);

function drawBasic() {

    var data = new google.visualization.DataTable();
    data.addColumn('string', '요일');
    data.addColumn('number', '근로시간');

    data.addRows([
      ['월요일', 8],
      ['화요일', 9],
      ['수요일', 9],
      ['목요일', 8],
      ['금요일', 10],
      ['토요일', 4],
      ['일요일', 2],
    ]);

    var options = {
      title: '근퇴 현황',
      width: 660,
      height:300,
      hAxis: {},
      vAxis: {}
    };

    var chart = new google.visualization.ColumnChart(
      document.getElementById('chart_div'));

    chart.draw(data, options);
  }
</script>
<%@include file="/WEB-INF/views/includes/footer.jsp"%>
</html>