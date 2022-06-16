function click_add(){
	var url = "schedulePopup";
	var name = "schedulePopup";
	var option = "width = 600, height = 600 left = 100, top=50, location=no";
	window.open(url,name,option);
}

$(document).ready(function(){
	/*var a = document.getElementById("fc-dom-1").childNodes[0].nodeValue;
	
	$(a).change(function(){
		alert("변경됨");
	});
	$('.fc-prev-button').click(function(){
		alert("ㅎㅇ");
	});*/

	/*$('.fc-event-title-container').click(function(){
		var url = "moveUpdateSchedulePopup";
		var name = "moveUpdateSchedulePopup";
		var option = "width = 600, height = 600 left = 100, top=50, location=no";
		window.open(url,name,option);
	})*/
		  	/*$('.fc-event-title-container').mouseover(function(){
		  		tooltip = '<div class="tooltiptopicevent" style="width:100px;background-color: #ccc;position: absolute;z-index: 10001;">';
		    	 alert(event.title);
			}),*/		 
	
});

function click_update(){
		var scheduleData = JSON.stringify($('form#scheduleUpdate').serializeObject());
	$.ajax({
		data : scheduleData,
		url : "updatePopup",
		type : "POST",
		dataType : "text",
		contentType : "application/json; charset=UTF-8",
		success : function(data) {
			opener.parent.location.reload();
			window.close();
		},
		error : function(data){
			console.log(data);
		}
	})
}

//datepicker
$(function() {
	$.datepicker.setDefaults({
		dateFormat : 'yy-mm-dd',
		showOtherMonths : true,
		showMonthAfterYear : true,
		changeYear : true,
		changeMonth : true,          
       yearSuffix: "년",
      	monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
      	monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
       dayNamesMin: ['일','월','화','수','목','금','토'],
       dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일']
	});
	$("#startDate").datepicker();
	$("#endDate").datepicker();
	
	$("#startDate").datepicker('setDate', 'today');
	$("#endDate").datepicker('setDate', 'today');
});


//add schedule form 데이터 제이손 변환
$.fn.serializeObject = function(){
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
    	var name = $.trim(this.name),
    		value = $.trim(this.value);
    	
        if (o[name]) {
            if (!o[name].push) {
                o[name] = [o[name]];
            }
            o[name].push(value || '');
        } else {
            o[name] = value || '';
        }
    });
    return o;
};


function click_ok(){
	var scheduleData = JSON.stringify($('form#scheduleData').serializeObject());
	$.ajax({
		data : scheduleData,
		url : "addSchedule",
		type : "POST",
		dataType : "text",
		contentType : "application/json; charset=UTF-8",
		success : function(data) {
			opener.parent.location.reload();
			window.close();
		},
		error : function(data){
			console.log(data);
		}
	});
};


