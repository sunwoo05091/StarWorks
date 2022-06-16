<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@include file="/WEB-INF/views/includes/header.jsp"%>
<style type="text/css">
#roomWrap {
    width: 200px;
}

#roomList {
    border: 1px solid #0084FF;
    border-radius: 5px;
}

#roomHeader {
    background-color: #0084FF;
    color: #fff;
    height: 40px;
    font-size: 18px;
    line-height: 40px;
    text-align: center;
    border-radius: 5px;
}

.roomEl {
    text-align: center;
    border-bottom: 1px solid #f0f0f0;
    padding: 10px 0px;
    cursor: pointer;
}

.roomEl:hover{
    background: #f0f0f0;
}

.roomEl.active{
    background: #f0f0f0;
}

#chatWrap {
    width: 600px;
    border: 1px solid #ddd;
}

#chatHeader {
    height: 60px;
    text-align: center;
    line-height: 60px;
    font-size: 25px;
    font-weight: 900;
    border-bottom: 1px solid #ddd;
}

#chatLog {
    height: 700px;
    overflow-y: auto;
    padding: 10px;
}

.myMsg {
    text-align: right;
}

.anotherMsg {
    text-align: left;
    margin-bottom: 5px;
}

.msg {
    display: inline-block;
    border-radius: 15px;
    padding: 7px 15px;
    margin-bottom: 10px;
    margin-top: 5px;

}

.anotherMsg > .msg {
    background-color: #f1f0f0;

}

.myMsg > .msg {
    background-color: #0084FF;
    color: #fff;
}

.chatCon > .msg {
    font-style: red;
    margin-left: 150px;
}

.anotherName {
    font-size: 12px;
    display: block;
}

#chatForm {
    display: block;
    width: 100%;
    height: 50px;
    border-top: 2px solid #f0f0f0;
}

#message {
    width: 85%;
    height: calc(100% - 1px);
    border: none;
    padding-bottom: 0;
}

#message:focus {
    outline: none;
}

#chatForm > input[type=submit] {
    outline: none;
    border: none;
    background: none;
    color: #0084FF;
    font-size: 17px;
}

#memberWrap{
    width: 200px;
}

#memberList {
    border: 1px solid #aaaaaa;
    border-radius: 5px;
}

#memberHeader {
    height: 40px;
    font-size: 18px;
    line-height: 40px;
    padding-left: 15px;
    border-bottom: 1px solid #f0f0f0;
    font-weight: 600;
}

.memberEl {
    border-bottom: 1px solid #f0f0f0;
    padding: 10px 20px;
    font-size: 14px;
}

#contentCover{
    width: 1280px;
    margin: 0 auto;
    padding-top: 20px;
    display: flex;
    justify-content: space-around;
}
</style>
</head>
<body onload = "printClock()">
<div id="container">
    
	
	<!-- asdasd -->
		<div class="tableitem tableitem1">
			<ul class="nav nav-pills flex-column" style="padding: 5px;">
				<li class="nav-item">
					<div class="card bg-light mb-3 mainitem mainitem1"
						style="width: 185px;">
						<div class="card bg-light mb-3" style="max-width: 20rem;">
							<div class="card-body" style="height: 230px;">
								<img src="/resources/img/pic1.PNG" width="165px" height="110%">
							</div>
						</div>
						<div class="card-text">
							<div>
								<sec:authentication property="principal.emp.dep" />
								부서
								<sec:authentication property="principal.emp.grade" />
								<sec:authentication property="principal.emp.name" />
								님
							</div>
						</div>

						<div class="card bg-light mb-3" style="max-width: 20rem;">
							<div
								style="border:1px solid #dedede; width:100%; height:60px; line-height:50px; color:#666;font-size:50px; text-align:center;" id="clock"></div>
						
						</div>
					</div>
				</li>
			</ul>
		</div>
		<div id="contentWrap">
    <div id="contentCover">
        <div id="roomWrap">
            <div id="roomList">
                <div id="roomHeader">채팅 방 목록</div>
                <div id="roomSelect">
                    <div class="roomEl active" data-id="1">인사팀</div>
                    <div class="roomEl" data-id="2">총무팀</div>
                    <div class="roomEl" data-id="3">개발팀</div>
                    <div class="roomEl" data-id="4">홍보팀</div>
                </div>
            </div>
        </div>
        <div id="chatWrap">
            <div id="chatHeader">Chatting</div>
            <div id="chatLog">
                <!-- <div class="anotherMsg">
                    <span class="anotherName">Jo</span>
                    <span class="msg1">Hello</span>
                </div>
                <div class="myMsg">
                    <span class="msg2">Hi</span>
                </div> -->
            </div>
            <div id="chatForm">
                <input type="text" autocomplete="off" size="30" id="messageinput" style="margin-left: 80px; border-radius: 10px; border-color: black; width: 400px;" placeholder="메시지를 입력하세요">
                <button onclick="send();" style=" background-color: black; color: white; border-radius: 10px;">Send</button>
            </div>
        </div>
        <div id="memberWrap">
            <div>
				<button onclick="openSocket();" type="button" class="btn btn-outline-success">Open</button>
				<button onclick="closeSocket();" type="button" class="btn btn-outline-warning">close</button>
			</div>
        </div>
    </div>
</div>
	<!-- <div>
		<input type="text" id="messageinput">
	</div> -->

	
	
	<%-- <div id="test">
		<div id="test2"><sec:authentication property="principal.emp.name"/>님</div>
	</div> --%>
</div>	

	<!-- <div id="message"></div> -->
	<script>
		var ws;
		var messages = document.getElementById("message");
		var msg = document.getElementByClassName("msg");

		function openSocket() {
			if (ws !== undefined && ws.readyState !== WebSocket.CLOSED) {
				writeResponse("WebSocket is already opend.");
				return;
			}

			//웹소켓 객체 만드는 코드
			var url = window.location.host;//웹브라우저의 주소창의 포트까지 가져옴
			var pathname = window.location.pathname; /* '/'부터 오른쪽에 있는 모든 경로*/
			var appCtx = pathname.substring(0, pathname.indexOf("/", 2));
			var root = url + appCtx;
			ws = new WebSocket("ws://"+root+"/ws");

			ws.onopen = function(event) {
				if (event.data === undefined)
					return;
				writeResponse(event.data);
			};
			ws.onmessage = function(event) {
				writeResponse(event.data);
			};
			ws.onclose = function(event) {
				writeResponse("Connection closed");
			}
			
			
		}
		function send() {
			var text = document.getElementById("messageinput").value;
			ws.send(text);
			text = "";
		}
		function closeSocket() {
			ws.close();
		}
		function writeResponse(text) {
			
			/* 맨첨 */
			/* chatWrap.innerHTML += "<br/>" + text; */
			
			var test = text.substr(0,4);
			console.log(test);
			
			if (text.substr(0,4) == 'send') {
				$("#chatLog").append("<div class=myMsg><span class=msg>" + text + "</span></div><br/>");
			}else if (text.substr(0,10) == 'Connection'){
				$("#chatLog").append("<div class=chatCon><span class=msg>" + text + "</span></div><br/>");
			}else {
				$("#chatLog").append("<div class=anotherMsg><span class=anotherName></span><span class=msg>" + text + "</span></div><br/>");
			}
			
			
			
			
			/* var msg2 = "<br/>" + text; */
			
			/* var chat = document.createElement('span'); 
			var msg2 = document.createTextNode(text);
			
			chat.appendChild(msg2);
			
			document.getElementsByClassName("msg").item(1).appendChild(chat); */			
		}
	</script>
</body>
</html>
