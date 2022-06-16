<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- api : https://fullcalendar.io/docs#toc -->
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<%@include file="/WEB-INF/views/includes/header.jsp"%>
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
<style>
.popper,
.tooltip {
  position: absolute;
  z-index: 9999;
  background: #FFC107;
  color: black;
  width: 150px;
  border-radius: 3px;
  box-shadow: 0 0 2px rgba(0,0,0,0.5);
  padding: 10px;
  text-align: center;
}
.style5 .tooltip {
  background: #1E252B;
  color: #FFFFFF;
  max-width: 200px;
  width: auto;
  font-size: .8rem;
  padding: .5em 1em;
}
.popper .popper__arrow,
.tooltip .tooltip-arrow {
  width: 0;
  height: 0;
  border-style: solid;
  position: absolute;
  margin: 5px;
}

.tooltip .tooltip-arrow,
.popper .popper__arrow {
  border-color: #FFC107;
}
.style5 .tooltip .tooltip-arrow {
  border-color: #1E252B;
}
.popper[x-placement^="top"],
.tooltip[x-placement^="top"] {
  margin-bottom: 5px;
}
.popper[x-placement^="top"] .popper__arrow,
.tooltip[x-placement^="top"] .tooltip-arrow {
  border-width: 5px 5px 0 5px;
  border-left-color: transparent;
  border-right-color: transparent;
  border-bottom-color: transparent;
  bottom: -5px;
  left: calc(50% - 5px);
  margin-top: 0;
  margin-bottom: 0;
}
.popper[x-placement^="bottom"],
.tooltip[x-placement^="bottom"] {
  margin-top: 5px;
}
.tooltip[x-placement^="bottom"] .tooltip-arrow,
.popper[x-placement^="bottom"] .popper__arrow {
  border-width: 0 5px 5px 5px;
  border-left-color: transparent;
  border-right-color: transparent;
  border-top-color: transparent;
  top: -5px;
  left: calc(50% - 5px);
  margin-top: 0;
  margin-bottom: 0;
}
.tooltip[x-placement^="right"],
.popper[x-placement^="right"] {
  margin-left: 5px;
}
.popper[x-placement^="right"] .popper__arrow,
.tooltip[x-placement^="right"] .tooltip-arrow {
  border-width: 5px 5px 5px 0;
  border-left-color: transparent;
  border-top-color: transparent;
  border-bottom-color: transparent;
  left: -5px;
  top: calc(50% - 5px);
  margin-left: 0;
  margin-right: 0;
}
.popper[x-placement^="left"],
.tooltip[x-placement^="left"] {
  margin-right: 5px;
}
.popper[x-placement^="left"] .popper__arrow,
.tooltip[x-placement^="left"] .tooltip-arrow {
  border-width: 5px 0 5px 5px;
  border-top-color: transparent;
  border-right-color: transparent;
  border-bottom-color: transparent;
  right: -5px;
  top: calc(50% - 5px);
  margin-left: 0;
  margin-right: 0;
}
</style>
<style>
html, body {
overflow: hidden;
font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
font-size: 14px;
}
.fc-header-toolbar {
padding-top: 1em;
padding-left: 1em;
padding-right: 1em;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>

<script src='https://unpkg.com/popper.js/dist/umd/popper.min.js'></script>
<script src='https://unpkg.com/tooltip.js/dist/umd/tooltip.min.js'></script>
</head>
<body style="padding:30px;">

  <div id='calendar'></div>

<script>
$(function(){
  var calendarEl = $('#calendar')[0];
  var calendar = new FullCalendar.Calendar(calendarEl, {
    height: '700px', // calendar 높이 설정
    expandRows: true, // 화면에 맞게 높이 재설정
    slotMinTime: '08:00', // Day 캘린더에서 시작 시간
    slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
    //해더에 표시할 툴바
    headerToolbar: {
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
    },
    initialView: 'dayGridMonth',
    initialDate: '2022-06-13', //달력시작일
    editable: true,
    selectable: true,
    dayMaxEvents: true,
    locale: 'ko',
    eventDidMount: function(info) {
      var tooltip = new Tooltip(info.el, {
        title: info.event.extendedProps.description,
        placement: 'top',
        trigger: 'hover',
        container: 'body',
        html: true
      });
    },
    eventDrop: function(obj) {
      var newObj = obj.event;  
      var oldObj = obj.oldEvent;      
			var move_result = AjaxProcess(oldObj.id, newObj.start); //ajax 호출	
			if (move_result != "Y") //처리실패는 롤백
				obj.revert();
    },   
    select: function(arg) { //일정추가
      var title = prompt('회의실 제목:');
     
      if (title) {
        calendar.addEvent({
        title: title,
        start: arg.start,
        end: arg.end,
        allDay: arg.allDay
      })
    }
    calendar.unselect()
    },
    eventClick: function(event) { //링크 새창열기
			if (event.event.url) {
        event.jsEvent.preventDefault()
        window.open(event.event.url, "_blank");
      }
	},
    events: [
    {
      id: '1234|abc',
      title: '주간회의',
      /* description: '<table border=1><tr><td>abc하나</td><tr><td>둘</td></table>', */
      start: '2022-06-12T09:00:00',
      overlap: true,
     /*  backgroundColor: '#ff0000', */
      durationEditable: false
    },
    {
    groupId: 999,
    title: 'Repeating Event',
    start: '2022-06-01T16:00:00'
    },
    {
    groupId: 999,
    title: 'Repeating Event',
    start: '2022-06-14T16:00:00'
    },    
    {
    title: 'Meeting',
    start: '2022-06-12T10:30:00',
    end: '2022-06-12T12:30:00',
   /*  description: '<table border=1><tr><td>abc하나</td><tr><td>둘</td></table>', */
    },
    {
    title: 'Google',
    url: 'http://google.com/',
    start: '2022-06-15'
    },
    ],
  });
  calendar.render();
  });
</script>
</body>
</html>