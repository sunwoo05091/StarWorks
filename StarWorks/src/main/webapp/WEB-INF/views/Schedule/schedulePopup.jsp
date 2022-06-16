<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 추가</title>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- datepicker -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- custom -->
<link href='/resources/CSS/schedule.css' rel='stylesheet' />
<script src='/resources/js/schedule.js?0606' type="text/javascript"></script>
<script src='/resources/js/test.js' type="text/javascript"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.1.4/js/bootstrap-datetimepicker.min.js"></script>
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.1.4/css/bootstrap-datetimepicker.min.css">
</head>
<body>
	<div class="group" id="popupGroup">
		<div class="group-head">
			<h1 class="zTree-h1">일정 추가</h1>
		</div>
		<div class="group-body">
			<form id="scheduleData">
				<div class="top">
					<input class="subject" id="subject" type="text" name="s_title"
						placeholder="제목을 입력해주세요">
				</div>
				<div class="domain">
					<h3 class="zTree-h3">시작</h3>
				</div>
				<div class="domain">
					<input class="date" id="startDate" type="text" name="s_startday"
						id="startDate">
				</div>
				<div class="domain">
					<h3 class="zTree-h3">종료</h3>
				</div>
				<div class="domain">
					<input class="date" id="endDate" type="text" name="s_finishday"
						id="endDate">
					<div class="domain">
						진행 <select name="situation">
							<option>선택</option>
							<option value="진행">진행중</option>
							<option value="완료">완료</option>
							<option value="보류">보류</option>
						</select>
					</div>
					<br>
					<div>
						종류 <select name="s_type">
							<option>선택</option>
							<option value="개인">개인</option>
							<option value="미팅">미팅</option>
							<option value="회의">회의</option>
						</select>
					</div class="domain">
					<div class="domain">
						<h3 class="zTree-h3">메모</h3>
					</div>
					<div class="domain">
						<textarea class="memo" id="memo" name="s_contents" rows="5"
							cols="20" placeholder="100글자까지 입력 가능합니다"></textarea>
					</div>
			</form>
			<button class="ok-button" type="button" onclick="click_ok()">확인</button>
		</div>



	</div>
</body>
</html>