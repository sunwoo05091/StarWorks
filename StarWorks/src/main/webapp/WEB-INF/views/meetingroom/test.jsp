<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout" layout:decorate="~{layout/menu_layout}">
<head>
    <title>스케줄 수정</title>
    <link th:href="@{/css/manager_list.css}" rel="stylesheet"/>
    <!-- jquery CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- fullcalendar CDN -->
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet'/>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
    <!-- fullcalendar 언어 CDN -->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
    <script>
 
        var calendar = null;
        var initialLocaleCode = 'ko';
        var localeSelectorEl = document.getElementById('locale-selector');
 
            $(document).ready(function (){
 
                $(function () {
                    var request = $.ajax({
                        url: "/full-calendar/calendar-admin-update", // 변경하기
                        method: "GET",
                        dataType: "json"
                    });
                    request.done(function (data) {
                        console.log(data); // log 로 데이터 찍어주기.
                        var calendarEl = document.getElementById('calendar');
                        calendar = new FullCalendar.Calendar(calendarEl, {
                            initialDate: '2022-02-07',
                            initialView: 'timeGridWeek',
                            headerToolbar: {
                                left: 'prev,next today',
                                center: 'title',
                                right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
                            },
                            navLinks: true,
                            editable: true,
                            selectable: true,
                            droppable: true, // this allows things to be dropped onto the calendar
 
                            // eventAdd: function () { // 이벤트가 추가되면 발생하는 이벤트
                            //     // console.log()
                            // },
 
                        /**
                         * 드래그로 이벤트 수정하기
                         */
                        eventDrop: function (info){
 
                            if(confirm("'"+ info.event.title +"' 매니저의 일정을 수정하시겠습니까 ?")){
 
                            var events = new Array(); // Json 데이터를 받기 위한 배열 선언
                            var obj = new Object();
 
                            obj.title = info.event._def.title;
                            obj.start = info.event._instance.range.start;
                            obj.end = info.event._instance.range.end;
 
                            obj.oldTitle = info.oldEvent._def.title;
                            obj.oldStart = info.oldEvent._instance.range.start;
                            obj.oldEnd = info.oldEvent._instance.range.end;
 
                            events.push(obj);
 
                            console.log(events);
                            }else{
                                // Get 방식으로 데이터를 조회해서 가져와야하는데 새로고침 하지 않고는 어떻게
                                // 해야할지 감이 안잡혀서 우선 reload 방식으로..
                                location.reload();
                            }
                            $(function modifyData() {
                                $.ajax({
                                    url: "/full-calendar/calendar-admin-update",
                                    method: "PATCH",
                                    dataType: "json",
                                    data: JSON.stringify(events),
                                    contentType: 'application/json',
                                })
                            })
 
 
                        },
                            eventResize: function (info){
                                console.log(info);
                                if(confirm("'"+ info.event.title +"' 매니저의 일정을 수정하시겠습니까 ?")){
 
                                var events = new Array(); // Json 데이터를 받기 위한 배열 선언
                                var obj = new Object();
 
                                obj.title = info.event._def.title;
                                obj.start = info.event._instance.range.start;
                                obj.end = info.event._instance.range.end;
 
                                obj.oldTitle = info.oldEvent._def.title;
                                obj.oldStart = info.oldEvent._instance.range.start;
                                obj.oldEnd = info.oldEvent._instance.range.end;
 
                                events.push(obj);
 
                                console.log(events);
                                }else{
                                    location.reload();
                                }
                                $(function modifyData() {
                                    $.ajax({
                                        url: "/full-calendar/calendar-admin-update",
                                        method: "PATCH",
                                        dataType: "json",
                                        data: JSON.stringify(events),
                                        contentType: 'application/json',
                                    })
                                })
                            },
 
                        /**
                         * 드래그로 이벤트 추가하기
                         * 이름 다른 경우 표현 안돼야 하는데 어떻게 해야할까?..
                         */
                        select: function (arg) { // 캘린더에서 이벤트를 생성할 수 있다.
 
                            var title = prompt('매니저 이름을 입력해주세요.');
                            if (title) {
                                calendar.addEvent({
                                    title: title,
                                    start: arg.start,
                                    end: arg.end,
                                    allDay: arg.allDay
                                })
                            }
 
                            console.log(arg);
 
                            var events = new Array(); // Json 데이터를 받기 위한 배열 선언
                                var obj = new Object();     // Json 을 담기 위해 Object 선언
 
                                obj.title = title; // 이벤트 명칭  ConsoleLog 로 확인 가능.
                                obj.start = arg.start; // 시작
                                obj.end = arg.end; // 끝
                                events.push(obj);
                            var jsondata = JSON.stringify(events);
                            console.log(jsondata);
 
 
                            $(function saveData(jsondata) {
                                $.ajax({
                                    url: "/full-calendar/calendar-admin-update",
                                    method: "POST",
                                    dataType: "json",
                                    data: JSON.stringify(events),
                                    contentType: 'application/json',
                                })
                                    // .done(function (events) {
                                    //     // alert(events);
                                    // })
                                    // .fail(function (request, status, error) {
                                    //      // alert("에러 발생" + error);
                                    // });
                                calendar.unselect()
                            });
                        },
 
                        /**
                         * 이벤트 선택해서 삭제하기
                         */
                        eventClick: function (info){
                            if(confirm("'"+ info.event.title +"' 매니저의 일정을 삭제하시겠습니까 ?")){
                                // 확인 클릭 시
                                info.event.remove();
 
 
                            console.log(info.event);
                            var events = new Array(); // Json 데이터를 받기 위한 배열 선언
                            var obj = new Object();
                                obj.title = info.event._def.title;
                                obj.start = info.event._instance.range.start;
                                obj.end = info.event._instance.range.end;
                                events.push(obj);
 
                            console.log(events);
                            }
                            $(function deleteData(){
                                $.ajax({
                                    url: "/full-calendar/calendar-admin-update",
                                    method: "DELETE",
                                    dataType: "json",
                                    data: JSON.stringify(events),
                                    contentType: 'application/json',
                                })
                            })
                        },
                            locale: 'ko',
                            // eventRemove: function (obj) { // 이벤트가 삭제되면 발생하는 이벤트
                        //
                        // },
                            events: data
                        });
                        calendar.render();
                    });
 
                    });
 
        });
 
 
 
 
    </script>
    <style>
        body {
            font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
            font-size: 14px;
        }
 
        table {
            text-align: left;
        }
 
        .access_user {
            width: 300px;
            height: 100px;
            float: right;
            margin-right: 100px;
            padding-top: 50px;
        }
 
        #external-events {
            position: absolute;
            /*left: 100 px;*/
            /*top: 100px;*/
            width: 150px;
            overflow: hidden;
            padding: 0 10px;
            margin-top: 80px;
            border: 1px solid #ccc;
            background: #eee;
            text-align: left;
        }
 
        #external-events h4 {
            font-size: 16px;
            margin-top: 0;
            padding-top: 1em;
        }
 
        #external-events .fc-event {
            margin: 3px 0;
            cursor: move;
        }
 
        #external-events p {
            margin: 1.5em 0;
            font-size: 11px;
            color: #666;
        }
 
        #external-events p input {
            margin: 0;
            vertical-align: middle;
        }
 
        #calendar-wrap {
            margin-left: 200px;
        }
 
        #calendar {
            max-width: 1100px;
            margin: 40px auto;
            padding: 0 10px;
        }
    </style>
 
</head>
 
<th:block layout:fragment="ground-wrap">
    <div class="ground">
        <div class="main">
            <div class="title1">
                <h1>스케줄 수정</h1>
            </div>
                <div id='calendar-wrap'>
                    <div id='calendar'></div>
                </div>
            </div>
        </div>
    </div>
 
    <script src="fullcalendar/lib/locales-all.js"></script>
 
    <script>
        var calendarEl = document.getElementById('calendar');
 
        var calendar = new FullCalendar.Calendar(calendarEl, {
            plugins: ["dayGrid"]
            , locale: "ko"
        });
 
    </script>
 
    <script>
        // 기본 위치(top)값
        var floatPosition = parseInt($("#external-events").css('top'))
 
        // scroll 인식
        $(window).scroll(function () {
            // 현재 스크롤 위치
            var currentTop = $(window).scrollTop();
            var bannerTop = currentTop + floatPosition + "px";
 
            //이동 애니메이션
            $("#external-events").stop().animate({
                "top": bannerTop
            }, 500);
        }).scroll();
    </script>
</th:block>
</html>