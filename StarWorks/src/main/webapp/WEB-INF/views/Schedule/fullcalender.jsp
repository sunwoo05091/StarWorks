<%@page import="java.util.ArrayList"%>
<%@page import="org.starworks.domain.ScheduleVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
List<ScheduleVO> vo = (List<ScheduleVO>) request.getAttribute("showSchedule");
System.out.println(vo);
%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<html lang='en'>
<head>
<%@include file="/WEB-INF/views/includes/header.jsp"%>
<meta charset='utf-8' />
<link href='/resources/CSS/main.css' rel='stylesheet' />
<script src="js/main.js"></script>
<script src="js/locales-all.min.js"></script>
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
<script src="https://unpkg.com/tippy.js@6"></script>
<script  src="js/jquery-2.1.3.min.js"></script>
<script  src="js/bootstrap.min.js"></script>
<script src='/resources/js/main.js'></script>
<script src='/resources/js/schedule.js'></script>
<style type="text/css">
.add-button {
	position: absolute;
	margin-left: 900px;
	background: #2C3E50;
	border: 0;
	color: white;
	border-radius: 3px;
	width: 157px;
	height: 35px;
	margin-top: 55px;
}
</style>

<script>
/* 	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth'
		});
		calendar.render();
	}); */
		
		
	  var calendar = null;
	
	
	  document.addEventListener('DOMContentLoaded', function() {
		    var calendarEl = document.getElementById('calendar');
		   
			//console.log(vo); 
	
			
		    calendar = new FullCalendar.Calendar(calendarEl, {
		    	
        	    headerToolbar: {
		        left: 'prev,next today',
		        center: 'title',
		        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
		      },
		      //initialDate: '2020-09-12',
		      initialView: 'dayGridMonth',
		      defaultDate : "", 
		      navLinks: true, // can click day/week names to navigate views
		      businessHours: true, // display business hours
		      editable: true, //수정 가능 여부
		      selectable: true,
		      droppable: true,
		      nowIndicator: true,
		      dayMaxEvents: true,
		      locale : "ko",
		      
		      eventDrop : function(info){ // 드래그 수정 이벤트 
		    	  console.log(info);
		    	  if(confirm("'"+info.event.title + "일정 수정 하시겠습니까?")){
		      	  }
		    	  
		    	  var obj = {};
		    	  
		    	  obj.s_title = info.event._def.title;
		    	  obj.s_startday = info.event._instance.range.start;
                  obj.s_finishday = info.event._instance.range.end;
                  
                  console.log(obj);                 
                  
                  $.ajax({
             		 url : "/schedule/schedule-drag-upadate",
             		 method : "post",
             		 data : JSON.stringify(obj),
             		 dataType : "JSON",             		            		
             		 contentType : "application/json",
             		 success : function(data) {
             			 console.log(data);
             			 alert("전송");
             			},
             			error : function(data){
             				alert("실패");
             				console.log(data);
             			}
             	  });               
                  
		      },
		      eventClick : function(info){
		    	  if(confirm("'"+info.event.title + "삭제 하시 겠습니까?")){
		    		  info.event.remove();
		    		  
			    	  var schedule = {};
			    	  
			    	  schedule.s_title = info.event._def.title;
			    	  schedule.s_startday = info.event._instance.range.start;
			    	  schedule.s_finishday = info.event._instance.range.end;
			    	  console.log(info.event._instance.range.start);
	                  
	                  $.ajax({
	                	  url : "/schedule/schedule-click-remove",
	                	  method : "delete",
	                	  dataType : "json",
	                	  data : JSON.stringify(schedule),
	                	  contentType : "application/json",
	              		 success : function(data) {
	             			 console.log(data);
	             			 alert("삭제");
	             			},
	             			error : function(data){
	             				alert("실패");
	             				console.log(data);
	             			}
	                  })
		    	  }else{
		    		  return;
		    	  }
		      },
		      eventDidMount: function(info) {
		    	 <%--  <%for (int i = 0; i < vo.size(); i++) {
  					ScheduleVO dto = vo.get(i);%> --%>
		            var title = info.event.title;
		            var content = info;
		            console.log(content);
		            	if(title.length < 20){
		            		tippy(info.el, {
		            			content:"내용: "+ title <%--' <%=dto.getS_contents()%>' --%>
		            			,placement: 'bottom'
		            			,theme: 'yellow'
		            			,arrow: false
		            		});
		            	}
		            	<%-- <%}%> --%>
		        }, 

		      events: 
		       [
		        <%for (int i = 0; i < vo.size(); i++) {
					ScheduleVO dto = vo.get(i);%>
		        {
		          title:  '<%=dto.getS_title()%>',
		          start: '<%=dto.getS_startday()%>',
		          end: '<%=dto.getS_finishday()%>'
		        },
		        
		        <%}%>     
		      ]
		    });
		    $('div').removeClass('.fc-event-time');
		    calendar.render();


			var b = a.childNodes;
			var allEvent = calendar.getEvents();
		  	  console.log(allEvent);
			  

			
		  });
	


	
			
	  
