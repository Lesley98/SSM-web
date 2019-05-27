<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
<head>
<meta charset="UTF-8">
<title>員工列表</title>
<link
	href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-ma-12">
				<div class="page-header">
					<h1>公司员工管理系统</h1>
				</div>
			</div>
		</div>
		<div class="row">
			<div>
				<div class="col-md-4 col-md-offset-10">
					<button class=" btn btn-danger">
						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
					</button>
					<button class="btn btn-primary">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
					</button>
				</div>
			</div>

		</div>
		<div class="row">
			<div class="col-ma-12">
				<table class="table table-hover">
					<tr>
						<th><span class="glyphicon glyphicon-tags" aria-hidden="true"></span>编号</th>
						<th><span class="glyphicon glyphicon-user" aria-hidden="true"></span>姓名</th>
						<th><span class="glyphicon glyphicon-adjust"
							aria-hidden="true"></span>性别</th>
						<th><span class="glyphicon glyphicon-envelope"
							aria-hidden="true"></span>电邮地址</th>
						<th><span class="glyphicon glyphicon-home" aria-hidden="true"></span>所属部门</th>
						<th><span class="glyphicon glyphicon-cog" aria-hidden="true"></span>操作</th>
					</tr>
					<c:forEach items="${pageInfo.list}" var="emp">
						<tr>
							<th>${emp.empId }</th>
							<th>${emp.empName }</th>
							<th>${emp.gender }</th>
							<th>${emp.email}</th>
							<th>${emp.department.deptName }</th>
							<th>
								<button class=" btn btn-info">
									<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>编辑
								</button>
								<button class="btn btn-primary">
									<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除
								</button>
							</th>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>

		<div class="row">
			<div class="col-md-6">
				<p>当前第${pageInfo.pageNum}页,共${pageInfo.pages}页,共${pageInfo.total }条记录</p>
			</div>

			<div class="col-md-6">
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<li><a href="${APP_PATH }/emps?pn=1">首頁</a></li>
						<c:if test="${pageInfo.pageNum == 1 }">
						</c:if>
						<c:if test="${pageInfo.pageNum != 1 }">
							<li><a href="${APP_PATH}/emps?pn=${pageInfo.pageNum-1}"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>

						<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
							<c:if test="${page_Num == pageInfo.pageNum }">
								<li class="active"><a href="#">${page_Num }</a></li>
							</c:if>

							<c:if test="${page_Num != pageInfo.pageNum }">
								<li><a href="${APP_PATH }/emps?pn=${page_Num }">${page_Num }</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${pageInfo.hasNextPage}">
							<li><a href="${APP_PATH}/emps?pn=${pageInfo.pageNum+1}"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</c:if>

						<li><a href="${APP_PATH }/emps?pn=${pageInfo.pages}">末頁</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>