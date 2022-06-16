<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Resource/CSS/schedule.css"
	type="text/css">
<link rel="stylesheet" href="/Resource/CSS/bootstrap.min.css" type="">
<%@include file="/WEB-INF/views/includes/header.jsp"%>
<style type="text/css">
#a {
	width: 500px;
	height: 32px;
	font-size: 15px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: rgb(233, 233, 233);
}

input[type=submit] {
	background-color: #FF5A5F;
	color: white;
	width: 70px;
	height: 45px;
	font-size: 15px;
	font-weight: 700;
	border-radius: 6px;
	border: 0;
	outline: 0;
}

#header {
	border: 1px solid #d2d2d2;
	background-color: #d2d2d2;
	border-radius: 16px;
	box-shadow: inset 0 0 8px #d2d2d2;
	width: 160px;
	height: 160px;
}

#text {
	resize: none;
	border: none;
	margin-left: 35px;
	margin-top: 15px;
}
}
</style>
</head>
<ul class="nav nav-pills flex-column" style="position: absolute;">
	<div class="card bg-light mb-3" style="max-width: 20rem;">
		<div class="card-body">
			<svg xmlns="http://www.w3.org/2000/svg"
				class="d-block user-select-none" width="100%" height="130"
				aria-label="Placeholder: Image cap" focusable="false" role="img"
				preserveAspectRatio="xMidYMid slice" viewBox="0 0 318 180"
				style="font-size: 1.125rem; text-anchor: middle">
    			<rect width="100%" height="100%" fill="#868e96"></rect>
    			<text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text>
  			</svg>
			<br>
			<div class="card-text">
				<div>인사 부서</div>
				<div>${emp.grade }${emp.name }님</div>
			</div>
		</div>
	</div>
	<li class="nav-item"><a class="nav-link active" href="schedule">개인
			일정</a></li>
	<li class="nav-item"><a class="nav-link" href="insertForm.do">일정
			생성</a></li>
	<li class="nav-item"><a class="nav-link" href="listAction">일정
			조회</a>
		<hr style="border: solid 1px gray;">
	<li>분류별 일정</li>
	<br>
	<li style="text-decoration: none;"><a
		href="TypeScheduleAction.do?s_type=1" id="tag">- 개인</a></li>
	<br>
	<li style="text-decoration: none;"><a
		href="TypeScheduleAction.do?s_type=2" id="tag">- 미팅</a></li>
	<br>
	<li style="text-decoration: none;"><a
		href="TypeScheduleAction.do?s_type=3" id="tag">- 회의</a></li>
	<br>
</ul>

<ol class="breadcrumb">
	<li class="breadcrumb-item"><a href="moveSchedule.do" id="tag">홈</a></li>
	<li class="breadcrumb-item"><a href="insertForm.do" id="tag">일정
			생성</a></li>
	<li class="breadcrumb-item active"><a href="listAction.do"
		id="tag">전체 조회<a></a></li>
</ol>
<!-- <div id="header" style="border: 1px solid;width: 700px; height: 500px;margin-left: 450px; margin-top: 50px;
padding-left: 10px;padding-top: 30px">
<form action="insertSchedule" method="post">
	<input type="submit" value="저장" class="submit" style="margin-left: 600px; margin-bottom: 200px; position: absolute;">
	제목 : <input type="text" name="s_title" id="a"><br><br>
	기간 : <input type="date" name="s_startday" style=" border-radius: 10px; border-color:#d2d2d2;"> ~ <input type="date" name="s_finishday" style=" border-radius: 10px;border-color:#d2d2d2;">
	진행 : <select name="situation">
			<option>선택</option>
			<option value="진행">진행중
			</option>
			<option value="완료">완료</option>
			<option value="보류">보류</option>	
		 </select>
	종류 : <select name="s_type">
			<option>선택</option>
			<option value="개인">개인
			</option>
			<option value="미팅">미팅</option>
			<option value="회의">회의</option>	
		 </select>
	<br><br>
	<textarea rows="10" cols="70" name="s_contents" id="text"></textarea><br>
</form>
</div> -->
<div class="container"
	style="width: 700px; height: 500px; margin-left: 450px; margin-top: 50px; padding-left: 10px; padding-top: 30px">
	<h1>일정 메모</h1>
	<form action="insertSchedule" method="post">
		<div class="mb-3">
			<label class="form-label">제목</label> <input type="text"
				class="form-control" id="" name="s_title">
		</div>
		기간 : <input type="date" name="s_startday"
			style="border-radius: 10px; border-color: #d2d2d2;"> ~ <input
			type="date" name="s_finishday"
			style="border-radius: 10px; border-color: #d2d2d2;"> 진행 : <select
			name="situation">
			<option>선택</option>
			<option value="진행">진행중</option>
			<option value="완료">완료</option>
			<option value="보류">보류</option>
		</select> 종류 : <select name="s_type">
			<option>선택</option>
			<option value="개인">개인</option>
			<option value="미팅">미팅</option>
			<option value="회의">회의</option>
		</select> <br>
		<br>
		<div class="mb-3">
			<label class="form-label">메모</label>
			<textarea class="form-control" rows="5" cols="" name="s_contents"></textarea>
		</div>

		<input type="submit" value="저장">
	</form>
</div>

<script src="/Resource/CSS/jquery.min.js"></script>
<script src="/Resource/CSS/bootstrap.min.js"></script>

</body>
</html>