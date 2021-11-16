<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.spring.eApproval.model.vo.EApproval"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
	th {
		width: 100px;
		text-align: center;
		background-color: rgba(0,0,0,.125);
	}
	
	table, td, th {
		border-collapse : collapse;
	}
</style>
</head>
<body>
	<div class="row col-12">
		<h1 class="m-auto">${ea.FName }</h1>
	</div>
	<br><br><br>
	<div class="row col-12 m-auto">
		<div class="col-md-6">
			<table border='1' style="height: 104px;">
				<tr>
					<th>기안자</th>
					<td style="width: 150px">${ea.drafterName }</td>
				</tr>
				<tr>
					<th>기안부서</th>
					<td>${ea.drafterDept }</td>
				</tr>
				<tr>
					<th>기안일</th>
					<td><fmt:formatDate value="${ea.draftDate}" type="date" pattern="yyyy-MM-dd(E)"/></td>
				</tr>
				<tr>
					<th>문서번호</th>
					<c:choose>
						<c:when test="${ea.SCode eq 2}">
							<td>${ea.ENo}</td>
						</c:when>
						<c:when test="${empty ea.SCode }">
							<td></td>
						</c:when>
						<c:otherwise>
							<td></td>
						</c:otherwise>
					</c:choose>
				</tr>
			</table>
		</div>
		<div class="col-md-6">
			<table class="text-center" border='1' style="height: 104px; float: right;">
				<tr>
					<th rowspan="3" style="width: 26px;">결재선</th>
					<td style="width: 70px">${ea.approverJob }</td>
				</tr>
				<tr>
					<td style="height: 60px">${ea.approverName }</td>
				</tr>
				<tr>
					<td><fmt:formatDate value="${ea.approveDate}" type="date" pattern="yyyy/MM/dd"/></td>
				</tr>
			</table>
		</div>
	</div>
	<br><br>
	<div class="row col-12 m-auto">
		<div class="col-12">
			<table border='1' class="col-12">
				<tr>
					<th>제목</th>
					<td><input class="col-12" type="text" value="${ea.title }"></td>
				</tr>
			</table>
		</div>
	</div>
	<br><br>
	<div class="row col-12 m-auto">
		<div class="col-12">
			<table border='1' class="col-12">
				<tr>
					<th>내용</th>
					<td><textarea class="col-12">${ea.content }</textarea></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>