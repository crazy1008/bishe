<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
        + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>高校毕业生就业去向管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="<%=basePath %>common/js/loadFile.js" type="text/javascript"></script>
    <link rel='icon' href='<%=basePath%>common/image/management.ico' type='image/x-icon'>
    <style>
        label.control-label {
            font-size: 20px;
            font-weight: normal;
        }
        input[type="text"] {
            height: 32px;
        }
        label.error {
            font-size: 14px;
            font-weight: normal;
            color: red;
        }
        input:-webkit-autofill {
            -webkit-box-shadow: 0 0 0px 1000px white inset !important;
            -webkit-text-fill-color: #333 !important;
        }
    </style>
    <script>
        $(function () {
            var studentId = $("#studentId").val();
            if(studentId!=""){
                $('#addInfornation').removeAttr('href');
                $('#addInfornation').removeAttr('onclick');
            }
            else{
                $("#updateInformation").removeAttr("href");
                $("#updateInformation").removeAttr("onclick");
            }
            $("#studentOpenDate").on("change",function () {
                var obj = $("#studentOpenDate");
                if($(obj).value!=""){
                    $(obj).parent().next(".error").css("display","none");
                }
            });
            $("#studentExpireDate").on("change",function (obj) {
                var obj = $("#studentExpireDate");
                if($(obj).value!=""){
                    $(obj).parent().next(".error").css("display","none");
                }
            });
            $('#studentOpenDate').datepicker({format: 'yyyy-mm-dd', language: 'zh-CN', "autoclose":true,});
            $('#studentExpireDate').datepicker({format: 'yyyy-mm-dd', language: 'zh-CN' , "autoclose":true,});
            var validator = $("#addForm").validate({
                errorPlacement: function(error, element) {
                    $( element )
                        .closest( "form" )
                        .find( "label[for='" + element.attr( "id" ) + "']" )
                        .append( error );
                },
                rules: {
                    schoolName: "required",
                    departmentName: "required",
                    majorName: "required",
                    studentNo: "required",
                    studentName: "required",
                    studentClass: "required",
                    studentSex: "required",
                    studentOpenDate:"required",
                    studentExpireDate:"required",
                    employmentStatusName: "required"


                },
                messages: {
                    schoolName: "请输入学校",
                    departmentName: "请输入学院",
                    majorName: "请输入专业",
                    studentNo: "请输入学号",
                    studentName: "请输入名字",
                    studentClass: "请输入班级",
                    studentSex: "请输入性别",
                    studentOpenDate:"请输入入学时间",
                    studentExpireDate:"请输入毕业时间",
                    employmentStatusName: "请输入毕业方向",


                },
                submitHandler: function () {
                    var data = {
                        schoolName: $("#schoolName").val(),
                        departmentName: $("#departmentName").val(),
                        majorName: $("#majorName").val(),
                        studentNo: $("#studentNo").val(),
                        studentName: $("#studentName").val(),
                        studentClass: $("#studentClass").val(),
                        studentSex: $("#studentSex").val(),
                        studentOpenDate: $("#studentOpenDate").val(),
                        studentExpireDate: $("#studentExpireDate").val(),
                        employmentStatusName: $("#employmentStatusName").val()
                    };
                    $.post("addUser.do", data, function (response) {
                        if (response.tip == "success") {
                            $("#myModal").modal("hide");
                            clean();
                        }
                    }, "json");
                }
            });
            $("#close").click(function () {
                clean();
                validator.resetForm();
                $("#myModal").modal('hide');
            });
            $("button.close").click(function () {
                clean();
                validator.resetForm();
                $("#myModal").modal('hide');
            });
        });

        function fnaddUser() {

        }

        function fnadd() {
            $("#myModal").modal({backdrop: "static", keyboard: false});
            $('#myModal').modal('show');
        };

        function fnupdate() {
            $.post("updateUser.do",function (response) {

            });
        };

        function fnquit() {
            $("#userForm").attr("action", "userQuit.do");
            $("#userForm").submit();
        }

        function clean() {
            $("#schoolName").val("");
            $("#departmentName").val("");
            $("#majorName").val("");
            $("#studentNo").val("");
            $("#studentName").val("");
            $("#studentClass").val("");
            $("#studentSex").val("");
            $("#studentOpenDate").val("");
            $("#studentExpireDate").val("");
            $("#employmentStatusName").val("");
        }
    </script>
