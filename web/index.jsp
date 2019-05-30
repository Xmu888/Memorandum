<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/30
  Time: 13:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>吴某人-备忘录</title>
    <script src="static/js/jquery-3.2.1.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css"/>
    <style>
        * {
            padding: 0;
            margin: 0;
        }

        .back {
            background: #43cee3;
            height: 50px;
            line-height: 50px;
        }

        .bb {
            color: #fff;
            font-weight: bold;
            font-size: 25px;
        }
    </style>
</head>
<body>
<div class="container-fluid back">
    <div class="row">
        <div class="col-md-8">

        </div>
        <div class="col-md-2">
            <b class="bb">欢迎登录</b>
        </div>
        <div class="col-md-2">
            <a href="zhuce.jsp">免费注册</a>
        </div>
    </div>
</div>
<div style="height: 100px;">

</div>
<div class="container">
    <div class="col-md-6 col-md-offset-3">
        <form class="form-horizontal" action="/hello" method="post" id="form">
            <input type="hidden" value="1" name="type">
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">Usernum</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="userNum" id="inputEmail3" placeholder="Usernum">
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" name="passNum" id="inputPassword3"
                           placeholder="Password">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10 text-right">
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" id="check"> Remember me
                        </label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10 text-center">
                    <button type="button" class="btn btn-default btnsub">Sign in</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    var sto = window.localStorage;
    if(sto.Adduser!=undefined&&sto.Addpass!=undefined){
        $("#check").attr("checked","checked");
        $("[name='userNum']").val(sto.Adduser);
        $("[name='passNum']").val(sto.Addpass);
    }
    $(".btnsub").on("click", function () {
        var valUser = $("#inputEmail3").val();
        var valPass = $("#inputPassword3").val();
        if (valUser != "" && valPass != "" && valUser != null && valPass != null) {
            if($("#check").prop("checked")){
                sto.Adduser = valUser;
                sto.Addpass = valPass;
            }else{
                sto.removeItem("Adduser");
                sto.removeItem("Addpass");
            }
            $("#form").submit();
            <%--$.ajax({--%>
            <%--type: "POST",--%>
            <%--url: "${pageContext.request.contextPath}/hello",--%>
            <%--data:{--%>
            <%--type:1,--%>
            <%--userNum:valUser,--%>
            <%--passNum:valPass--%>
            <%--},--%>
            <%--success: function(data) {--%>
            <%--console.log(data);--%>
            <%--if(data){--%>
            <%--$("#form").submit();--%>
            <%--}else{--%>
            <%--alert("用户名或密码错误，请检查!!!!")--%>
            <%--}--%>
            <%--}--%>
            <%--});--%>
        } else {
            alert("用户名或密码不可为空!!!!!")
        }
    })
</script>
</body>
</html>
