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
<title>公司员工管理系统</title>
<link
	href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">

<script type="text/javascript"
	src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
</head>

<script type="text/javascript"
	src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<body>
	<!-- edit user modal -->
	<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">员工修改</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="empName_add_input" class="col-sm-2 control-label">员工姓名</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="empName_update_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label for="email_update_input" class="col-sm-2 control-label">员工电邮</label>
							<div class="col-sm-10">
								<input type="email" name="email" class="form-control"
									id="email_update_input"> <span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">员工性别</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="gender" id="gender1_updata_input" value="男" checked>
									男
								</label> <label class="radio-inline"> <input type="radio"
									name="gender" id="gender2_updata_input" value="女"> 女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">所属部门</label>
							<div class="col-sm-4">
								<select name="dId" class="form-control">
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
				</div>
			</div>
		</div>
	</div>
	<!-- show user modal -->
	<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">员工添加</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="empName_add_input" class="col-sm-2 control-label">员工姓名</label>
							<div class="col-sm-10">
								<input type="text" name="empName" class="form-control"
									id="empName_add_input" placeholder="empName"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="email_add_input" class="col-sm-2 control-label">员工电邮</label>
							<div class="col-sm-10">
								<input type="email" name="email" class="form-control"
									id="email_add_input" placeholder="@gmail.com"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">员工性别</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="gender" id="gender1_add_input" value="男" checked>
									男
								</label> <label class="radio-inline"> <input type="radio"
									name="gender" id="gender2_add_input" value="女"> 女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">所属部门</label>
							<div class="col-sm-4">
								<select name="dId" class="form-control">
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-ma-12">
				<div class="page-header">
					<h1>公司员工管理系统</h1>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-4 col-md-offset-10">
				<button class="btn btn-danger" id="emp_add_modal_btn">新增</button>
				<button class="btn btn-primary" id="emp_delete_all_btn">删除</button>
			</div>
		</div>

		<div class="row">
			<div class="col-ma-12">
				<table class="table table-hover" id="emps_table">
					<thead>
						<tr>
							<th><input type="checkbox" id="check_all" /></th>
							<th><span class="glyphicon glyphicon-tags">编号</span></th>
							<th><span class="glyphicon glyphicon-user">姓名</span></th>
							<th><span class="glyphicon glyphicon-adjust"></span>性别</th>
							<th><span class="glyphicon glyphicon-envelope"></span>电邮地址</th>
							<th><span class="glyphicon glyphicon-home"></span>所属部门</th>
							<th><span class="glyphicon glyphicon-cog"></span>操作</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
			</div>
		</div>
		<!-- page info -->
		<div class="row">
			<div class="col-md-6" id="page_info_area"></div>

			<div class="col-md-6" id="page_nav_area">
				<nav aria-label="Page navigation"></nav>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		var APP_PATH = "${APP_PATH}";
		var totalrecord;
		var currentPage;
		function build_emps_table(result) {
			//clear table data
			$("#emps_table tbody").empty();
			//all itmes data
			var emps = result.extend.pageInfo.list;
			$
					.each(
							emps,
							function(index, item) {
								var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
								var empIdTd = $("<td></td>").append(item.empId);
								var empNameTd = $("<td></td>").append(
										item.empName);
								var genderTd = $("<td></td>").append(
										item.gender);
								var emailTd = $("<td></td>").append(item.email);
								var deptNameTd = $("<td></td>").append(
										item.department.deptName);

								var editBtn = $("<button></button>")
										.addClass(
												"btn btn-primary btn-sm edit_btn")
										.append(
												$("<span></span>")
														.addClass(
																"glyphicon glyphicon-pencil"))
										.append("编辑").append(" ");
								editBtn.attr("edit-id", item.empId);
								var delBtn = $("<button></button>")
										.addClass(
												"btn btn-danger btn-sm delete_btn delete_btn")
										.append(" ")
										.append(
												$("<span></span>")
														.addClass(
																"glyphicon glyphicon-trash"))
										.append("删除");
								delBtn.attr("del-id", item.empId);

								$("<tr></tr>").append(checkBoxTd).append(
										empIdTd).append(empNameTd).append(
										genderTd).append(emailTd).append(
										deptNameTd).append(editBtn).append(" ")
										.append(delBtn).appendTo(
												"#emps_table tbody");
							});
		}
		function build_page_info(result) {
			$("#page_info_area").empty();

			$("#page_info_area").append(
					"当前" + result.extend.pageInfo.pageNum + "页 " + "共"
							+ result.extend.pageInfo.pages + "页 " + "共"
							+ result.extend.pageInfo.total + "条记录")
			totalRecord = result.extend.pageInfo.total;
			currentPage = result.extend.pageInfo.pageNum;
		}
		function build_page_nav(result) {
			$("#page_nav_area").empty();

			var navEle = $("<nav></nav>");
			var ul = $("<li></li>").addClass("pagination");
			var firstPageLi = $("<li></li>").append(
					$("<a></a>").append("首页").attr("href", "#"));
			var prePageLi = $("<li></li>").append(
					$("<a></a>").append("&laquo;"));
			var nextPageLi = $("<li></li>").append(
					$("<a></a>").append("&raquo;"));
			var lastPageLi = $("<li></li>").append(
					$("<a></a>").append("末页").attr("href", "#"));
			if (result.extend.pageInfo.hasPreviousPage == false) {
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			} else {
				firstPageLi.click(function() {
					to_page(1);
				});
				prePageLi.click(function() {
					to_page(result.extend.pageInfo.pageNum - 1);
				})
			}
			ul.append(firstPageLi).append(prePageLi);

			$.each(result.extend.pageInfo.navigatepageNums, function(index,
					item) {
				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if (result.extend.pageInfo.pageNum == item) {
					numLi.addClass("active");
				}
				numLi.click(function() {
					to_page(item);
				});
				ul.append(numLi);
			});
			if (result.extend.pageInfo.hasNextPage == false) {
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			} else {
				nextPageLi.click(function() {
					to_page(result.extend.pageInfo.pageNum + 1)
				});
				lastPageLi.click(function() {
					to_page(result.extend.pageInfo.pages)
				});
			}
			ul.append(nextPageLi).append(lastPageLi);
			navEle.append(ul).appendTo("#page_nav_area");
		}
	</script>
	<script type="text/javascript">
		$(function() {
			to_page(1);
		});
		function to_page(pn) {
			$.ajax({
				url : "${APP_PATH}/emps",
				data : "pn=" + pn,
				type : "GET",
				success : function(result) {
					build_emps_table(result);
					build_page_info(result);
					build_page_nav(result);
				}
			});
		}
		//click add btn
		$("#emp_add_modal_btn").click(function() {
			$("#empAddModal form")[0].reset();
			//department info
			getDepts("#empAddModal select");
			$("#empAddModal").modal({
				backdrop : "static",
			});
		});
		//get department info
		function getDepts(ele) {
			$(ele).empty();
			$.ajax({
				url : "${APP_PATH}/depts",
				type : "GET",
				success : function(result) {
					$.each(result.extend.depts, function() {
						var optionEle = $("<option></option>").append(
								this.deptName).attr("value", this.deptId)
								.appendTo(ele);
					});
				}
			});
		}

		//validata form data
		function validate_add_form() {
			var empName = $("#empName_add_input").val();
			var regName = /(^[a-zA-Z0-9_-]{4,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
			if (!regName.test(empName)) {
				$("#empName_add_input").parent().addClass("has-error");
				$("#empName_add_input").next("span").text(
						"用户名必须是2-5位中文或者6-16位英文和数字的组合");
				return false;
			} else {
				$("#empName_add_input").parent().addClass("has success");
				$("#empName_add_input").next("span").text(" ");
			}
			;
			// 			var email = $("#email_add_input").val();
			// 			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			// 			if (!regEmail.test(email)) {
			// 				$("#email_add_input").parent().addClass("has-error");
			// 				$("#email_add_input").next("span").text("请输入正确的电邮地址");
			// 				return false;
			// 			} else {
			// 				$("#email_add_input").parent().addClass("has success");
			// 				$("#email_add_input").next("span").text(" ");
			// 			}
			// 			;
			return true;
		}

		function show_validate_msg(ele, status, msg) {

			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");

			if ("success" == status) {
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			} else if ("error" == status) {
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}
		//check username
		$("#empName_add_input").change(
				function() {
					var empName = this.value;
					$.ajax({
						url : "${APP_PATH}/checkuser",
						type : "POST",
						data : "empName=" + empName,
						success : function(result) {
							if (result.code == 100) {
								show_validate_msg("#empName_add_input",
										"success", "用户名可用");
								$("#emp_save_btn").attr("ajax-va", "success");
							} else {
								show_validate_msg("#empName_add_input",
										"error", "用户名已被占用，请重新输入");
								$("#emp_save_btn").attr("ajax-va", "error");
							}
						}
					});
				});

		//save user info
		$(document).on("click", "#emp_save_btn", function() {
			if (!validate_add_form()) {
				return false;
			}
			//check validate 
			if ($(this).attr("ajax-va") == "error") {
				return false;
			}
			$.ajax({
				url : "${APP_PATH}/emp",
				type : "POST",
				data : $("#empAddModal form").serialize(),
				success : function(result) {
					$("#empAddModal").modal('hide');
					to_page(totalRecord);

				}
			});
		});
		$(document).on("click", ".edit_btn", function() {
			getDepts("#empUpdateModal select");
			getEmp($(this).attr("edit-id"));
			$("#emp_update_btn").attr("edit-id", $(this).attr("edit-id"));
			$("#empUpdateModal").modal({
				backdrop : "static",
			});
		});
		function getEmp(id) {
			$.ajax({
				url : "${APP_PATH}/emp/" + id,
				type : "GET",
				success : function(result) {
					var empData = result.extend.emp;
					$("#empName_update_static").text(empData.empName);
					$("#email_update_input").val(empData.email);
					$("#empUpdateModal input[name=gender]").val(
							[ empData.gender ]);
					$("#empUpdateModal select").val([ empData.dId ]);
				}
			});
		}
		//update user
		$(document).on("click", "#emp_update_btn", function() {

			$.ajax({
				url : "${APP_PATH}/emp/" + $(this).attr("edit-id"),
				type : "PUT",
				data : $("#empUpdateModal form").serialize(),
				success : function(result) {
					$("#empUpdateModal").modal("hide");
					to_page(currentPage);
				}
			})
		});

		$(document).on("click", ".delete_btn", function() {

			var empName = $(this).parents("tr").find("td:eq(2)").text();
			var empId = $(this).attr("del-id");
			if (confirm("确认删除【" + empName + "】吗？")) {
				//click true
				$.ajax({
					url : "${APP_PATH}/emp/" + empId,
					type : "DELETE",
					success : function(result) {
						alert(result.msg);
						to_page(currentPage);
					}
				});
			}
		});
		//click all
		$("#check_all").click(function() {
			$(".check_item").prop("checked", $(this).prop("checked"));
		});
		//click all when click all
		$(document)
				.on(
						"click",
						".check_item",
						function() {
							var flag = $(".check_item:checked").length == $(".check_item").length;
							$("#check_all").prop("checked", flag);
						});
		//delete all
		$(document).on(
				"click",
				"#emp_delete_all_btn",
				function() {
					var empNames = "";
					var del_idstr = "";
					$.each($(".check_item:checked"), function() {
						empNames += $(this).parents("tr").find("td:eq(2)")
								.text()
								+ ",";
						del_idstr += $(this).parents("tr").find("td:eq(1)")
								.text()
								+ "-";
					});
					empNames = empNames.substring(0, empNames.length - 1);
					del_idstr = del_idstr.substring(0, del_idstr.length - 1);
					if (confirm("确认删除【" + empNames + "】吗？")) {
						$.ajax({
							url : "${APP_PATH}/emp/" + del_idstr,
							type : "DELETE",
							success : function(result) {
								alert(result.msg);
								to_page(currentPage);
							}
						})
					}
				});
	</script>
</body>
</html>