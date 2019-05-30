<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/28
  Time: 16:26
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
    <script src="static/js/page.js"></script>
    <link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="static/css/page.css">
    <style>
        .back {
            background: #43cee3;
            height: 50px;
            line-height: 50px;
        }

        .havePM {
            margin: 0px 10px;
        }

        .table > tbody > tr > td,
        .table > tbody > tr > th,
        .table > tfoot > tr > td,
        .table > tfoot > tr > th,
        .table > thead > tr > td,
        .table > thead > tr > th {
            vertical-align: middle;
            text-align: center;
        }

        b {
            display: block;
            width: 100%;
            overflow: hidden;
        }

        .null {
            height: 100px;
        }
        body{
            position: relative;
        }
        .add{
            position: absolute;
            right: 60px;
            bottom: 100px;
        }
        .pageTest{ width: 1000px; height: 50px; margin-top: 100px;    }
        .activP{
            background-color: #367fa9!important;
            color: #fff!important;
        }
    </style>
</head>
<body>
<div class="add">
    <input type="image" src="static/images/add.png"  data-toggle="modal" data-target="#exampleModal" alt="添加一条备忘录">
</div>
<div class="container-fluid back">
    <div class="row">
        <div class="col-md-8">

        </div>
        <div class="col-md-2">
            <a href="#" id="userName"></a>
            ，欢迎登录
        </div>
        <div class="col-md-2">
            <a href="javascript:;" id="exit">退出</a>
        </div>
    </div>
</div>

<div class="null">

</div>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="exampleModalLabel">添加备忘录</h4>
            </div>
            <div class="modal-body">
                <form method="get" action="/hello" id="sub">
                    <input type="hidden" value="1" name="type">
                    <div class="form-group">
                        <label for="recipient-name" class="control-label">Title:</label>
                        <input type="text" class="form-control" name="title" id="recipient-name">
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="control-label">Message:</label>
                        <textarea class="form-control" id="message-text"  style="resize:none"  name="massage"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="submit" form="sub" class="btn btn-primary">Send message</button>
            </div>
        </div>
    </div>
</div>
<script src="static/js/vue.min.js"></script>
<div class="container" id="APP">
    <table border="0" class="table table-striped" cellspacing="" cellpadding="">
        <tr>
            <th>备忘时间</th>
            <th>备忘标题</th>
            <th>操作备忘</th>
        </tr>
        <tr v-for="text in textArr">
            <td>{{text.text_time|getTime}}</td>
            <td width="60%"><b>{{text.text_name}}</b></td>
            <td>
                <button type="button" class="btn btn-info havePM" @click="getConText(text.id)" data-toggle="modal" data-target="#myModal">查看</button>
                <button  :class="[btn,btnType,btnStyle]"  @click="del(text.id)" type="button">删除</button>
            </td>
        </tr>
    </table>

    <%--分页开始--%>
    <div class="pageTest"></div>
    <%--分页结束--%>
    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">{{textName}}</h4>
                </div>
                <div class="modal-body">
                    {{textCont}}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    var sto = window.localStorage;
    $('#exampleModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var modal = $(this);
    });
    var vm;
    vm = new Vue({
        el: '#APP',
        data: {
            textArr: [],
            btn:"btn",
            btnType:"btn-danger",
            btnStyle:"havePM",
            textCont:"",
            textName:"",
            pageLen:0
        },
        methods: {
            getConText(res){
                $.ajax({
                    type: "get",
                    url: "${pageContext.request.contextPath}/hello",
                    data: {
                        type:0,
                        id:res
                    },
                    success: function (data) {
                        vm.textCont = JSON.parse(data)[0].text_cont;
                        vm.textName = JSON.parse(data)[0].text_name;
                    }
                });
            },
            del(del_id){
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/hello",
                    data: {
                        type:3,
                        id:del_id
                    },
                    success: function (data) {
                        if(data){
                            alert("您已删除成功");
                            getText();
                        }else{
                            alert("删除失败，请联系QQ165066910");
                        }
                    }
                });
            }
        },
        filters: {
            getTime: function (value) {
                var d = new Date(value);
                if (!value) return '';
                value = value.toString();
                return d.toLocaleString();
            }
        }
    });
    function getText(){//获取备忘录
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/hello",
            data: {
                type:2,
                user:sto.users
            },
            success: function (data) {
                vm.textArr = JSON.parse(data);
                //分页
                // $('.pageTest').page({
                //     leng: vm.pageLen,//分页总数
                //     activeClass: 'activP' , //active 类样式定义
                //     clickBack:function(page){
                //         console.log(page)
                //     }
                // });
            }
        });
    }
    $("#userName").text(sto.users);
    $("#exit").on("click",function(){
        sto.clear();
        location.href="/";
    });
    if(sto.users!=undefined){
        getText();
    }else{
        location.href="/";
    }
</script>
</body>
</html>
