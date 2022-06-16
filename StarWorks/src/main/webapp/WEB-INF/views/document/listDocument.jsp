<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>StarWorks</title>

<%@include file="/WEB-INF/views/includes/header.jsp"%>

<style type="text/css">
.table {
	width: 800px;
	height: 200px;
}

.col-lg-12 {
	margin-left: 320px;
}

.pull-right {
	width: 700px;
	margin-left: 250px;
	padding: 20px;
}

</style>

</head>
<body onload = "printClock()">
	
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
    <a class="nav-link active" href="#">전자결재</a>
      <li class="nav-item">
    <a class="nav-link" href="#" onclick="location.href='registerDocument'">문서 작성</a>
    <a class="nav-link" href="#" onclick="location.href='listDocument'">문서 조회</a>
  </li>
  <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">문서함</a>
    <div class="dropdown-menu"> 
      <a class="dropdown-item" href="#" onclick="location.href='listDocumentSignProgress'">결재 진행 문서함</a>
      <a class="dropdown-item" href="#" onclick="location.href='listDocumentSignComplete'">결재 완료 문서함</a>
      <a class="dropdown-item" href="#" onclick="location.href='listDocumentSignCompanion'">반려 문서함</a>
      <a class="dropdown-item" href="#" onclick="location.href='listDocumentSignCompleteDepartment'">부서 문서함</a>
    </div>
  </li>
</ul>
<ol class="breadcrumb">
  <li class="breadcrumb-item"><a href="/testGit/Login/mainAction.do">메인페이지</a></li>
</ol>

	<!-- 테이블 부분 -->
	<div class="panel-body">
		<!-- 		<table class="table table-hover" style="position: relative; margin: auto;"> -->
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr  class="table-dark">
					<th scope="col" style="text-align: center">문서번호</th>
					<th scope="col" style="text-align: center">제목</th>
					<th scope="col" style="text-align: center">기안자</th>
					<th scope="col" style="text-align: center">기안일</th>
					<th scope="col" style="text-align: center">마감일</th>
					<th scope="col" style="text-align: center">상태</th>
				</tr>
			</thead>
			
				<c:forEach items="${list}" var="document">
            		<tr style="text-align: center;">
             			<td style="width: 100px; height: 20px; " ><a class='move' href='<c:out value="${document.dc_no}" />'><c:out value="${document.dc_no}" /></a></td>
               			<td><c:out value="${document.dc_title}"/></td>
              			<td><c:out value="${document.dc_drafter}" /></td>
             			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${document.dc_date_start}" /></td>
             			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${document.dc_date_end}" /></td>
                 		<td><c:out value="${document.dc_state}" /></td>                	
           		  </tr>
          		</c:forEach>
				</table>
<!-- 			</div> -->

		<!-- 검색 관련 코드 -->
		<div class='row'>
			<div class="col-lg-12">

				<form id='searchForm' action="/document/listDocument" method='get'>
					<select name='type'>
						<!-- Criteria.java의 getTypeArr() 메서드 부분 -->
						<option value=""
							<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>종류
							선택</option>
						<option value="N"
							<c:out value="${pageMaker.cri.type eq 'N'?'selected':''}"/>>문서번호</option>
						<option value="T"
							<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
						<option value="C"
							<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
						<option value="W"
							<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
						<option value="TC"
							<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목
							or 내용</option>
						<option value="TW"
							<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목
							or 작성자</option>
						<option value="TWC"
							<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목
							or 내용 or 작성자</option>
					</select> <input type='text' name='keyword' placeholder="검색어를 입력"
						value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
						type='hidden' name='pageNum'
						value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
						type='hidden' name='amount'
						value='<c:out value="${pageMaker.cri.amount}"/>' />
					<button class='btn'>Search</button>
				</form>
			</div>
		</div>

		<!-- 페이징 처리 부분 -->
	<div class='pull-right'>
		<ul class="pagination">

			<c:if test="${pageMaker.prev}">
				<li class="paginate_button previous"><a
					href="${pageMaker.startPage -1}">[이전]</a></li>
			</c:if>

			<c:forEach var="num" begin="${pageMaker.startPage}"
				end="${pageMaker.endPage}">
				<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
					<a class="page-link" href="${num}">[${num}]</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next}">
				<li class="paginate_button next"><a
					href="${pageMaker.endPage +1 }">[다음]</a></li>
			</c:if>
		</ul>
	</div>

	<!-- 페이징 이동 액션 -->
	<form id='actionForm' action="/document/listDocument" method='get' >
		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
		<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
	</form>
	</div>

	<!-- Modal  추가 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Modal title</h4>
				</div>
				<div class="modal-body">처리가 완료되었습니다.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

</body>




<!-- 버튼에 따른 자바스크립트 이벤트 처리 -->
	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							var result = '<c:out value="${result}"/>';

							checkModal(result);

							history.replaceState({}, null, null);

							function checkModal(result) {

								if (result === '' || history.state) {
									return;
								}

								if (parseInt(result) > 0) {
									$(".modal-body").html(
											"게시글 " + parseInt(result)
													+ " 번이 등록되었습니다.");
								}

								$("#myModal").modal("show");
							}

							$("#regBtn").on("click", function() {

								self.location = "/document/registerDocument";

							});

							var actionForm = $("#actionForm");

							$(".paginate_button a").on(
									"click",
									function(e) {

										e.preventDefault();

										console.log('click');

										actionForm
												.find("input[name='pageNum']")
												.val($(this).attr("href"));
										actionForm.submit();
									});

							$(".move")
									.on(
											"click",
											function(e) {

												e.preventDefault();
												actionForm
														.append("<input type='hidden' name='dc_no' value='"
																+ $(this).attr(
																		"href")
																+ "'>");
												actionForm.attr("action", "/document/getDocument");
												actionForm.submit();

											});

							var searchForm = $("#searchForm");

							$("#searchForm button")
									.on(
											"click",
											function(e) {

												if (!searchForm
														.find(
														"option:selected")
														.val()) {
													alert("검색종류를 선택하세요");
													return false;
												}

												if (!searchForm
														.find(
																"input[name='keyword']")
														.val()) {
													alert("키워드를 입력하세요");
													return false;
												}

												searchForm
														.find(
																"input[name='pageNum']")
														.val("1");
												e.preventDefault();

												searchForm.submit();

											});

						});
	</script>

</html>