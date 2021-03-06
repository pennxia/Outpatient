<%--
  Created by IntelliJ IDEA.
  User: WXW
  Date: 2018-01-23
  Time: 18:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>银医卡管理</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<link href="../css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
  $(".click").click(function(){
  $(".tip").fadeIn(200);
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

});
</script>


</head>


<body>

<div id="doctorList">
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">医生管理</a></li>
    </ul>
    </div>
    <div class="rightinfo">
    <div class="tools form-inline">
    	<ul class="toolbar">
        <button class="btn btn-default" id="insertDotorcard" v-on:click="insertDoctor()">
            <img src="../images/t01.png" />添加医生</button>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <input id="search" class="form-control" placeholder="输入医生编号或姓名查询">
            &nbsp; &nbsp; &nbsp;
            <button class="btn btn-default" onclick="searchDoctor()"><img src="../images/ico06.png" style="margin-top: -5px"/>搜索</button>
        </ul>


    </div>
    
    <table class="table table-hover text-nowrap">
    	<thead>
        <th>编号<i class="sort"><img src="../images/px.gif" /></i></th>
        <th>姓名</th>
        <th>性别</th>
        <th>年龄</th>
        <th>职位</th>
        <th>科室编号</th>
        <th>操作</th>
        </thead>

        <tr v-for="doctor in doctor_List">
        <td>{{doctor.dno}}</td>
        <td>{{doctor.name}}</td>
        <td>{{doctor.sex}}</td>
        <td>{{doctor.age}}</td>
        <td>{{doctor.position}}</td>
        <td>{{doctor.officeno}}</td>
        <td class="toolbar" style="text-align: center">
            <button class="btn btn-default"><img src="../images/t02.png" v-on:click="updateDoctor(doctor.id)">修改</button>
            <button class="btn btn-default"><img src="../images/t03.png" v-on:click="deleteById(deleteId=doctor.id)"> 删除</button>
        </td>
        </tr>
    </table>
        <%--&lt;%&ndash; 分页 begin&ndash;%&gt;--%>
        <%--<div class="form-inline page-style">--%>
            <%--<div style="float: left;">--%>
            <%--<h4>每页条数:<select class="pagedown" >--%>
                <%--<option value="5">5</option>--%>
                <%--<option value="10">10</option>--%>
                <%--<option value="15">15</option>--%>
            <%--</select></h4></div>--%>
            <%--<button class="btn btn-default page pageBackground" id="firstpage">首页</button>--%>
            <%--<button class="btn btn-default page">上一页</button>--%>
            <%--<input class="form-control" v-bind:value = "currnetIndex +'/'+ maxPage" readonly="readonly" style="width: 100px;text-align: center">--%>
            <%--<button class="btn btn-default page">下一页</button>--%>
            <%--<button class="btn btn-default page " id="lastpage">末页</button>--%>
        <%--</div>--%>
        <%--&lt;%&ndash; 分页 end&ndash;%&gt;--%>

        <!-- 模态弹出框 begin -->
        <div class="modal fade" id="doctorModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">{{modalTitle}}</h4>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group form-inline">
                                <label class="control-label">姓名:</label>
                                <input type="text" class="form-control" id="name" v-model="doctor.name">
                            </div>
                            <div class="form-group form-inline">
                                <label class="control-label">性别:</label>
                                <input type="text" class="form-control" id="sex" v-model="doctor.sex">
                                <div style="float: right;">
                                <label class="control-label">年龄:</label>
                                <input type="text" class="form-control" id="age" v-model="doctor.age">
                                </div>
                            </div>
                            <div class="form-group form-inline">
                                <label  class="control-label">职位:</label>
                                <input type="text" class="form-control" id="position" v-model="doctor.position">
                                <div style="float: right;">
                                <label class="control-label">科室编号:</label>
                                <input type="text" class="form-control" id="officeno" v-model="doctor.officeno">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="button" class="btn btn-primary" v-on:click="save()">保存</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- 模态弹出框 end -->

    
    
    <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="../images/ticon.png" /></span>
        <div class="tipright">
        <p>是否确认 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" v-on:click="deleteDoctor()"/>&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    </div>
    </div>
