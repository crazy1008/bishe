<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>高校毕业生就业去向管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">
.table-bordered>tbody>tr>td {
	border: 1px solid #0c0b0b;
}
</style>
<script src="<%=basePath%>common/js/loadFile.js" type="text/javascript"></script>
<script type="text/javascript">
function back(){
	window.history.back();
}
</script>
</head>
<body>
	<div class="container-fluid">
	<div class="row-fluid">
		<div class="col-sm-6">
			 <button class="btn btn-warning btn-large" type="button" style="margin-bottom: 20px;margin-top: 20px;" onclick="back()">返回</button>
			<table class="table table-bordered">
				<thead>
					<tr>
					</tr>
				</thead>
				<tbody>
				<c:if test="${not empty company }">
				<tr class="text-center">
						<td>
							公司简介
						</td>
						<td>
							${company.companyProfile }
						</td>
						
					</tr>
					<tr class="text-center">
						<td>
							公司名称
						</td>
						<td>
							${company.companyName }
						</td>
					</tr>
					<tr class="text-center">
						<td>
							公司董事长
						</td>
						<td>
							${company.chairmanCompany }
						</td>
					</tr>
					<tr class="text-center">
						<td>
							公司环境
						</td>
						<td>
							${company.companyEnvironment }
						</td>
					</tr>
					<tr class="text-center">
						<td>
							公司职务
						</td>
						<td>
							${company.companyPosition }
						</td>
					</tr>
					<tr class="text-center">
						<td>
						公司薪水
						</td>
						<td>
							${company.companySalary }
						</td>
					</tr>
					<tr class="text-center">
						<td>
						从事工作
						</td>
						<td>
							${company.engageWork }
						</td>
					</tr>
				</c:if>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>