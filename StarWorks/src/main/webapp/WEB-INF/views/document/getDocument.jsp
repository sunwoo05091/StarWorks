<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	width: 700px;
	margin-left: 5px;
	padding: 20px;
}

.pull-right {
	width: 700px;
	margin-left: 250px;
	padding: 20px;
}
</style>

</head>
<body onload="printClock()">

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
		<li class="nav-item"><a class="nav-link active" href="#">전자결재</a>
		<li class="nav-item"><a class="nav-link" href="#"
			onclick="location.href='registerDocument'">문서 작성</a> <a
			class="nav-link" href="#" onclick="location.href='listDocument'">문서
				조회</a></li>
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true"
			aria-expanded="false">문서함</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="#"
					onclick="location.href='listDocumentSignProgressAction'">결재 진행
					문서함</a> <a class="dropdown-item" href="#"
					onclick="location.href='listDocumentSignCompleteAction'">결재 완료
					문서함</a> <a class="dropdown-item" href="#"
					onclick="location.href='listDocumentSignCompanionAction.do'">반려
					문서함</a> <a class="dropdown-item" href="#"
					onclick="location.href='listDocumentSignCompleteDepartmentAction'">부서
					문서함</a>
			</div></li>
	</ul>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a
			href="/testGit/Login/mainAction.do">메인페이지</a></li>
	</ol>

	<!-- 상세보기 -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">

				<div class="panel-body">

					<div class="form-group">
						<label>문서번호</label> <input class="form-control" name='dc_no'
							value='<c:out value="${document.dc_no }"/>' readonly="readonly">
					</div>
					<br>

					<div class="form-group">
						<label>제목</label> <input class="form-control" name='dc_title'
							value='<c:out value="${document.dc_title }"/>'
							readonly="readonly">
					</div>
					<br>

					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="5" name='dc_contents'
							readonly="readonly"><c:out
								value="${document.dc_contents}" /></textarea>
					</div>
					<br>

					<div class="form-group">
						<label>기안일</label> <input class="form-control"
							name='dc_date_start'
							value='<fmt:formatDate pattern="yyyy-MM-dd" value="${document.dc_date_start}" />'
							readonly="readonly">
					</div>
					<br>

					<div class="form-group">
						<label>결재일</label> <input class="form-control" name='dsi_date'
							value='<fmt:formatDate pattern="yyyy-MM-dd" value="${document.dsi_date}" />'
							readonly="readonly">
					</div>
					<br>

					<div class="form-group">
						<label>마감일</label> <input class="form-control" name='dc_date_end'
							value='<fmt:formatDate pattern="yyyy-MM-dd" value="${document.dc_date_end }"/>'
							readonly="readonly">
					</div>
					<br>

					<div class="form-group">
						<label>결재자</label> <input class="form-control" name='dsi_approver'
							value='<c:out value="${document.dsi_approver }"/>'
							readonly="readonly">
					</div>
					<br>

					<div class="form-group">
						<label>합의자</label> <input class="form-control"
							name='dsi_consensus'
							value='<c:out value="${document.dsi_consensus }"/>'
							readonly="readonly">
					</div>
					<br>

					<div class="form-group">
						<label>참조자</label> <input class="form-control"
							name='idsi_referrer'
							value='<c:out value="${document.idsi_referrer }"/>'
							readonly="readonly">
					</div>
					<br>

					<div class="form-group">
						<label>시행자</label> <input class="form-control"
							name='idsi_implementer'
							value='<c:out value="${document.idsi_implementer }"/>'
							readonly="readonly">
					</div>
					<br>

					<div class='bigPictureWrapper'>
						<!-- 원본 이미지를 보여주는 부분 -->
						<div class='bigPicture'></div>
					</div>

					<div class="form-group">
						<label>파일</label>
					</div>
					<div class="panel-body">

						<!-- 파일 업로드한 결과를 처리하는 부분 ul 태그 -->
						<div class='uploadResult'>
							<ul>

							</ul>
						</div>
					</div>

					<!-- 조회에서 수정 및 목록으로 이동하는 a 태그 -->
					<button data-oper='modifyDocument' class="btn btn-default">
						<a
							href="/document/modifyDocument?dc_no=<c:out value="${document.dc_no}"/>">수정</a>
					</button>
					<button data-oper='listDocument' class="btn btn-info">
						<a href="/document/listDocument">목록</a>
					</button>

				</div>
				<!--  end panel-body -->

			</div>
			<!--  end panel-body -->
		</div>
		<!-- end panel -->
	</div>
	<!-- /.row -->