</script>
</head>
<ul class="nav nav-pills flex-column" style="position: absolute;">
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
				<div>인사 부서</div>
				<div>${emp.grade }${emp.name }님</div>
			</div>
		</div>
	</div>

	<button class="add-button" type="button" onclick="click_add();">추가</button>
	<li class="nav-item"><a class="nav-link active" href="schedule">개인
			일정</a></li>
	<li class="nav-item"><a class="nav-link" href="insertForm.do">일정
			생성</a></li>
	<li class="nav-item"><a class="nav-link" href="listAction">일정
			조회</a>
		<hr style="border: solid 1px gray;">
	<li>분류별 일정</li>
	<br>
	<li style="text-decoration: none;"><a
		href="TypeScheduleAction.do?s_type=1" id="tag">- 개인</a></li>
	<br>
	<li style="text-decoration: none;"><a
		href="TypeScheduleAction.do?s_type=2" id="tag">- 미팅</a></li>
	<br>
	<li style="text-decoration: none;"><a
		href="TypeScheduleAction.do?s_type=3" id="tag">- 회의</a></li>
	<br>
</ul>

<ol class="breadcrumb">
	<li class="breadcrumb-item"><a href="moveSchedule.do" id="tag">홈</a></li>
	<li class="breadcrumb-item"><a href="insertForm.do" id="tag">일정
			생성</a></li>
	<li class="breadcrumb-item active"><a href="listAction.do"
		id="tag">전체 조회<a></a></li>
</ol>
<body>
	<div id='calendar'></div>
</body>
<table class="table table-hover"
	style="position: relative; width: 1000px; margin-left: 300px;">
	<tr class="table-dark">
		<td>번호
		<td>제목
		<td>시작일
		<td>마감일
		<td>작성일
		<td>상태
	</tr>
	<c:forEach var="schedule" items="${ScheduleListModel }">
		<tr class="table-light">
			<td><a href="scheduleDetailAction?s_no=${schedule.s_no}"
				style="text-decoration: none;">${schedule.s_no }</a></td>
			<td>${schedule.s_title }</td>

			<td><fmt:parseDate var="dt" value="${schedule.s_startday }"
					pattern="yyyy-MM-dd" /> <fmt:formatDate value="${dt }"
					pattern="yyyy-MM-dd" /></td>
			<td>~<fmt:parseDate var="dt" value="${schedule.s_finishday }"
					pattern="yyyy-MM-dd" /> <fmt:formatDate value="${dt }"
					pattern="yyyy-MM-dd" />
			</td>
			<td>${schedule.s_date }</td>
			<td>${schedule.situation }&nbsp;&nbsp;&nbsp;</td>
		</tr>
	</c:forEach>
</table>
<br>
<%--      <div class="pageBox">
 <ul  class="pagination">
		<c:if test="${ScheduleListModel.startPage >= 6 }">
	<li class="page-item active">
		<a href="listAction.do?pageNum=${ScheduleListModel.startPage-1 }"class="page-link">[이전]</a>
	</li>
	</c:if>
	
	<c:forEach var="pageNo" begin="${ScheduleListModel.startPage }" end="${ScheduleListModel.endPage }">
		<c:if test="${ScheduleListModel.requestPage == pageNo }"><b></c:if>
		<li class="page-item active">
			<a href="listAction.do?pageNum=${pageNo }">[${pageNo }]</a>
		</li>
		<c:if test="${ScheduleListModel.requestPage == pageNo }"></b></c:if>
	</c:forEach>
	<c:if test="${ScheduleListModel.endPage <  ScheduleListModel.totalPage}">
	<li class="page-item active">	
		<a href="listAction.do?pageNum=${ScheduleListModel.endPage + 1 }">[]이후]</a>
	</li>
	</c:if>
        <c:if test="${ScheduleListModel.endPage < ScheduleListModel.totalPage}">
            <li class="page-item">
                <a class="page-link" href="listAction.do?pageNum=${ScheduleListModel.endPage + 1}">&raquo;</a>
            </li>
        </c:if>
       </ul>
      </div>  --%>

<div class='pageBox'>
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

<form id='actionForm' action="/schedule/listAction" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
</form>

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

							self.location = "/board/register";

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
													.append("<input type='hidden' name='s_no' value='"
															+ $(this).attr(
																	"href")
															+ "'>");
											actionForm.attr("action",
													"/schedule/listAction");
											actionForm.submit();

										});
					});
	</html>