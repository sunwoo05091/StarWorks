<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<%@include file="/WEB-INF/views/includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">

	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<style type="text/css">
	
	.ContentBox{
		border:  solid 2px;
		border-radius: 10px;
		width: 1000px;
		height: 600px;
		margin-left: 500px;
		background-color: white;
		
	}
	
	

   

   

	
</style>


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

<div class="ContentBox">
	<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			
			<!-- /.panel-heading -->
			<div class="panel-body">

				<div class="form-group">
					<label>Bno</label> <input class="form-control" name='b_no'
						value='<c:out value="${board.b_no }"/>' readonly="readonly">
				</div>

				<div class="form-group">
					<label>Title</label> <input class="form-control" name='b_title'
						value='<c:out value="${board.b_title }"/>' readonly="readonly">
				</div>

				<div class="form-group">
					<label>Text area</label>
					<textarea class="form-control" rows="3" name='b_contents'
						readonly="readonly"><c:out value="${board.b_contents}" /></textarea>
				</div>

				<div class="form-group">
					<label>E_no</label> <input class="form-control" name='e_no'
						value='<c:out value="${board.e_no }"/>' readonly="readonly">
				</div>


				<button data-oper='modify' class="btn btn-default">Modify</button>
				<button data-oper='list' class="btn btn-info">List</button>


				<form id='operForm' action="/board/notice/modifyNotice" method="get">
					<input type='hidden' id='b_no' name='b_no'
						value='<c:out value="${board.b_no}"/>'> <input
						type='hidden' name='pageNum'
						value='<c:out value="${cri.pageNum}"/>'> <input
						type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
					<input type='hidden' name='keyword'
						value='<c:out value="${cri.keyword}"/>'> <input
						type='hidden' name='type' value='<c:out value="${cri.type}"/>'>

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
  <div class='bigPicture'>
  </div>
</div>

<style>
.uploadResult {
  width:100%;
  background-color: gray;
}
.uploadResult ul{
  display:flex;
  flex-flow: row;
  justify-content: center;
  align-items: center;
}
.uploadResult ul li {
  list-style: none;
  padding: 10px;
  align-content: center;
  text-align: center;
}
.uploadResult ul li img{
  width: 100px;
}
.uploadResult ul li span {
  color:white;
}
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
  background:rgba(255,255,255,0.5);
}
.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}

.bigPicture img {
  width:600px;
}

</style>

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">Files</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
        
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



</div>





<script>

