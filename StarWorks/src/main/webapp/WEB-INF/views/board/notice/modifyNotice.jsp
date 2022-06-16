<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">


<%@include file="/WEB-INF/views/includes/header.jsp"%>



</head>



<ul class="nav nav-pills flex-column">

  <li class="nav-item">
    <a class="nav-link active" href="/board/notice/listNotice">공지사항</a>
  </li>
	
  <li class="nav-item">
    <a class="nav-link" href="listReferenceroomAction.do">자료실</a>
  </li>
	
  <li class="nav-item">
    <a class="nav-link" href="/meetingroom/meetingroom">회의실</a>
  </li>
  
  
  
</ul>
<ol class="breadcrumb">
  <li class="breadcrumb-item"><a href="/testGit/Login/mainAction.do">홈</a></li>
  <li class="breadcrumb-item"><a href="/board/notice/listNotice">공지사항</a></li>
</ol>

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">Files</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
        <div class="form-group uploadDiv">
            <input type="file" name='uploadFile' multiple="multiple">
        </div>
        
        <div class='uploadResult'> 
          <ul>
          
          </ul>
        </div>
      </div>
      <!--  end panel-body -->
  
    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->


<div class="row">
  <div class="col-lg-12">
   
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

     
      <!-- /.panel-heading -->
      <div class="panel-body">

      <form role="form" id="modify" action="/board/notice/modifyNotice" method="POST">
       
        <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
        <input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
	    <input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
		<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
      
 
		<div class="form-group">
		  <label>B_no</label> 
		  <input class="form-control" name='b_no' 
		     value='<c:out value="${board.b_no }"/>' readonly="readonly">
		</div>
		 
		<div class="form-group">
		  <label>Title</label> 
		  <input class="form-control" name='b_title' 
		    value='<c:out value="${board.b_title }"/>' >
		</div>
		
		<div class="form-group">
		  <label>Text area</label>
		  <textarea class="form-control" rows="3" name='b_contents' ><c:out value="${board.b_contents}"/></textarea>
		</div>
		
		 
 		<div class="form-group">
		  <label>b_date</label> 
		  <input class="form-control" name='b_date'
		    value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.b_date}"/>'  readonly="readonly">            
		</div>
		
			 
		  <button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
		  <button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
		  <button type="submit" data-oper='list' class="btn btn-info">List</button>
	</form>


      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->

<script>
$(document).ready(function() {
	  (function(){
		    
		    var bno = '<c:out value="${board.b_no}"/>';
		    
		    $.getJSON("/board/getAttachList", {bno: bno}, function(arr){
		    
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
	
		  $(".uploadResult").on("click", "button", function(e){ //x 버튼을 클릭했을때
			    
			    console.log("delete file");
			    //지울꺼냐고 문구뜸  
			    if(confirm("Remove this file? ")){ 
			    
			      var targetLi = $(this).closest("li"); //li에 첨부파일들의 정보가 들어있다.
			      targetLi.remove(); //화면에서만 파일을 삭제해줌. 실제 파일이 삭제된건 아니다.
			    }
			  }); 
		  
		  //첨부파일 추가
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
<script type="text/javascript">
$(document).ready(function() {
	  
		  //게시물 수정 이벤트 처리
		  var formObj = $("form");
		  //var formObj = form;
		  
		  
		      
		  $('button').on("click", function(e){
		    
		    	e.preventDefault(); //전송을 막음
		    
		    var operation = $(this).data("oper");
		    
		    	console.log(operation);
		    
		    if(operation === 'remove'){
		      formObj.attr("action", "/board/remove");
		      
		    }else if(operation === 'list'){
		      //move to list
		      formObj.attr("action", "/board/notice/listNotice").attr("method","get");
		      
		      var pageNumTag = $("input[name='pageNum']").clone();
		      var amountTag = $("input[name='amount']").clone();
		      var keywordTag = $("input[name='keyword']").clone();
		      var typeTag = $("input[name='type']").clone();      
		      
		      formObj.empty();
		      
		      formObj.append(pageNumTag);
		      formObj.append(amountTag);
		      formObj.append(keywordTag);
		      formObj.append(typeTag);	  
		      
		    }else if(operation === 'modify'){
		        
		        console.log("submit clicked");
		        var str = "";
		        console.dir(formObj);
		        alert("test");
		        $(".uploadResult ul li").each(function(i, obj){
		          
		          var jobj = $(obj);
		          
		          console.dir(jobj);
		          
		          str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
		          str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
		          str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
		          str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>"; 
		          
		        });
		         formObj.append(str).submit();
		         formObj.append(str);
	        }
	    
		      formObj.submit();   //폼전송
		  });

});
</script>



</body>
</html>