</div>
<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
</script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/vue.js"></script>
</body>
     <script>
            var pageIndex = 1;
            var doctorVue = new Vue({
                el : "#doctorList",
                data : {
                    doctor_List : [],
                    doctor : {jzno:"", name:"", sex:"", age:"", position:"", officeno:""},
                    modalTitle : "",
                    maxPage : "",
                    url : "",
                    currnetIndex : 1,
                    deleteId:"",
                },
                methods : {
//                   查询所有的方法
                    queryMap : function () {
                        var _this = this;
                        $.ajax({
                            url : "/queryMap-doctor.action",
                            type : "post",
                            success : function(data){
                                _this.doctor_List = data;
                                _this.maxPage = data.maxPage;
                            }
                        })
                    },
//                  查询单个
                    queryById : function (id) {
                        var _this = this;
                      $.ajax({
                          url : "/queryById-doctor.action",
                          data : {id :id},
                          type : "post",
                          success : function(data){
                              _this.doctor = data;
                          }
                      })
                    },
//                  增加、修改
                    save :function(){
                        var _this = this;
                        $.ajax({
                            url : _this.url,
                            data :{doctor : JSON.stringify(_this.doctor)},
                            success : function(data){
                                _this.hideModal();//隐藏modal
                                _this.queryMap();//刷新页面
                            }
                        })
                    },
                    //            退卡
                    deleteById : function(id){
                        $(".tip").attr("style","display:block;");
                    },
                    deleteDoctor: function(){
                        var _this = this;
                        $.ajax({
                            url: "/deleteDoctor.action",
                            data: {id: _this.deleteId},
                            success: function (data) {
                                _this.queryMap();//刷新页面
                            }
                        })
                    },
                    insertDoctor : function(){
                        this.modalTitle = "新建银医卡";//设置 modal 标题
                        this.url = "/insertDoctor.action";//设置请求路径
                        this.doctor = {};//初始化银医卡
                        this.showModal();//调用显示modal 的方法
                    },
                    updateDoctor : function(id){
                        this.modalTitle = "修改银医卡";//设置 modal 标题
                        this.url = "/updateDoctor.action";//设置请求路径
                        this.queryById(id);
                        this.showModal();//调用显示modal 的方法
                    },
//                    隐藏模态框
                    hideModal : function(){
                        $("#doctorModal").modal("hide");
                    },
//                    显示模态框
                    showModal : function (){
                        $("#doctorModal").modal("show");
                    },

                },

                created : function(){
                    this.queryMap();
                }
            })

//            分页
            $(function(){
                    var searchValue = $("#search").val();//得到搜索框中的值
                    var selectPageCount = $(".pagedown").val();//得到每页显示条数
                    $.ajax({
                        url : "/queryMap-doctor.action",
                        data : "page="+pageIndex+"&search="+searchValue+"&count="+selectPageCount,
                        type : "post",
                        success : function(data){
                            doctorVue._data.doctor_List = data;
                            doctorVue._data.maxPage = data.maxPage;
                            doctorVue._data.currnetIndex = pageIndex;//设置当前页码为选中的页码
                        }
                    })
                })


//            模糊查询的方法
           function searchDoctor () {
                var searchValue = $("#search").val();//得到搜索框中的值
                console.log(searchValue);
                if(searchValue != null && searchValue != ""){
                    $.ajax({
                        url : "/queryMap-doctor.action",
                        data : {search : searchValue},
                        success : function(data){
                            doctorVue._data.doctor_List = data;
                            doctorVue._data.maxPage = data.maxPage;
                        }
                    })
                }else{
                    alert("请输入你要搜索的值");
                }
           }

     </script>



<style>
    <%--表格居中--%>
    .table tr td ,.table thead th{
        text-align: center;
        line-height: 53px;
    }
    /*分页的居中*/
    .page-style{
        text-align: center;
        margin-top: 10px;
    }
    .page{
        border-color: #2aabd2;
    }
    /*每页条数*/
    .pagedown{
        border-color: #2aabd2;
        font-size: 16px;
        height: 30px;
        width: 50px;
    }
    /*分页后*/
    .pageBackground{
        background-color: #00a4ac;
    }
</style>
</html>
