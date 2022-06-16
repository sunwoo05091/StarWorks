<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Upload with Ajax</h1>


<!-- css 부분 -->
	<style>
.uploadResult {
	width: 100%;
	background-color: gray;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 100px;
}
</style>

<style>
.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
}

.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}
</style>



<div class='bigPictureWrapper'>
  <div class='bigPicture'>
  </div>
</div>

	<!-- 파일 선택하는 화면 처리 부분 -->
	<div class='uploadDiv'>
		<input type='file' name='uploadFile' multiple>
	</div>

	<div class='uploadResult'>
		<!-- ul 태그는 첨부파일 이름을 목록으로 처리하는 구역이다. -->
		<ul>

		</ul>
	</div>

	<!-- 파일 업로드 클릭하는 화면 처리 부분 -->
	<button id='uploadBtn'>Upload</button>

	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>



	<!-- 이곳이 에이작스 자바스크립트.. 400줄 완벽해석 목표 -->
	<script>
	$(document).ready(function(){		// 실행되면 바로 처음에 실행하는 부분
		
		// 파일 업로드 버튼 이벤트
		$("#uploadBtn").on("click", function(e){
		
		var cloneObj = $(".uploadDiv").clone();	// 업로드하고 다시 초기 페이지로(기존의 uploadDiv를 복사)
		
		var formData = new FormData();		// formData 객체 생성
		
		var inputFile = $("input[name='uploadFile']");		// input태그를 사용하여 uploadFile(파일 이름)을 name에 넣는다.
		
		var files = inputFile[0].files;		// inputFile[0].files : 파일 하나만 올리는 것.
		
// 		console.log(files);		// 첫 번째 파일을 출력
		
		//add filedate to formdata
		for(var i = 0; i < files.length; i++){
			
			// 파일 확장자 및 크긴 제한
			if (!checkExtension(files[i].name, files[i].size)) {
				return false;
			}
		
		formData.append("uploadFile", files[i]);		// formData에 append를 하여 여러 개의 파일을 업로드 해준다.
		
		}
		
		// ajax를 이용한 파일 업로드 처리
// 		 $.ajax({
// 			 url: '/uploadAjaxAction',
// 			 processData: false,
// 			 contentType: false,
// 			 data: formData,
// 			 type: 'POST',
// 			 success: function(result){
// 			 alert("Uploaded");
// 			 }
// 			 }); //$.ajax
			
		// ajax를 이용한 파일 업로드 처리 및 업로드한 파일의 정보를 json 형태로 브라우저에 보내주기 위한 처리
		$.ajax({
			url : '/uploadAjaxAction',
			processData : false,
			contentType : false,
			data : formData,
			type : 'POST',
			dataType : 'json',
			success : function(result) {

				console.log(result);

				showUploadedFile(result);		// ajax 결과에는 showUploadedFile() 메서드에서 받은 json 데이터를 결과(파일 이름) 호출

				$(".uploadDiv").html(cloneObj.html());	// 파일 업로드하고, 파일 업로드 초기 화면으로 이동

			}
		}); //$.ajax
		
		// 일반 파일과 이미지를 삭제하기 위한 이벤트 처리
		$(".uploadResult").on("click","span", function(e){		// 이벤트 위임 : span
			   
			  var targetFile = $(this).data("file");
			  var type = $(this).data("type");
			  console.log(targetFile);
			  
			  $.ajax({
			    url: '/deleteFile',
			    data: {fileName: targetFile, type:type},
			    dataType:'text',
			    type: 'POST',
			      success: function(result){
			         alert(result);
			       }
			  }); //$.ajax
		
		}); // uploadBtn
	
		// 첨부파일 공격을 대비한 업로드 파일의 확장자 및 파일 크기 제한 코드
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880; //5MB

		function checkExtension(fileName, fileSize) {		// checkExtension 함수로 파일 이름(종류)와 크기를 판별

			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}

			if (regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;		// 그 이외에는 모두 true
		}
		 
		// 첨부파일의 파일 이름을 출력하는 이벤트
		var uploadResult = $(".uploadResult ul");		// uploadResult 부분의 ul태그에 제이쿼리

		function showUploadedFile(uploadResultArr) {		// uploadResultArr : json이 있다.

		 var str = "";

		 $(uploadResultArr).each(function(i, obj) {		// json을 $()를 이용하여 제이쿼리 객체로 변환하고, each문으로 obj(json에서 list값)을 i에 따라 가져온다.

		 str += "<li>" + obj.fileName + "</li>";		// json 데이터를 받아서 해당 파일의 이름을 str에 저장

		 });

		 uploadResult.append(str);		// uploadResult에 str값이 추가된다.
		 }
		
		// 일반 파일의 파일 아이콘 처리
// 		function showUploadedFile(uploadResultArr) {

// 			var str = "";

// 			$(uploadResultArr).each(			// uploadResultArr은 제이쿼리 객체로 변환한 json이다.
// 					function(i, obj) {

// 						if (!obj.image) {		// obj가 image가 아니라면?
// 							str += "<li><img src='/resources/img/attach.png'>"		// attach.png를 아이콘하고, 이름을 출력한다.
// 									+ obj.fileName + "</li>";
// 						} else {
// 							str += "<li>" + obj.fileName + "</li>";	// 이름만 출력한다.
// 						}
// 					});

// 			uploadResult.append(str);
// 		}
		
		// 일반 파일의 파일 아이콘 처리 및 이미지 파일의 썸네일을 보여주기 위한 이벤트 처리
// 		function showUploadedFile(uploadResultArr){
		    
// 		    var str = "";
		    
// 		    $(uploadResultArr).each(function(i, obj){
		      
// 		      if(!obj.image){
// 		        str += "<li><img src='/resources/img/attach.png'>"+obj.fileName+"</li>";
// 		      }else{
// 		        //str += "<li>"+ obj.fileName+"</li>";
		        
// 		        var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid+"_"+obj.fileName);
// 		        									// encodeURIComponent : get 방식으로 보낼 때, url에 한글이 있으면 깨지는걸 방지
// 		        									// obj.uploadPath : 업로드 된 파일 경로(p519 콘솔 참조(2022/05/25))
// 		        str += "<li><img src='/display?fileName="+fileCallPath+"'><li>";
// 		      }							 // 컨트롤러에 /display 요청
// 		    });
		    
// 		    uploadResult.append(str);
// 		  }
		
		
		// 일반 파일의 파일 아이콘 처리 및 이미지 파일의 썸네일을 보여주기 위한 이벤트 처리 및 업로드 된 파일을 다운로드 할 수 있게 이벤트 처리(일반 파일)
		function showUploadedFile(uploadResultArr){
		    
		    var str = "";
		    
		    $(uploadResultArr).each(function(i, obj){
		        
		        if(!obj.image){
		          
		          var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);
		          																		// 경로에는 폴더 경로 + uuid + 파일 이름이 들어간다.
		          str += "<li><a href='/download?fileName="+fileCallPath+"'>" 	// a 태그를 사용해서 다운로드한다.
		        		  +"<img src='/resources/img/attach.png'>"+obj.fileName+"</a></li>"
		        }else{
		          
		          var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
		          
		          str += "<li><img src='/display?fileName="+fileCallPath+"'><li>";
		        }
		    });
		    
		    uploadResult.append(str);
		  
		  }
		 
		// 일반 파일의 파일 아이콘 처리 및 이미지 파일의 썸네일을 보여주기 위한 이벤트 처리 및 업로드 된 파일을 다운로드 할 수 있게 이벤트 처리(일반 파일) 및 파일 삭제 처리(이미지는 썸네일도 같이 삭제)
		function showUploadedFile(uploadResultArr){
			 
			   var str = "";
			   
			   $(uploadResultArr).each(function(i, obj){
			     
			     if(!obj.image){
			       
			       var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);
			       
			       var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
			       
			       str += "<li><div><a href='/download?fileName="+fileCallPath+"'>"+
			           "<img src='/resources/img/attach.png'>"+obj.fileName+"</a>"+
			           "<span data-file=\'"+fileCallPath+"\' data-type='file'> x </span>"+
			           "<div></li>"
			           
			     }else{
			       
			       var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
			       
			       var originPath = obj.uploadPath+ "\\"+obj.uuid +"_"+obj.fileName;
			       
			       originPath = originPath.replace(new RegExp(/\\/g),"/");
			       
			       str += "<li><a href=\"javascript:showImage(\'"+originPath+"\')\">"+
			              "<img src='display?fileName="+fileCallPath+"'></a>"+
			              "<span data-file=\'"+fileCallPath+"\' data-type='image'> x </span>"+
			              "<li>";
			     }
			   });
			   
			   uploadResult.append(str);
			 }
		
		
		 
		 }); // end function ready

	</script>


</body>
</html>
