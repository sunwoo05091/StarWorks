<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link rel = "stylesheet" href="${pageContext.request.contextPath}/Resource/CSS/bootstrap.min.css" type = "text/css">
<link rel = "stylesheet" href="${pageContext.request.contextPath}/Resource/CSS/bootstrap.css?ver=4" type = "text/css">
<%@include file="/WEB-INF/views/includes/header.jsp"%>
<style type="text/css">
	.pageBox{
		width: 700px;
		margin-left: 330px;
		padding: 20px;
	}
	
		.searchBox{
		margin-left: 500px;
	}

</style>


</head>
<body background="ECF1F8">
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
		    <div class="card-text"><div>${d_name }부서</div><div>${emp.grade } ${emp.name }님</div></div>
		  </div>
		</div>
	</li>
	
  <li class="nav-item">
    <a class="nav-link " href="listNoticeAction.do">공지사항</a>
  </li>
	
  <li class="nav-item">
    <a class="nav-link active" href="listReferenceroomAction.do">자료실</a>
  </li>
	
  <li class="nav-item">
    <a class="nav-link" href="/testGit/Meetingroom/listReserveAction.do">회의실</a>
  </li>
  
</ul>
<ol class="breadcrumb">
  <li class="breadcrumb-item"><a href="/testGit/Login/mainAction.do">홈</a></li>
  <li class="breadcrumb-item"><a href="listReferenceroomAction.do">자료실</a></li>
</ol>

<div class="container">

    
    <table class="table table-hover">
        
            <tr class="table-dark">
                <th>글번호</th>
                <th>이미지</th>
                <th>제목</th>
                <td>사원번호</td>
                <td>작성일자</td>
            </tr>
        
<c:forEach var="board" items="${listModel.list }">
		<tr class="table-light">
			<td>${board.b_no }</td>
			<td>
					<c:if test="${board.b_fname != null }">
						<c:set var="head" value="${fn:substring(board.b_fname, 
												0, fn:length(board.b_fname)-4) }"></c:set>
						<c:set var="pattern" value="${fn:substring(board.b_fname, 
						fn:length(head) +1, fn:length(board.b_fname)) }"></c:set>
					
						<c:choose>
							<c:when test="${pattern == 'jpg' || pattern == 'gif'|| pattern == 'png' }">
								<img src="/testGit/upload/${head }_small.${pattern}">
							</c:when>
							<c:otherwise>
								<c:out value="NO IMAGE"></c:out>
							</c:otherwise>
						</c:choose>
					</c:if>
			</td>			
			<td><a href="detailReferenceroomAction.do?b_no=${board.b_no }">${board.b_title }</a></td>
			<td>${board.e_no }</td>
			<td>
				<fmt:parseDate var="dt" value="${board.b_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
				<fmt:formatDate value="${dt }" pattern="yyyy/MM/dd"/>
			</td>
			
		</tr>
		</c:forEach>
    </table>
    
    	<!-- 페이징 처리 부분 -->
	
	<!-- 이전영역 -->
<div class="pageBox">
    <ul  class="pagination">
	<c:if test="${listModel.startPage >= 6 }">
		<a href="listReferenceroomAction.do?pageNum=${listModel.startPage - 1 }">[이전]</a>
	</c:if>
	
	<!-- 페이지 목록 출력 -->
	<c:forEach var="pageNo" begin="${listModel.startPage }" end="${listModel.endPage }">
		<c:if test="${listModel.requestPage == pageNo }"><b></c:if>
			<a href="listReferenceroomAction.do?pageNum=${pageNo }">[${pageNo }]</a>
		<c:if test="${listModel.requestPage == pageNo }"></b></c:if>	
	</c:forEach>
	
	<!-- 이후영역 -->
	<c:if test="${listModel.endPage <  listModel.totalPageCount}">
		<a href="listReferenceroomAction.do?pageNum=${listModel.endPage + 1 }">[이후]</a>
	</c:if>
	
	</ul>
	</div>
	
	<div class="searchBox">
    	<form action="listReferenceroomAction.do" method="get">
		<input type="checkbox" name="area" value="b_title">제목
		<input type="checkbox" name="area" value="e_no">사원번호
		<input type="text" name="searchKey" size="10">
		<input type="submit" value="검색">
	    </form>	
	</div>
    <hr>
	<a class="badge bg-success" style="margin-left: 1450px;" href="insertReferenceroomForm.do?b_category=referenceroom">글쓰기</a>
	
</div>

</body>
</html>