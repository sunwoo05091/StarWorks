<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/includes/header.jsp"%>
<style type="text/css">
	textarea{
		height: 100px;
		width: 800px;
		border-radius: 10px;
		border: solid 2px;
	}
	
	.ContentBox{
		border:  solid 2px;
		border-radius: 10px;
		width: 1100px;
		height: 1500px;
		margin-left: 500px;
		background-color: white;
		
	}
	
	img{
		width: 1000px;
		
		margin-left: 50px;
	}
	
	.detail_box{
		margin-left: 100px;
	}
	
	.reply_box{
		width: 1200px;
		margin-top: 100px;
		margin-left: 100px;
		color : black;
	}
	
	.bottom_box{
		margin-left: 850px;
	}
	
	p{
		display: inline;
	}
	
	.cm_title{
		font-size: 30px;
		color : black;
	}
	
	.cm_price{
		font-size: 20px;
		color : black;
		 
	}
	
	.cm_contents{
		color : black;
	}
	
	.cm_state{
		font-size: 30px;
		color : #fb6400;
	}
	
	a{
		text-decoration: none;
	}
	
	
</style>
</head>
<body>

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
  <li class="breadcrumb-item"><a href="#">${community.cm_title }</a></li>
</ol>
	<div class="ContentBox">
		<div class="bottom_box">
			<a class="badge bg-success" href="/community/trade/modify?cm_no=${community.cm_no}">글수정</a>
			<a class="badge bg-warning" href="deleteTrade.do?cm_no=${community.cm_no}">글삭제</a>
		</div>
			<c:if test="${community.cm_fname != null }">
				<c:set var="head" value="${fn:substring(community.cm_fname, 
										0, fn:length(community.cm_fname)-4) }"></c:set>
				<c:set var="pattern" value="${fn:substring(community.cm_fname, 
				fn:length(head) +1, fn:length(community.cm_fname)) }"></c:set>
					
					<!-- <img src="/resources/upload/7.PNG"> --> 
				   <c:choose>
					<c:when test="${pattern == 'jpg' ||pattern == 'JPG' || pattern == 'gif' || pattern =='png'|| pattern =='PNG' }">
						<img src="/resources/upload/${head }.${pattern}">
					</c:when>
					<c:otherwise>
						<c:out value="NO IMAGE"></c:out>
					</c:otherwise>
				</c:choose>   
			</c:if>
			
		<div class="detail_box">
			<p class="cm_state">${community.cm_state }</p><span class="cm_title"> ${community.cm_title }</span><br>
			<p>${community.cm_date }</p><br>
			<p class="cm_price"><b>${community.cm_price } 원</b></p><br><br>
			<p class="cm_contents">${community.cm_contents }</p>
		</div>
	
	
	<div class="reply_box">
	
		<h5>댓글목록</h5>
		<c:forEach var="reply" items="${replys }">
			<ul>
				<li>${reply.cm_r_contents }</li>
				<li>${reply.cm_r_date }</li>
			</ul>
		</c:forEach>
		
		
		<form action="insertReplyAction.do" method="post">
			<input type="hidden" name="cm_no" value="${community.cm_no }">
			<textarea class="textarea" name="cm_r_contents">
			</textarea><br>
			<input class="btn btn-outline-success" type="submit" value="댓글쓰기" style="margin-left: 700px; "> 
		</form>
		
	
	</div>
	
	
	</div>
</body>
</html>