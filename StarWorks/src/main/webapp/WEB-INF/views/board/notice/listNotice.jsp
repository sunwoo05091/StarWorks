<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<%@include file="/WEB-INF/views/includes/header.jsp"%>
  <!-- Bootstrap cdn 설정 -->  
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">  
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">  
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">  
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>  
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
/* .pageBox{
		width: 700px;
		margin-left: 330px;
		padding: 20px;
	}
	
		.searchBox{
		margin-left: 500px;
	} */
	.table table-hover{
		margin-right: 100px;
	
	}
	
}
</style>


</head>



<!-- <body background="ECF1F8"> -->


<ul class="nav nav-pills flex-column">
	<li>
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
					<div>${d_name }부서</div>
					<div>${emp.grade }${emp.name }님</div>
				</div>
			</div>
		</div>
	</li>
	<li class="nav-item"><a class="nav-link active"
		href="/board/notice/listNotice">공지사항</a></li>

	<li class="nav-item"><a class="nav-link"
		href="listReferenceroomAction.do">자료실</a></li>

	<li class="nav-item"><a class="nav-link"
		href="/meetingroom/meetingroom">회의실</a></li>



</ul>
<ol class="breadcrumb">
	<li class="breadcrumb-item"><a href="/testGit/Login/mainAction.do">홈</a></li>
	<li class="breadcrumb-item"><a href="/board/notice/listNotice">공지사항</a></li>
</ol>

<!-- <div class="container"> -->


<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<button id='regBtn' type="button" class="badge bg-success"
					style="margin-left: 1290px;">글쓰기</button>
			</div>

			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-hover" style="margin-right: 400px;">
					<thead>
						<tr class="table-dark">
							<th>글번호</th>
							<th>제목</th>
							<th>사원번호</th>
							<th>작성일</th>
						</tr>
					</thead>

					<c:forEach items="${list}" var="board">
						<tr class="table-light">
							<td><c:out value="${board.b_no}" /></td>
							<%-- 							<td><a class='move' href='<c:out value="${board.b_no}"/>'></a>
							<c:out value="${board.b_title}" /> --%>
							<td><a class='move' href='<c:out value="${board.b_no}"/>'>
									<c:out value="${board.b_title}" />
							</a></td>
							<td><c:out value="${board.e_no}" /></td>
							<%-- <td><c:out value="${board.b_date}" /></td> --%>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.b_date}" /></td>
						</tr>
					</c:forEach>
				</table>

				<div class='row'>
					<div class="col-lg-12">

						<form id='searchForm' action="/board/notice/listNotice"
							method='get' style="margin-left: 220px;">
							<select name='type'>
								<option value=""
									<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>사원번호</option>
								<option value="TC"
									<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목
									or 내용</option>
								<option value="TW"
									<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목
									or 사원번호</option>
								<option value="TWC"
									<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목
									or 내용 or 사원번호</option>
							</select> <input type='text' name='keyword'
								value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
								type='hidden' name='pageNum'
								value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
								type='hidden' name='amount'
								value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-default'>Search</button>
						</form>
					</div>
				</div>


				<div class='pull-right'>
					<ul class="pagination">



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


					</ul>
				</div>
				<!--  end Pagination -->
			</div>

			<form id='actionForm' action="/board/notice/listNotice" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

				<input type='hidden' name='type'
					value='<c:out value="${ pageMaker.cri.type }"/>'> <input
					type='hidden' name='keyword'
					value='<c:out value="${ pageMaker.cri.keyword }"/>'>


			</form>

			<!-- Modal  추가 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="myModalLabel">Modal title</h4>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-bs-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save
								changes</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->


		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>



<!-- <a id="regBtn" class="badge bg-success" style="margin-left: 1450px;">글쓰기</a> -->






<!-- </div> -->

<!-- </body> -->
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

							self.location = "/board/notice/registerNotice";

						});

						var actionForm = $("#actionForm");

						$(".paginate_button a").on(
								"click",
								function(e) {

									e.preventDefault();

									console.log('click');

									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit();
								});

						$(".move")
								.on(
										"click",
										function(e) {
											e.preventDefault();
											actionForm
													.append("<input type='hidden' name='b_no' value='"
															+ $(this).attr(
																	"href")
															+ "'>");
											actionForm.attr("action",
													"/board/notice/getNotice");
											actionForm.submit();

										});

						var searchForm = $("#searchForm");

						$("#searchForm button").on(
								"click",
								function(e) {

									if (!searchForm.find("option:selected")
											.val()) {
										alert("검색종류를 선택하세요");
										return false;
									}

									if (!searchForm.find(
											"input[name='keyword']").val()) {
										alert("키워드를 입력하세요");
										return false;
									}

									searchForm.find("input[name='pageNum']")
											.val("1");
									e.preventDefault();

									searchForm.submit();

								});

					});
</script>


</html>


