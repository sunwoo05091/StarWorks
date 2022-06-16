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

				<div class="panel-body">

					<form role="form" action="/document/modifyDocument" method="post">

						<input type='hidden' name='pageNum'
							value='<c:out value="${cri.pageNum }"/>'> <input
							type='hidden' name='amount'
							value='<c:out value="${cri.amount }"/>'> <input
							type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
						<input type='hidden' name='keyword'
							value='<c:out value="${cri.keyword }"/>'>

						<div class="form-group">
							<label>문서번호</label> <input class="form-control" name='dc_no'
								value='<c:out value="${document.dc_no }"/>' readonly="readonly">
						</div>
						<br>

						<div class="form-group">
							<label>제목</label> <input class="form-control" name='dc_title'
								value='<c:out value="${document.dc_title }"/>'>
						</div>
						<br>

						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" rows="3" name='dc_contents'><c:out
									value="${document.dc_contents}" /></textarea>
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

						<button type="submit" data-oper='modifyDocument'
							class="btn btn-default">수정</button>
						<button type="submit" data-oper='removeDocument'
							class="btn btn-danger">삭제</button>
						<button type="submit" data-oper='listDocument'
							class="btn btn-info">목록</button>
						<input class="btn" type="reset" value="초기화"> <a
							class="btn" href="#" onclick=history.back()>취소</a>
					</form>

				</div>
				<!--  end panel-body -->

			</div>
			<!--  end panel-body -->
		</div>
		<!-- end panel -->
	</div>
	<!-- /.row -->

	<div class='bigPictureWrapper'>
		<div class='bigPicture'></div>
	</div>

</body>

<script type="text/javascript">
$(document).ready(function() {


	  var formObj = $("form");

	  $('button').on("click", function(e){
	    
	    e.preventDefault(); 
	    
	    var operation = $(this).data("oper");
	    
	    console.log(operation);
	    
	    if(operation === 'removeDocument'){
	      formObj.attr("action", "/document/removeDocument");
	      
	    }else if(operation === 'list'){
	      //move to list
	      formObj.attr("action", "/document/listDocument").attr("method","get");
	      
	      var pageNumTag = $("input[name='pageNum']").clone();
	      var amountTag = $("input[name='amount']").clone();
	      var keywordTag = $("input[name='keyword']").clone();
	      var typeTag = $("input[name='type']").clone();      
	      
	      formObj.empty();
	      
	      formObj.append(pageNumTag);
	      formObj.append(amountTag);
	      formObj.append(keywordTag);
	      formObj.append(typeTag);	  
	      
	    }else if(operation === 'modifyDocument'){
	        
	        console.log("submit clicked");
	        
	        var str = "";
	        
	        $(".uploadResult ul li").each(function(i, obj){
	          
	          var jobj = $(obj);
	          
	          console.dir(jobj);
	          
	          str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
	          str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
	          str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
	          str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
	          
	        });
	        formObj.append(str).submit();
        }
    
	    formObj.submit();
	  });

});
</script>


<script>

$(document).ready(function() {
  (function(){
    
    var dc_no = '<c:out value="${document.dc_no}"/>';
    
    $.getJSON("/document/getAttachList", {dc_no: dc_no}, function(arr){
    
      console.log(arr);
      
      var str = "";


      $(arr).each(function(i, attach){
          
          //image type
          if(attach.fileType){
            var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
            
            str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
            str +=" data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
            str += "<span> "+ attach.fileName+"</span>";
            str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' "
            str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
            str += "<img src='/display?fileName="+fileCallPath+"'>";
            str += "</div>";
            str +"</li>";
          }else{
              
            str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
            str += "data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
            str += "<span> "+ attach.fileName+"</span><br/>";
            str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' "
            str += " class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
            str += "<img src='/resources/img/attach.png'></a>";
            str += "</div>";
            str +"</li>";
          }
       });

      
      $(".uploadResult ul").html(str);
      
    });//end getjson
  })();//end function
  
  
  $(".uploadResult").on("click", "button", function(e){
	    
    console.log("delete file");
      
    if(confirm("Remove this file? ")){
    
      var targetLi = $(this).closest("li");
      targetLi.remove();

    }
  });  
  
  var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
  var maxSize = 5242880; //5MB
  
  function checkExtension(fileName, fileSize){
    
    if(fileSize >= maxSize){
      alert("파일 사이즈 초과");
      return false;
    }
    
    if(regex.test(fileName)){
      alert("해당 종류의 파일은 업로드할 수 없습니다.");
      return false;
    }
    return true;
  }
  
  $("input[type='file']").change(function(e){

    var formData = new FormData();
    
    var inputFile = $("input[name='uploadFile']");
    
    var files = inputFile[0].files;
    
    for(var i = 0; i < files.length; i++){

      if(!checkExtension(files[i].name, files[i].size) ){
        return false;
      }
      formData.append("uploadFile", files[i]);
      
    }
    
    $.ajax({
      url: '/uploadAjaxAction',
      processData: false, 
      contentType: false,data: 
      formData,type: 'POST',
      dataType:'json',
        success: function(result){
          console.log(result); 
		  showUploadResult(result); //업로드 결과 처리 함수 

      }
    }); //$.ajax
    
  });    

  function showUploadResult(uploadResultArr){
	    
    if(!uploadResultArr || uploadResultArr.length == 0){ return; }
    
    var uploadUL = $(".uploadResult ul");
    
    var str ="";
    
    $(uploadResultArr).each(function(i, obj){
		
		if(obj.image){
			var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
			str += "<li data-path='"+obj.uploadPath+"'";
			str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
			str +" ><div>";
			str += "<span> "+ obj.fileName+"</span>";
			str += "<button type='button' data-file=\'"+fileCallPath+"\' "
			str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			str += "<img src='/display?fileName="+fileCallPath+"'>";
			str += "</div>";
			str +"</li>";
		}else{
			var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
		    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
		      
			str += "<li "
			str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
			str += "<span> "+ obj.fileName+"</span>";
			str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
			str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			str += "<img src='/resources/img/attach.png'></a>";
			str += "</div>";
			str +"</li>";
		}

    });
    
    uploadUL.append(str);
  }
  
});

</script>

</html>