$(document).ready(function () {
  	
	(function(){
	    var bno = '<c:out value="${board.b_no}"/>';
	    
/* 	   $.getJSON("/board/getAttachList", {bno: bno}, function(arr){
	    
	      console.log(arr);
	      	      
	    });//end getjson */
	    
	 
	    $.getJSON("/board/getAttachList", {bno: bno}, function(arr){
	        
	        console.log(arr);
	        
	        var str = "";
	        
	        $(arr).each(function(i, attach){
	        
	          //image type
	          if(attach.fileType){
	            var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
	            
	            str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
	            str += "<img src='/display?fileName="+fileCallPath+"'>";
	            str += "</div>";
	            str +"</li>";
	          }else{
	              
	            str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
	            str += "<span> "+ attach.fileName+"</span><br/>";
	            str += "<img src='/resources/img/attach.png'></a>";
	            str += "</div>";
	            str +"</li>";
	          }
	        });
	        
	        $(".uploadResult ul").html(str);
	        
	        
	      });//end getjson
	})();//end function
	
	$(".uploadResult").on("click","li", function(e){
	      
	    console.log("view image");
	    
	    var liObj = $(this);
	    
	    var path = encodeURIComponent(liObj.data("path")+"/" + liObj.data("uuid")+"_" + liObj.data("filename"));
	    
	    if(liObj.data("type")){
	      showImage(path.replace(new RegExp(/\\/g),"/"));
	    }else {
	      //download 
	      self.location ="/download?fileName="+path
	    }
	    	    
	  });//end uploadResult
	
	  function showImage(fileCallPath){
		    
		    alert(fileCallPath);
		    //이미지 확대
		    $(".bigPictureWrapper").css("display","flex").show();
		    
		    $(".bigPicture")
		    .html("<img src='/display?fileName="+fileCallPath+"' >")
		    .animate({width:'100%', height: '100%'}, 1000);
		    
		  } //end showImage
		  
		  //이미지 축소
		  $(".bigPictureWrapper").on("click", function(e){
			    $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
			    setTimeout(function(){
			      $('.bigPictureWrapper').hide();
			    }, 1000);
			  });
	

  	
	var operForm = $("#operForm");

	$("button[data-oper='modify']").on("click", function(e) {

		operForm.attr("action", "/board/notice/modifyNotice").submit();

	});

	$("button[data-oper='list']").on("click", function(e) {

		operForm.find("#b_no").remove();
		operForm.attr("action", "/board/notice/listNotice")
		operForm.submit();

	});
	
	
  var bnoValue = '<c:out value="${board.b_no}"/>';
/*   var replyUL = $(".chat"); //댓글들을 표시하기 위한 ul태그
  
    showList(1);  */
    
/* function showList(page){
	
	console.log("show list " + page);
    
    replyService.getList({bno:bnoValue,page: page|| 1 }, function(replyCnt, list) { //reply.js의 getList함수에서 넘어오는 콜백함수이다.
      
	    console.log("replyCnt: "+ replyCnt );
	    console.log("list: " + list);
	    console.log(list);
	    
	    if(page == -1){ // 전체페이지를 구하려고 -1
	      pageNum = Math.ceil(replyCnt/10.0);
	      showList(pageNum);
	      return;
	    }
	      
	     var str="";
	     
	     if(list == null || list.length == 0){
	       return;
	     }
	     
	     for (var i = 0, len = list.length || 0; i < len; i++) {
	       str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
	       str +="  <div><div class='header'><strong class='primary-font'>["
	    	   +list[i].rno+"] "+list[i].replyer+"</strong>"; 
	       str +="    <small class='pull-right text-muted'>"
	           +replyService.displayTime(list[i].replyDate)+"</small></div>";
	       str +="    <p>"+list[i].reply+"</p></div></li>";
	     }
     
	     replyUL.html(str); //댓글들을 표시하기위한 태그
	     
	     showReplyPage(replyCnt);
 
   });//end function
     
 }//end showList */
    
/*     var pageNum = 1;
    var replyPageFooter = $(".panel-footer");
    
    function showReplyPage(replyCnt){
      
      var endNum = Math.ceil(pageNum / 10.0) * 10;  
      var startNum = endNum - 9; 
      
      var prev = startNum != 1;
      var next = false;
      
      if(endNum * 10 >= replyCnt){
        endNum = Math.ceil(replyCnt/10.0);
      }
      
      if(endNum * 10 < replyCnt){
        next = true;
      }
      
      var str = "<ul class='pagination pull-right'>";
      
      if(prev){
        str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
      }
      
      for(var i = startNum ; i <= endNum; i++){
        
        var active = pageNum == i? "active":"";
        
        str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
      }
      
      if(next){
        str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
      }
      
      str += "</ul></div>";
      
      console.log(str);
      
      replyPageFooter.html(str);
    }//end showReplyPage */
    
     
    /* replyPageFooter.on("click","li a", function(e){ //페이지의 번호를 클릭했을때 새로운 댓글을 가져오는 함수
       e.preventDefault();
       console.log("page click");
       
       var targetPageNum = $(this).attr("href");
       
       console.log("targetPageNum: " + targetPageNum);
       
       pageNum = targetPageNum;
       
       showList(pageNum);
     });      */

    

   
    var modal = $(".modal");
    /* var modalInputReply = modal.find("input[name='reply']");
    var modalInputReplyer = modal.find("input[name='replyer']");
    var modalInputReplyDate = modal.find("input[name='replyDate']"); */
    
    var modalModBtn = $("#modalModBtn");
    var modalRemoveBtn = $("#modalRemoveBtn");
    var modalRegisterBtn = $("#modalRegisterBtn");
    
    $("#modalCloseBtn").on("click", function(e){
    	
    	modal.modal('hide');
    });
    
 /*    $("#addReplyBtn").on("click", function(e){
      
      modal.find("input").val("");
      modalInputReplyDate.closest("div").hide();
      modal.find("button[id !='modalCloseBtn']").hide();
      
      modalRegisterBtn.show();
      
      $(".modal").modal("show");
      
    }); */
    

/*     modalRegisterBtn.on("click",function(e){
      
      var reply = {
            reply: modalInputReply.val(),
            replyer:modalInputReplyer.val(),
            bno:bnoValue
          };
      replyService.add(reply, function(result){
        
        alert(result);
        
        modal.find("input").val("");
        modal.modal("hide");
        
        
        showList(-1);
        
      });
      
    }); */


  //댓글조회 클릭 이벤트 처리 
    /* $(".chat").on("click", "li", function(e){
      
      var rno = $(this).data("rno");
      
      replyService.get(rno, function(reply){
      
        modalInputReply.val(reply.reply);
        modalInputReplyer.val(reply.replyer);
        modalInputReplyDate.val(replyService.displayTime( reply.replyDate))
        .attr("readonly","readonly");
        modal.data("rno", reply.rno);
        
        modal.find("button[id !='modalCloseBtn']").hide();
        modalModBtn.show();
        modalRemoveBtn.show();
        
        $(".modal").modal("show");
            
      });
    }); */
  
    


    /* modalModBtn.on("click", function(e){
    	  
   	  var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
   	  
   	  replyService.update(reply, function(result){
   	        
   	    alert(result);
   	    modal.modal("hide");
   	    showList(pageNum);
   	    
   	  });
   	  
   	}); */


/*    	modalRemoveBtn.on("click", function (e){
   	  
   	  var rno = modal.data("rno");
   	  
   	  replyService.remove(rno, function(result){
   	        
   	      alert(result);
   	      modal.modal("hide");
   	      showList(pageNum);
   	      
   	  });
   	  
   	}); */

 
}); //end read function

</script>
</html>