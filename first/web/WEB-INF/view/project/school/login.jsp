<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
        + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>高校毕业生就业去向管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="<%=basePath %>common/js/loadFile.js" type="text/javascript"></script>
    <style type="text/css">
        body {
            background: url("<%=basePath %>common/image/4.jpg") no-repeat;
            background-size: cover;
            font-size: 16px;
        }

        .form {
            background: rgba(255, 255, 255, 0.2);
            width: 400px;
            margin: 100px auto;
        }

        #login_form {
            display: block;
        }

        #register_form {
            display: none;
        }

        .fa {
            display: inline-block;
            top: 27px;
            left: 6px;
            position: relative;
            color: #ccc;
        }

        input[type="text"], input[type="password"] {
            padding-left: 26px;
        }

        .checkbox {
            padding-left: 21px;
        }
    </style>
    <script>
        $().ready(function () {
            $("#login_form").validate({
                rules: {
                    username: "required",
                    password: {
                        required: true,
                        minlength: 5
                    },
                },
                messages: {
                    username: "请输入账号",
                    password: {
                        required: "请输入密码",
                        minlength: jQuery.format("密码不能小于{0}个字符")
                    },
                },
                submitHandler: function () {
                    $.post("login.do", {
                            "username": $('input[name="username"]').val(),
                            "password": $('input[name="password"]').val()
                        },
                        function (response) {
                            if (response.tip == "success") {
                                $("#jump").attr("action", "jump.do");
                                $("#jump").submit();
                            }
                            if (response.tip == "notUser") {
                                $("#notUser").css("display", "block");
                                clean();

                            }
                            if (response.tip == "notPassword") {
                                $("#notPassword").css("display", "block");
                                clean();
                            }
                        }, "json");
                }
            });
            $("#register_form").validate({
                rules: {
                    username: "required",
                    password: {
                        required: true,
                        minlength: 5
                    },
                    rpassword: {
                        equalTo: "#register_password"
                    },
                    email: {
                        required: true,
                        email: true
                    }
                },
                messages: {
                    username: "请输入姓名",
                    password: {
                        required: "请输入密码",
                        minlength: jQuery.format("密码不能小于{0}个字符")
                    },
                    rpassword: {
                        equalTo: "两次密码不一样"
                    },
                    email: {
                        required: "请输入邮箱",
                        email: "请输入有效邮箱"
                    }
                }
            });
            $("#register_btn").click(function () {
                $("#register_form").css("display", "block");
                $("#login_form").css("display", "none");
            });
            $("#back_btn").click(function () {
                $("#register_form").css("display", "none");
                $("#login_form").css("display", "block");
            });
            function clean() {
                $('input[name="username"]').val("");
                $('input[name="password"]').val("")
            }
        });
    </script>
</head>

<body>
<div class="container" style="margin-top: 8%">
    <div class="form row" style="padding-top:3%;background-color: #a69eaf">
        <form class="form-horizontal col-sm-offset-3 col-md-offset-3" id="login_form" action="" method="post">
            <h3 class="form-title" style="margin-left: -15%">高校毕业生就业去向管理系统</h3>
            <div class="col-sm-9 col-md-9">
                <div class="form-group">
                    <i class="fa fa-user fa-lg"></i>
                    <input class="form-control required" type="text" placeholder="username" name="username"
                           autofocus="autofocus" maxlength="20"/>
                    <label class="error" style="display: none;" id="notUser">用户不存在</label>
                </div>
                <div class="form-group">
                    <i class="fa fa-lock fa-lg"></i>
                    <input class="form-control required" type="password" placeholder="password" name="password"
                           maxlength="8"/>
                    <label class="error" style="display: none;" id="notPassword">密码不正确</label>
                </div>
                <%--<div class="form-group">--%>
                <%--<label class="checkbox"> <input type="checkbox" name="remember" value="1" /> Remember me--%>
                <%--</label>--%>
                <%--<hr />--%>
                <%--<a href="javascript:;" id="register_btn" class="">Create an account</a>--%>
                <%--</div>--%>
                <div class="form-group">
                    <input type="submit" class="btn btn-success center-block" value="Login"/>
                </div>
            </div>
        </form>
    </div>

    <div class="form row">
        <form class="form-horizontal col-sm-offset-3 col-md-offset-3" id="register_form">
            <h3 class="form-title">Login to your account</h3>
            <div class="col-sm-9 col-md-9">
                <div class="form-group">
                    <i class="fa fa-school fa-lg"></i> <input class="form-control required" type="text"
                                                            placeholder="Username" name="username"
                                                            autofocus="autofocus"/>
                </div>
                <div class="form-group">
                    <i class="fa fa-lock fa-lg"></i> <input class="form-control required" type="password"
                                                            placeholder="Password" id="register_password"
                                                            name="password"/>
                </div>
                <div class="form-group">
                    <i class="fa fa-check fa-lg"></i> <input class="form-control required" type="password"
                                                             placeholder="Re-type Your Password" name="rpassword"/>
                </div>
                <div class="form-group">
                    <i class="fa fa-envelope fa-lg"></i> <input class="form-control eamil" type="text"
                                                                placeholder="Email" name="email"/>
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-success pull-right" value="Sign Up "/> <input type="submit"
                                                                                                      class="btn btn-info pull-left"
                                                                                                      id="back_btn"
                                                                                                      value="Back"/>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<form id="jump" action="" method="post"></form>

</html>