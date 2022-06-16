  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script type="text/javascript" src="/resources/js/login.js"></script>
<link rel = "stylesheet" href="/resources/CSS/bootstrap.min.css" type = "text/css">
<link rel = "stylesheet" href="/resources/CSS/bootstrap.css" type = "text/css">
<style type="text/css">
	.pageBox{
		width: 700px;
		margin-left: 620px;
		
	}
	
	a{
		text-decoration: none;
	}
	
	.searchBox{
		margin-left: 700px;
	}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">StarWorks</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarColor01">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" href="mainAction.do">홈
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/testGit/document/listAction.do">전자결제</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/testGit/schedule/moveSchedule.do">일정관리</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/testGit/Meetingroom/listNoticeAction.do">공지사항</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/testGit/community/listCommunityAction.do">커뮤니티</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">마이페이지</a>
        </li>
      </ul>
      <form class="d-flex">
          <a class="nav-link" href="logOutAction.do" id = "logout">로그아웃</a>
      </form>
    </div>
  </div>
</nav>
<ul class="nav nav-pills flex-column">
	<li>
		<div class="card bg-light mb-3" style="max-width: 20rem;">
		  <div class="card-body">
		    <svg xmlns="http://www.w3.org/2000/svg" class="d-block user-select-none" width="100%" height="130" aria-label="Placeholder: Image cap" focusable="false" role="img" preserveAspectRatio="xMidYMid slice" viewBox="0 0 318 180" style="font-size:1.125rem;text-anchor:middle">
    			<rect width="100%" height="100%" fill="#868e96"></rect>
    			<text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text>
  			</svg>
  			<br>
		    <div class="card-text" style="color: #7b95cc;"><div>인사부서</div><div>${emp.grade } ${emp.name }님</div></div>
		  </div>
		</div>
	</li>
  <li class="nav-item">
    <a class="nav-link active" href="listCommunityAction.do">중고거래게시판</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="listCommunityClubAction.do">동아리게시판</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="listCommunityCarfullAction.do">카풀게시판</a>
  </li>
  
</ul>
<ol class="breadcrumb">
  <li class="breadcrumb-item"><a href="#">중고거래게시판</a></li>
</ol>
<a href="insertNoticeTradeFormAction.do" style="margin-left: 1430px;" class="badge bg-warning" >공지 등록</a><br>
<table class="table table-hover" style="width :70%; margin-left: 350px; text-align: center;">
  <colgroup>
  	<col width="50px">
  	<col width="500px">
  	<col width="60px">
  	<col width="40px">
  </colgroup>
  <thead>
    <tr class="table-dark">
      <th scope="col">글번호</th>
      <th scope="col">제목</th>
      <th scope="col" style="margin-left: 500px;">작성일</th>
      <th scope="col">조회수</th>
    </tr>
  </thead>
  <tbody>

	<%-- <c:forEach var="notice" items="${Notice}">
		<tr class="table-danger">
			<td>${notice.cm_no}</td>
			<td><a style="font: red;"
				href="detailClubAction.do?cm_no=${notice.cm_no}">[공지]${notice.cm_title }</a></td>
			<td><fmt:parseDate var="dt" value="${notice.cm_date }"
					pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate value="${dt }"
					pattern="yyyy/MM/dd" /></td>
			<td>${notice.cm_hitcount }</td>
		</tr>
	</c:forEach> --%>
	
	<c:forEach var="community" items="${list}">
	<tr class="table-light">
		<td>${community.cm_no}</td>
		<td><a href="/community/trade/get?cm_no=${community.cm_no}">${community.cm_title }</a>
		<span class="badge bg-primary" style="margin-left: 10px;">${community.cm_state }</span></td>
		<td> 
			<fmt:parseDate var="dt" value="${community.cm_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
			<fmt:formatDate value="${dt }" pattern="yyyy/MM/dd"/>
		</td>
		<td>${community.cm_hitcount } </td>
	</tr>
	</c:forEach>
  </tbody>
</table>
	<a class="badge bg-success" href="/community/trade/register" style="margin-left: 1450px;">글쓰기</a> 
	<br><br>
	<!-- 페이징 처리 부분 -->
	
	<!-- 이전영역 -->
<%-- 	<div class="pageBox">
		<ul  class="pagination">
		<c:if test="${listModel.startPage >= 6 }">
			<li class="page-item active">
				<a class="page-link" href="listCommunityAction.do?pageNum=${listModel.startPage - 1 }">[이전]</a>
			</li>	
		</c:if>
		
		<!-- 페이지 목록 출력 -->
		<c:forEach var="pageNo" begin="${listModel.startPage }" end="${listModel.endPage }">
			<c:if test="${listModel.requestPage == pageNo }"><b></c:if>
				 <li class="page-item active">
					<a class="page-link" href="listCommunityAction.do?pageNum=${pageNo }">[${pageNo }]</a>
				 </li>	
			<c:if test="${listModel.requestPage == pageNo }"></b></c:if>
		</c:forEach>
		
		<!-- 이후영역 -->
		<c:if test="${listModel.endPage < listModel.totalPageCount }">
			<li class="page-item active">
				<a class="page-link" href="listCommunityAction.do?pageNum=${listModel.startPage + 5 }">[이후]</a>
			</li>	
		</c:if>
		</ul>
	</div> --%>
	
	<div class="searchBox">
		<form action="listCommunityCarfullAction.do" method="get">
			<input type="checkbox" name="area" value="cm_title"><span style="color: black;"> 제목 </span>
			<input type="checkbox" name="area" value="e_no"><span style="color: black;"> 작성자 </span>
			<input type="text" name="searchKey" size="30">
			<input type="submit" value="검색">
		</form>
	</div>
	
	

</body>
</html>