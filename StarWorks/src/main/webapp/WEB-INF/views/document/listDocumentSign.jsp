<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>StarWorks</title>

<%@include file="/WEB-INF/views/includes/header.jsp"%>

<style type="text/css">
.table {
	width: 800px;
	height: 200px;
}

.form-group {
	width: 700px;
	margin-left: 200px;
	padding: 20px;
}

.pull-right {
	width: 700px;
	margin-left: 250px;
	padding: 20px;
}

.form-control {
	height: 50px;
}
</style>

</head>
<body onload="printClock()">

	<ul class="nav nav-pills flex-column">
		<li class="nav-item"><a class="nav-link active" href="#">조직도</a>
		<li class="nav-item"><a class="nav-link" href="#"
			onclick="location.href='registerDocument'">인사</a> <a class="nav-link"
			href="#" onclick="location.href='listDocument'">영업</a> <a
			class="nav-link" href="#" onclick="location.href='registerDocument'">개발</a>
			<a class="nav-link" href="#" onclick="location.href='listDocument'">임원</a>
			<a class="nav-link" href="#"
			onclick="location.href='registerDocument'">총무</a></li>

	</ul>

	<ol class="breadcrumb">
		<li><input type="button" id="clickme" class="btn btn-default"
			value="입력"> <input type="reset" class="btn btn-default"
			value="초기화"></li>
	</ol>

	<!-- 조직도 부분 --]>

	<!-- 테이블 부분 -->
	<div class="panel-body">
		<!-- 		<table class="table table-hover" style="position: relative; margin: auto;"> -->
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr class="table-dark">
					<th scope="col" style="text-align: center">선택</th>
					<th scope="col" style="text-align: center">부서</th>
					<th scope="col" style="text-align: center">직급</th>
					<th scope="col" style="text-align: center">이름</th>
					<th scope="col" style="text-align: center">사원번호</th>
				</tr>
			</thead>

			<c:forEach items="${list}" var="document">
				<tr>
					<td><input type="checkbox" name="dsi_approver"
						value="${document.name}" /></td>
					<td><c:out value="${document.dep}" /></td>
					<td><c:out value="${document.grade}" /></td>
					<td><c:out value="${document.name}" /></td>
					<td><c:out value="${document.e_no}" /></td>
				</tr>
			</c:forEach>
		</table>

		<div class="form-group">
			<button onclick='getCheckboxValueApprover()'>결재자</button>
			<div class="form-control" id='dsi_approver' name='dsi_approver'></div>
		</div>
		<br>

		<div class="form-group">
			<button onclick='getCheckboxValueConsensus()'>합의자</button>
			<div class="form-control" id='dsi_consensus' name='dsi_consensus'></div>
		</div>
		<br>

		<div class="form-group">
			<button onclick='getCheckboxValueReferrer()'>참조자</button>
			<div class="form-control" id='idsi_referrer' name='idsi_referrer'></div>
		</div>
		<br>

		<div class="form-group">
			<button onclick='getCheckboxValueImplementer()'>시행자</button>
			<div class="form-control" id='idsi_implementer' name='idsi_implementer'></div>
		</div>
		<br>

	</div>

</body>

<script>

window.onload = function(e){
    document.getElementById("clickme").onclick = function(){
        var dsi_approver = document.getElementById("dsi_approver").value;
        var dsi_consensus = document.getElementById("dsi_consensus").value;
        var dsi_approver = document.getElementById("idsi_referrer").value;
        var dsi_consensus = document.getElementById("idsi_implementer").value;
        window.opener.document.getElementById("dsi_approver").value = dsi_approver;
        window.opener.document.getElementById("idsi_implementer").value = idsi_implementer;
        window.opener.document.getElementById("idsi_referrer").value = idsi_referrer;
        window.opener.document.getElementById("idsi_implementer").value = idsi_implementer;
        window.close();
    }
}

</script>

<script>

// 결재자
function getCheckboxValueApprover()  {
	  // 선택된 목록 가져오기
	  const query = 'input[name="dsi_approver"]:checked';
	  const selectedEls = 
	      document.querySelectorAll(query);
	  
	  // 선택된 목록에서 value 찾기
	  let dsi_approver = '';
	  selectedEls.forEach((el) => {
		  dsi_approver += el.value + '&';
	  });
	  
	  // 출력
	  document.getElementById('dsi_approver').innerText
	    = dsi_approver;
	}
	
//합의자
function getCheckboxValueConsensus()  {
	  // 선택된 목록 가져오기
	  const query = 'input[name="dsi_consensus"]:checked';
	  const selectedEls = 
	      document.querySelectorAll(query);
	  
	  // 선택된 목록에서 value 찾기
	  let dsi_consensus = '';
	  selectedEls.forEach((el) => {
		  dsi_consensus += el.value + '&';
	  });
	  
	  // 출력
	  document.getElementById('dsi_consensus').innerText
	    = dsi_consensus;
	}
	
//참조자
function getCheckboxValueReferrer()  {
	  // 선택된 목록 가져오기
	  const query = 'input[name="idsi_referrer"]:checked';
	  const selectedEls = 
	      document.querySelectorAll(query);
	  
	  // 선택된 목록에서 value 찾기
	  let idsi_referrer = '';
	  selectedEls.forEach((el) => {
		  idsi_referrer += el.value + '&';
	  });
	  
	  // 출력
	  document.getElementById('idsi_referrer').innerText
	    = idsi_referrer;
	}
	
//시행자
function getCheckboxValueImplementer()  {
	  // 선택된 목록 가져오기
	  const query = 'input[name="idsi_implementer"]:checked';
	  const selectedEls = 
	      document.querySelectorAll(query);
	  
	  // 선택된 목록에서 value 찾기
	  let idsi_implementer = '';
	  selectedEls.forEach((el) => {
		  idsi_implementer += el.value + '&';
	  });
	  
	  // 출력
	  document.getElementById('idsi_implementer').innerText
	    = idsi_implementer;
	}
	
</script>
</html>