</body>


<script type="text/javascript">
	$(document).ready(function() {

		var operForm = $("#operForm");

		$("button[data-oper='modifyDocument']").on("click", function(e) {

			operForm.attr("action", "/document/modifyDocument").submit();

		});

		$("button[data-oper='listDocument']").on("click", function(e) {

			operForm.find("#bno").remove();
			operForm.attr("action", "/document/listDocument")
			operForm.submit();

		});
	});
</script>

<script>
	// 게시물 조회 화면 처리(p570)
	$(document)
			.ready(
					function() {

						(function() {

							var dc_no = '<c:out value="${document.dc_no}"/>';

							// 첨부파일의 데이터를 가져와서 이미지를 보여주는 이벤트(데이터와 이미지 보여줌)
							$
									.getJSON(
											"/document/getAttachList",
											{
												dc_no : dc_no
											},
											function(arr) {

												console.log(arr);

												var str = "";

												$(arr)
														.each(
																function(i,
																		attach) {

																	//image type
																	if (attach.fileType) { // 업로드한 파일의 fileType에 대하여 arr의 정보에 따라 if문이 돌아간다.
																		var fileCallPath = encodeURIComponent(attach.uploadPath
																				+ "/s_"
																				+ attach.uuid
																				+ "_"
																				+ attach.fileName);

																		str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
																		str += "<img src='/display?fileName="
																				+ fileCallPath
																				+ "'>"; // 이미지에는 /display 컨트롤러를 사용한다.
																		str += "</div>";
																		str
																				+ "</li>";
																	} else {

																		str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
																		str += "<span> "
																				+ attach.fileName
																				+ "</span><br/>";
																		str += "<img src='/resources/img/attach.png'></a>";
																		str += "</div>";
																		str
																				+ "</li>";
																	}
																});

												$(".uploadResult ul").html(str); // uploadResult의 ul태그에 대하여

											});//end getjson

						})();//end function

						// 첨부파일 클릭 시 이미지파일은 화면에서 원본 이미지를 보여주고, 일반파일은 다운로드 이벤트 처리
						$(".uploadResult").on(
								"click",
								"li",
								function(e) { // 이벤트 위임 : li

									console.log("view image");

									var liObj = $(this);

									var path = encodeURIComponent(liObj
											.data("path")
											+ "/"
											+ liObj.data("uuid")
											+ "_"
											+ liObj.data("filename"));

									if (liObj.data("type")) {
										showImage(path.replace(
												new RegExp(/\\/g), "/"));
									} else {

										//download 
										self.location = "/download?fileName="
												+ path
									}

								});

						// 해당 이미지의 경로를 보여주는 역할을 한다. (화면에서 클릭 시 이미지가 커지고, 닫아진다.)
						function showImage(fileCallPath) {

							alert(fileCallPath);

							// 원본 이미지 확대
							$(".bigPictureWrapper").css("display", "flex")
									.show();

							$(".bigPicture").html(
									"<img src='/display?fileName="
											+ fileCallPath + "' >").animate({
								width : '100%',
								height : '100%'
							}, 1000);

						}

						// 원본 이미지 창 닫기
						$(".bigPictureWrapper").on("click", function(e) {
							$(".bigPicture").animate({
								width : '0%',
								height : '0%'
							}, 1000);
							setTimeout(function() {
								$('.bigPictureWrapper').hide(); // hide();으로 div를 감춘다. (이거 안하면 겹쳐서 뜬다.)
							}, 1000);
						});

					});
</script>

</html>