<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="hxy.inspec.customer.util.Configuration"%>
<%@page import="hxy.inspec.customer.po.Orders"%>
<%@page import="java.util.List"%>
<%@page import="hxy.inspec.customer.service.OrderService"%>
<%@page import="java.util.HashMap"%>
<%@page import="hxy.inspec.customer.service.UserService"%>
<%@page import="hxy.inspec.customer.po.User"%>


<!doctype html>
<html class="no-js" lang="">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>未完成订单</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<% 
    request.setCharacterEncoding("utf-8");
    User user = (User) request.getSession().getAttribute("user");
    List<Orders> ls=null;
    if (user == null) {
        //登录过期！直接跳转到登录页
        %>
        <script type="text/javascript">
            console.log('跳转');
            window.top.location.href= 'login'
        </script>
        <% 
    }
%>
    <link rel="stylesheet" href="assets/css/normalize.css">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/themify-icons.css">
    <link rel="stylesheet" href="assets/css/pe-icon-7-filled.css">
    <link rel="stylesheet" href="assets/css/flag-icon.min.css">
    <link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="assets/css/lib/datatable/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <style>
        html,
        body {
            margin: 0px;
            width: 100%;
            height: 100%;
        }
    </style>
</head>

<body>

    <div class="content" style="background:#f1f2f7;height:100%">
        <div class="animated fadeIn">
            <div class="row">

                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">未完成订单</strong>
                        </div>
                        <div class="card-body">
                            <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th>订单号</th>
                                        <th>验货日期</th>
                                        <th>工厂名称</th>
                                        <th>产品名称</th>
                                        <th>状态</th>
                                        <th>下单日期</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                    //列举最近的5条
                                    HashMap<String,Object> hashMap2 = new HashMap<String,Object>();
                                    
											hashMap2.put("cusId", user.getCusid());
											hashMap2.put("status", Configuration.BILL_REPORT_PASSED);
											
											OrderService orderService = new OrderService();
											ls =	orderService.findOrdersByStatusJudge(hashMap2);
                                    		if(ls != null&& ls.size()!=0){
                                    			for(int i=0;i<ls.size();i++){
                                    				Orders os = ls.get(i);
                                    				%>
                                    <tr>
                                        <th scope="row"><%=os.getOrderid() %></th>
                                        <td><%=os.getExcedate() %></td>
                                        <td><%=os.getFactoryname() %></td>
                                        <td><%=os.getGoods() %></td>
                                        <td><%=os.getStatusString() %></td>
                                        <td><%=os.getDate() %></td>
                                        <td><a href="details3?id=<%=os.getOrderid()%>">详情</a></td>
                                    </tr>
                                    <% 
                                    			}
                                    		}
                                    %>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- .animated -->
    </div><!-- .content -->

    <!-- Right Panel -->
    <!-- Scripts -->
    <script src="assets/js/vendor/jquery-2.1.4.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.matchHeight.min.js"></script>
    <script src="assets/js/main.js"></script>
    <script src="assets/js/lib/data-table/datatables.min.js"></script>
    <script src="assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
    <script src="assets/js/lib/data-table/dataTables.buttons.min.js"></script>
    <script src="assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
    <script src="assets/js/lib/data-table/jszip.min.js"></script>
    <script src="assets/js/lib/data-table/vfs_fonts.js"></script>
    <script src="assets/js/lib/data-table/buttons.html5.min.js"></script>
    <script src="assets/js/lib/data-table/buttons.print.min.js"></script>
    <script src="assets/js/lib/data-table/buttons.colVis.min.js"></script>
    <script src="assets/js/init/datatables-init.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#bootstrap-data-table-export').DataTable();
        });
    </script>


</body>

</html>