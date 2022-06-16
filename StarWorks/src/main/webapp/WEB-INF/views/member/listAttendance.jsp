<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/includes/header.jsp"%>

</head>
<body>
	<div id="container2">
		<div class="tableitem tableitem1">
			<ul class="nav nav-pills flex-column">
				<li class="nav-item"><a class="nav-link" href="/member/mypage">개인
						정보 수정</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="/member/listAttendance">근태 기록</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/member/listAnnualleave">연차 기록</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/member/listPaystub">급여 명세서</a></li>
				<li class="nav-item"><a class="nav-link" href="/member/listPhoneBook">주소록</a>
				</li>
			</ul>
		</div>
		<div class="tableitem tableitem2" style="min-width: 980px;">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/">홈</a></li>
				<li class="breadcrumb-item"><a href="/member/mypage">마이페이지</a></li>
				<li class="breadcrumb-item active">근태 기록</li>
			</ol>
			<h1 style="border-bottom:1px solid #ddd;">근태 기록</h1>
			<table class="table table-hover">
				<thead>
					<tr class="table-dark">
						<td>일자</td>
						<td>출근 시간</td>
						<td>퇴근 시간</td>
						<td>근무 시간</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="attendance" items="${list }">
						<tr class="table-light">
							<td>
							<fmt:parseDate var ="dt" value="${attendance.a_date }" pattern = "yy-MM-dd HH:mm:ss"></fmt:parseDate>
							<fmt:formatDate value="${dt }" pattern="yy/MM/dd"/></td>
							<td>${attendance.a_checkin }</td>
							<td>${attendance.a_checkout }</td>
							<td>${worktime }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div>
<%-- 				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li class="paginate_button previous"><a
							href="${pageMaker.startPage -1}">Previous</a></li>
					</c:if>

					<c:forEach var="num" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}">
						<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
							<a href="${num}">${num}</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next}">
						<li class="paginate_button next"><a
							href="${pageMaker.endPage +1 }">Next</a></li>
					</c:if>
				</ul> --%>
			</div>
		</div>
	</div>
</body>
<%@include file="/WEB-INF/views/includes/footer.jsp"%>
</html>