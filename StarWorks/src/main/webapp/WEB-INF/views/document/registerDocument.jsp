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
.row {
	width: 800px;
	height: 200px;
	padding: 10px;
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
					onclick="location.href='listDocumentSignProgress'">결재 진행 문서함</a> <a
					class="dropdown-item" href="#"
					onclick="location.href='listDocumentSignComplete'">결재 완료 문서함</a> <a
					class="dropdown-item" href="#"
					onclick="location.href='listDocumentSignCompanion'">반려 문서함</a> <a
					class="dropdown-item" href="#"
					onclick="location.href='listDocumentSignCompleteDepartment'">부서
					문서함</a>
			</div></li>
	</ul>

	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a
			href="/testGit/Login/mainAction.do">메인페이지</a></li>
	</ol>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">

				<!-- panel-body -->
				<div class="panel-body">

					<form role="form" action="/document/registerDocument" method="post">
						<div class="form-group">
							<label>제목</label> <input class="form-control" name='dc_title'>
						</div>
						<br>

						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" rows="3" name='dc_contents'></textarea>
						</div>
						<br>

						<div class="form-group">
							<label>마감일</label>
							<p>
								<input class="form-control" type="date" name='dc_date_end' />
							</p>
						</div>
						<br>

						<div class="form-group">
							<label>기안자</label> <input class="form-control" name='dc_drafter'>
						</div>
						<br>

						<!-- 결재선 팝업 -->
						<input id='signAddBtn' type="button" class="btn btn-xs pull-right"
							name="" value="결재선 추가" style="margin-left: 620px;"><br>

						<div class="form-group">
							<label>결재자</label> <input class="form-control"
								name='dsi_approver'>
						</div>
						<br>

						<div class="form-group">
							<label>합의자</label> <input class="form-control"
								name='dsi_consensus'>
						</div>
						<br>

						<div class="form-group">
							<label>참조자</label> <input class="form-control"
								name='idsi_referrer'>
						</div>
						<br>

						<div class="form-group">
							<label>시행자</label> <input class="form-control"
								name=idsi_implementer>
						</div>
						<br>

						<div class="form-group">
							<label>문서상태</label> <input class="form-control" name='dc_state'
								value='<c:out value="결재중"/>'>
						</div>
						<br>

						<div class="form-group">
							<label>파일</label>
						</div>
						<div class="panel-body">
							<div class="form-group uploadDiv">
								<input type="file" name='uploadFile' multiple>
								<!-- 파일을 첨부하는 곳 -->
							</div>

							<!-- 파일 업로드한 결과를 처리하는 부분 ul 태그 -->
							<div class='uploadResult'>
								<ul>

								</ul>
							</div>
						</div>

						<button type="submit" class="btn btn-default">등록</button>
						<button type="reset" class="btn btn-default">초기화</button>

					</form>
					<br>

				</div>
				<!--  end panel-body -->

			</div>
			<!--  end panel-body -->
		</div>
		<!-- end panel -->
	</div>
	<!-- /.row -->

</body>

<script>

	window.onload = function() {
		document.getElementById("signAddBtn").onclick = function() {
			window
					.open("listDocumentSign", "_blank",
							"height=700, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no;");
		}

	};
	
</script>

<script>
	$(document)
			.ready(
					function(e) {

						// submit button 클릭에 대한 첨부파일 처리 및 게시물 등록과 DB 처리
						var formObj = $("form[role='form']");

						$("button[type='submit']")
								.on(
										"click",
										function(e) {

											e.preventDefault();

											console.log("submit clicked");

											var str = "";

											$(".uploadResult ul li")
													.each(
															function(i, obj) { // 파일 2개를 업로드하면, li가 2개 생긴다	< 파일 하나 당 input type='hidden'가 하나씩 생긴다. >

																var jobj = $(obj);

																console
																		.dir(jobj);
																console
																		.log("-------------------------");
																console
																		.log(jobj
																				.data("filename"));

																// li의 개수에 따라 늘어난다. < bno가 빠져 있다. p567에 보면 그래서 attach.setBno(board getBno());를 해줘서 글번호를 찾아준다. >
																// name='attachList["+i+"]은 BoardVO에서 attachList라는 이름의 변수로 첨부파일의 정보를 수집하기 때문에 인덱스번호로 한다.
																str += "<input type='hidden' name='attachList["
																		+ i
																		+ "].fileName' value='"
																		+ jobj
																				.data("filename")
																		+ "'>";
																str += "<input type='hidden' name='attachList["
																		+ i
																		+ "].uuid' value='"
																		+ jobj
																				.data("uuid")
																		+ "'>";
																str += "<input type='hidden' name='attachList["
																		+ i
																		+ "].uploadPath' value='"
																		+ jobj
																				.data("path")
																		+ "'>";
																str += "<input type='hidden' name='attachList["
																		+ i
																		+ "].fileType' value='"
																		+ jobj
																				.data("type")
																		+ "'>";

															});

											console.log(str);

											formObj.append(str).submit(); // submit하면 input type='hidden'가 모두 append 되어진다 
											//  즉, List<BoardAttachVO> attachList에 들어간다.
										});

						// 파일 확장자 및 크기를 제한하는 코드
						var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
						var maxSize = 5242880; //5MB

						function checkExtension(fileName, fileSize) {

							if (fileSize >= maxSize) {
								alert("파일 사이즈 초과");
								return false;
							}

							if (regex.test(fileName)) {
								alert("해당 종류의 파일은 업로드할 수 없습니다.");
								return false;
							}
							return true;
						}

						// 파일 업로드 코드 < input[type='file']의 내용으로 변경되는 것을 감지하도록 처리 >
						$("input[type='file']")
								.change(
										function(e) { // 파일을 선택했을 때, change 이벤트가 발생하면

											var formData = new FormData();

											var inputFile = $("input[name='uploadFile']");

											var files = inputFile[0].files;

											for (var i = 0; i < files.length; i++) {

												if (!checkExtension(
														files[i].name,
														files[i].size)) {
													return false;
												}
												formData.append("uploadFile",
														files[i]); // 모든 파일을 선택

											}

											$.ajax({
												url : '/uploadAjaxAction',
												processData : false,
												contentType : false,
												data : formData,
												type : 'POST',
												dataType : 'json',
												success : function(result) {
													console.log(result);
													showUploadResult(result); //업로드 결과 처리 함수 

												}
											}); //$.ajax

										});

						// 업로드한 결과를 화면에 썸네일을 만들어거 처리
						function showUploadResult(uploadResultArr) {

							if (!uploadResultArr || uploadResultArr.length == 0) {
								return;
							}

							var uploadUL = $(".uploadResult ul");

							var str = "";

							// 일반 파일과 이미지 파일의 경우 화면에 보여지는 것을 표현하는 코드
							$(uploadResultArr)
									.each(
											function(i, obj) {

												// 파일 업로드할 때마다 각 파일에 대하여 li 태그가 생성된다.		< 게시물 등록과 첨부파일 DB 처리한 것 >
												//	 게시물 등록은 form태그에서 이루어지므로, 이미 업로드된 파일 정보는 input type='hidden'에서 처리한다.
												// 첨부파일 정보를 태그로 생성할 때, 다음과 같은 첨부파일과 관련된 정보를 추가한다. < data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'" >
												if (obj.image) {
													var fileCallPath = encodeURIComponent(obj.uploadPath
															+ "/s_"
															+ obj.uuid
															+ "_"
															+ obj.fileName);
													str += "<li data-path='"+obj.uploadPath+"'";		// 생성된 li태그에 대한 data-path
			str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
			str +" ><div>";
													str += "<span> "
															+ obj.fileName
															+ "</span>";
													str += "<button type='button' data-file=\'"+fileCallPath+"\' "
			str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
													str += "<img src='/display?fileName="
															+ fileCallPath
															+ "'>";
													str += "</div>";
													str + "</li>";
												} else {
													var fileCallPath = encodeURIComponent(obj.uploadPath
															+ "/"
															+ obj.uuid
															+ "_"
															+ obj.fileName);
													var fileLink = fileCallPath
															.replace(
																	new RegExp(
																			/\\/g),
																	"/");

													str += "<li "
			str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
													str += "<span> "
															+ obj.fileName
															+ "</span>";
													str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
			str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
													str += "<img src='/resources/img/attach.png'></a>";
													str += "</div>";
													str + "</li>";
												}

											});

							uploadUL.append(str);
						}

						// 첨부파일의 변경 처리 (x 모양의 아이콘을 클릭하면, 서버에서 삭제하는 이벤트 발생)		< 삭제를 하려면, 업로드한 파일의 경로와 uuid가 포함된 파일의 이름이 필요하다 > 
						$(".uploadResult").on("click", "button", function(e) {

							console.log("delete file");

							var targetFile = $(this).data("file"); // 클릭한 파일
							var type = $(this).data("type"); // 클릭한 파일의 타입

							var targetLi = $(this).closest("li"); // 클릭한 파일의 생성된 li

							$.ajax({
								url : '/deleteFile',
								data : {
									fileName : targetFile,
									type : type
								},
								dataType : 'text',
								type : 'POST',
								success : function(result) {
									alert(result);

									targetLi.remove();
								}
							}); //$.ajax
						});

					}); // document
</script>

</html>