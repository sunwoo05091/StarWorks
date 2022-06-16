<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/includes/header.jsp"%>
<style type="text/css">
	.form-group{
		margin-left: 300px;
		width: 600px;
	}
	a{
		text-decoration: none;
	}
</style>

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

<!-- <form action="insertCommunityAction.do" method="post" enctype="multipart/form-data">
	물품명 : <input type="text" name="cm_title"><br>
	가격 : <input type="text" name="cm_price"><br>
	파일 : <input type="file" name="cm_fname"><br>
	내용 <br>
	<textarea rows="6" cols="70" name="cm_contents"></textarea>
	<br>
	<input type="submit" value="등록">
</form> -->

<form action="/community/trade/register" method="post" enctype="multipart/form-data">
   
    <div class="form-group">
      <label for="exampleInputEmail1" class="form-label mt-4">제목</label>
      <input type="text" name="cm_title" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="제목을 입력하세요">
      <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
    </div>
    <div class="form-group">
      <label for="exampleInputPassword1" class="form-label mt-4">가격</label>
      <input type="text" name="cm_price" class="form-control" id="exampleInputPassword1" placeholder="가격">
    </div>
    <div class="form-group">
      <label for="exampleTextarea" class="form-label mt-4">내용</label>
      <textarea class="form-control" name="cm_contents" id="exampleTextarea" rows="3"></textarea>
    </div>
   <div class="form-group">
      <label for="formFile" class="form-label mt-4">이미지 업로드</label>
      <input class="form-control" type="file" name="cm_fname" id="formFile">
    </div>
    <input class="btn btn-outline-success" type="submit" value="등록" style="margin-left: 620px; margin-top: 20px; size: 100px;">
</form>

</body>
</html>