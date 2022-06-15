<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>마이페이지</title>
</head>
<body>
<div id="container2">
<div class="tableitem tableitem1">
<ul class="nav nav-pills flex-column">
    <li class="nav-item">
        <a class="nav-link active" href="/member/mypage">개인 정보 수정</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="/member/listAttendance">근태 기록</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="/member/listAnnualleave">연차 기록</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="/member/listPaystub">급여 명세서</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="/member/listPhoneBook">주소록</a>
    </li>
</ul>
</div>
<div class="tableitem tableitem2" style="min-width : 980px;">
<ol class="breadcrumb">
	<li class="breadcrumb-item"><a href="/">홈</a></li>
    <li class="breadcrumb-item"><a href="/member/mypage">마이페이지</a></li>
    <li class="breadcrumb-item active">개인 정보</li>
</ol>

<h1 style="border-bottom:1px solid #ddd;">개인정보수정</h1>
<form id="mypageUpdateform" class="form-parent" method="post" action="member/mypage" style="border:1px solid #ddd;">
    <fieldset id="mypageUpdate">
    <div id="empForm" >
        <div class="form-group row">
            <label for="staticE_No" class="col-sm-2 col-form-label">사원번호</label>
            <div class="col-sm-10">
                <input type="text" readonly="" class="form-control-plaintext" id="staticE_No"
                       name="e_No" value="${emp.e_no}">
            </div>
        </div>
        <div class="form-group row">
            <label for="staticId" class="col-sm-2 col-form-label">아이디</label>
            <div class="col-sm-10">
                <input type="text" readonly="" class="form-control-plaintext" id="staticId"
                       name="id" value="${emp.id}">
            </div>
        </div>
        <div class="form-group row">
            <label for="staticD_No" class="col-sm-2 col-form-label">부서명</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="staticD_No"
                       name="d_No" value="${emp.dep}">
            </div>
        </div>
        <div class="form-group row">
            <label for="staticGrade" class="col-sm-2 col-form-label">직급</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="staticGrade"
                       name="grade" value="${emp.grade}">
            </div>
        </div>
        <div class="form-group row">
            <label for="staticName" class="col-sm-2 col-form-label">이름</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="staticName"
                       name="name" value="${emp.name}">
            </div>
        </div>
        <div class="form-group row">
            <label for="staticHireDate" class="col-sm-2 col-form-label">입사일</label>
            <div class="col-sm-10">
                <input type="text" readonly="" class="form-control-plaintext" id="staticId"
                       name="hireDate" value="${emp.hiredate}">
            </div>
        </div>
        <div class="form-group row">
            <label for="staticPhoneNumber" class="col-sm-2 col-form-label">전화번호</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="staticPhoneNumber"
                       name="phoneNumber" value="${emp.phone_number}">
            </div>
        </div>
    </div>
    <div id="imgForm">
        <div class="form-group row">
 	       <label for="formFile" class="form-label mt-4">증명사진</label>
            </div>
            <div class="col-sm-10">
            <div style="width:80px;">
            <img src="/resources/img/pic1.PNG" width="130px" height="150px">
            </div>
    	  <input class="form-control" type="file" id="formFile">
        </div>
        <div class="form-group row">
               <label for="formFile" class="form-label mt-4">서명</label>
            <div class="col-sm-10" >
            <div style="width:80px;">
            <img src="/resources/img/pic1.PNG" width="130px" height="130px">
            </div>
    	  	<input class="form-control" type="file" id="formFile">
            </div>
        </div>
     </div>
    </fieldset>
            <button class="btn btn-lg btn-primary" style="font-size:1rem; padding: 1rem 1.5rem;" type="submit">수정</button>
</form>
</div>
</div>
</body>
</html>