</head>
<body>
<form action="" method="post" id="userForm"></form>
<div class="container-fluid">
    <!--导航条-->
    <nav class="navbar navbar-default navbar-static-top" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand pull-left" href="#">高校毕业生就业去向管理系统</a>
            </div>
            <div class="collapse navbar-collapse" id="demo-nav">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="javascript:void(0);" onclick="fnadd()" style="color: #337ab7;" id="addInformation">添加信息</a></li>
                    <li><a href="javascript:void(0);" onclick="fnupdate()" style="color: #337ab7" id="updateInformation">修改信息</a></li>
                    <li><a href="javascript:void(0);" onclick="fnsee()" style="color: #337ab7" id="seeInformation">查看信息</a></li>
                    <li><a href="javascript:void(0);" onclick="fnquit()" style="color: #337ab7">退出</a></li>
                </ul>
            </div>
        </div>
    </nav>
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 30%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    添加用户信息
                </h4>
            </div>
            <div class="modal-body" style="height: 550px">
                <form method="post" id="addForm" action="">
                    <div class="form-group col-sm-12">
                        <label for="schoolName" class="control-label col-sm-3">学校</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="schoolName" name="schoolName" value="">
                        </div>
                        <label for="schoolName" class="error" class="col-sm-3"></label>
                    </div>
                    <div class="form-group col-sm-12">
                        <label for="departmentName" class="control-label col-sm-3">学院</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="departmentName" name="departmentName" value="">
                        </div>
                        <label for="departmentName" class="error" class="col-sm-3"></label>
                    </div>
                    <div class="form-group col-sm-12">
                        <label for="majorName" class="control-label col-sm-3">专业</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="majorName" name="majorName" value="">
                        </div>
                        <label for="majorName" class="error" class="col-sm-3"></label>
                    </div>
                    <div class="form-group col-sm-12">
                        <label for="studentNo" class="control-label col-sm-3">学号</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="studentNo" name="studentNo" value="">
                        </div>
                        <label for="studentNo" class="error" class="col-sm-3"></label>
                    </div>
                    <div class="form-group col-sm-12">
                        <label for="studentName" class="control-label col-sm-3">姓名</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="studentName" name="studentName" value="">
                        </div>
                        <label for="studentName" class="error" class="col-sm-3"></label>
                    </div>
                    <div class="form-group col-sm-12">
                        <label for="studentSex" class="control-label col-sm-3">性别</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="studentSex" name="studentSex" value="">
                        </div>
                        <label for="studentSex" class="error" class="col-sm-3"></label>
                    </div>
                    <div class="form-group col-sm-12">
                        <label for="studentClass" class="control-label col-sm-3">班级</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="studentClass" name="studentClass" value="">
                        </div>
                        <label for="studentClass" class="error" class="col-sm-3"></label>
                    </div>
                    <div class="form-group col-sm-12">
                        <label for="studentOpenDate" class="control-label col-sm-3">入学时间</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="studentOpenDate" name="studentOpenDate"
                                   value="">
                        </div>
                        <label for="studentOpenDate" class="error" class="col-sm-3"></label>
                    </div>
                    <div class="form-group col-sm-12">
                        <label for="studentExpireDate" class="control-label col-sm-3">毕业时间</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="studentExpireDate" name="studentExpireDate"
                                   value="">
                        </div>
                        <label for="studentExpireDate" class="error" class="col-sm-3"></label>
                    </div>
                    <div class="form-group col-sm-12">
                        <label for="employmentStatusName" class="control-label col-sm-3">方向</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="employmentStatusName"
                                   name="employmentStatusName" value="">
                        </div>
                        <label for="employmentStatusName" class="error" class="col-sm-3"></label>
                    </div>
                    <div class="col-sm-12 text-center" style="margin-bottom: 30px;">
                        <button type="button" class="btn btn-default" id="close">关闭
                        </button>
                        <button type="submit" class="btn btn-primary">
                            添加
                        </button>
                    </div>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 30%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close">
                    &times;
                </button>
                <h4 class="modal-title" id="updateModalLabel">
                    修改用户信息
                </h4>
            </div>
            <div class="modal-body" style="height: 550px">
                <form method="post" id="updateForm" action="">
                    <div class="form-group col-sm-12">
                        <label for="upSchoolName" class="control-label col-sm-3">学校</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="upSchoolName" name="schoolName" value="${requestScope.school.schoolName}">
                        </div>
                        <label for="schoolName" class="error" class="col-sm-3"></label>
                    </div>
                    <div class="form-group col-sm-12">
                        <label for="upDepartmentName" class="control-label col-sm-3">学院</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="upDepartmentName" name="departmentName" value="${requestScope.school.departmentName}">
                        </div>
                        <label for="departmentName" class="error" class="col-sm-3"></label>
                    </div>
                    <div class="form-group col-sm-12">
                        <label for="upMajorName" class="control-label col-sm-3">专业</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="upMajorName" name="majorName" value="${requestScope.school.majorName}">
                        </div>
                        <label for="majorName" class="error" class="col-sm-3"></label>
                    </div>
                    <div class="form-group col-sm-12">
                        <label for="upStudentNo" class="control-label col-sm-3">学号</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="upStudentNo" name="studentNo" value="${requestScope.school.studentNo}">
                        </div>
                        <label for="studentNo" class="error" class="col-sm-3"></label>
                    </div>
                    <div class="form-group col-sm-12">
                        <label for="upStudentName" class="control-label col-sm-3">姓名</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="upStudentName" name="studentName" value="${requestScope.school.studentName}">
                        </div>
                        <label for="studentName" class="error" class="col-sm-3"></label>
                    </div>
                    <div class="form-group col-sm-12">
                        <label for="upStudentSex" class="control-label col-sm-3">性别</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="upStudentSex" name="studentSex" value="${requestScope.school.studentSex}">
                        </div>
                        <label for="studentSex" class="error" class="col-sm-3"></label>
                    </div>
                    <div class="form-group col-sm-12">
                        <label for="upStudentClass" class="control-label col-sm-3">班级</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="upStudentClass" name="studentClass" value="${requestScope.school.studentClass}">
                        </div>
                        <label for="studentClass" class="error" class="col-sm-3"></label>
                    </div>
                    <div class="form-group col-sm-12">
                        <label for="upStudentOpenDate" class="control-label col-sm-3">入学时间</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="upStudentOpenDate" name="studentOpenDate"
                                   value="${requestScope.school.studentOpenDate}">
                        </div>
                        <label for="studentOpenDate" class="error" class="col-sm-3"></label>
                    </div>
                    <div class="form-group col-sm-12">
                        <label for="upStudentExpireDate" class="control-label col-sm-3">毕业时间</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="upStudentExpireDate" name="studentExpireDate"
                                   value="${requestScope.school.studentExpireDate}">
                        </div>
                        <label for="studentExpireDate" class="error" class="col-sm-3"></label>
                    </div>
                    <div class="form-group col-sm-12">
                        <label for="upEmploymentStatusName" class="control-label col-sm-3">方向</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="upEmploymentStatusName"
                                   name="employmentStatusName" value="${requestScope.school.employmentStatusName}">
                        </div>
                        <label for="employmentStatusName" class="error" class="col-sm-3"></label>
                    </div>
                    <div class="col-sm-12 text-center" style="margin-bottom: 30px;">
                        <button type="button" class="btn btn-default" id="upClose">关闭
                        </button>
                        <button type="submit" class="btn btn-primary">
                            修改
                        </button>
                    </div>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<input type="hidden" id="studentId" name="studentId" value="${sessionScope.user.studentId}">
</body>
</html>
