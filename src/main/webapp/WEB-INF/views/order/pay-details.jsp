<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>付款详情</title>
<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="assets/css/normalize.css">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/themify-icons.css">
<link rel="stylesheet" href="assets/css/pe-icon-7-filled.css">
<link rel="stylesheet" href="assets/css/flag-icon.min.css">
<link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
<link rel="stylesheet" href="assets/css/style.css">
<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
<style>
html, body {
	margin: 0px;
	width: 100%;
	height: 100%;
}
</style>
<script src="js/jquery.min.js"></script>
<!--基于jQuery写的消息提示
  https://www.awaimai.com/1627.html
    -->
<link rel="stylesheet" href="hxy/css/hxy-alert.css">
<script src="hxy/js/hxy-alert.js"></script>

<script type="text/javascript">  
$(document).ready(function(){

		var uuid = '${reportuuid}'
			console.log("测试uuid"+uuid.toString())
			
			if(uuid=="null")
			{
				  $('#download').attr('disabled',"true");
				  $('#download').attr('href', '#'); 
				
			}
	});
function js_method(){
	var uuid = '${reportuuid}'
	console.log(uuid.toString())
	
	if(uuid=="null")
	{
		$('.alert').removeClass('alert-success')
		$('.alert').html('没有报告').addClass('alert-warning').show().delay(2000).fadeOut();
		return false;
	}else{
	
	$('.alert').removeClass('alert-warning')
	$('.alert').html('正在下载').addClass('alert-success').show().delay(2000).fadeOut();
	return true;
	}
}
        function jqSubmit() {
           // {# $('#fafafa')[0]#}
            var file_obj = document.getElementById('reportfile').files[0];

            var fd = new FormData();
            fd.append('id', ${ordersId});
            fd.append('file', file_obj);

            $.ajax({
                url:'submitReport',
                type:'POST',
                data:fd,
                dataType : "json",//预期服务器返回的数据类型
                processData:false,  //tell jQuery not to process the data
                contentType: false,  //tell jQuery not to set contentType
                //这儿的三个参数其实就是XMLHttpRequest里面带的信息。
                success:function (result,arg,a1,a2) {
                	 console.log(result);
                    console.log(arg);
                    console.log(a1);
                    console.log(a2);
            		if (result.resultCode == 200) {
        				//thisE.previousElementSibling.innerHTML = "允许"
        					//自动消失的消息
        					$('.alert').removeClass('alert-warning')
        					$('.alert').html('提交成功').addClass('alert-success').show().delay(2000).fadeOut();
            		}
                    
                }
            })
        }
        function verifyReport2(e,id,flag) {
        	
        	if(${reportuuid}==null||${reportuuid}=="null"){
        		$('.alert').removeClass('alert-success')
					$('.alert').html('当前没有报告文件').addClass('alert-warning').show().delay(2000).fadeOut();
        		return;
        	}
      	  
      	  console.log(id+"\t"+${reportuuid});
      		$.ajax({
      			//几个参数需要注意一下
      			url : "${pageContext.request.contextPath}/verifyReport2",//url
      			type : "POST",//方法类型
      			async : false,//同步需要等待服务器返回数据后再执行后面的两个函数，success和error。如果设置成异步，那么可能后面的success可能执行后还是没有收到消息。

      			dataType : "json",//预期服务器返回的数据类型
      			cache : false,
      			data : {
      				"id" : id,
      				"flag":flag
      			},//这个是发送给服务器的数据

      			success : function(result) {
      				console.log(result);//打印服务端返回的数据(调试用)
      				if (result.resultCode == 200) {
      					//跳转到首页		$('.alert').removeClass('alert-success')
      					$('.alert').html('报告审核通过').addClass('alert-success').show().delay(2000).fadeOut();
          				
      				} else if (result.resultCode == 601) {
      					//	$(this).remove();
      					$('.alert').removeClass('alert-success')
      					$('.alert').html('密码错误').addClass('alert-warning').show().delay(2000).fadeOut();
          				
      					document.getElementById("passwd").value=''
      					
      				}else if (result.resultCode == 404) {
      					//	$(this).remove();
      					$('.alert').removeClass('alert-success')
      					$('.alert').html('手机号未注册').addClass('alert-warning').show().delay(2000).fadeOut();	
      				};
      			},
      			error : function() {
      				//console.log(data);
      				$('.alert').removeClass('alert-success')
  					$('.alert').html('检查网络是否连接').addClass('alert-warning').show().delay(2000).fadeOut();
      				
      			}
      		});
      }
</script>

<style>
        html,
        body {
            margin: 0px;
            width: 100%;
            height: 100%;
        }
</style>
</head>

<body style="background: #f1f2f7">
	<div class="alert"></div>
	<div class="content" style="background: #f1f2f7; height: 100%">
		<div class="animated fadeIn">
			<div class="row">
				<div class="col-xl-8">
					<div class="card">
						<div class="card-header">
							<h4>详情</h4>
						</div>
						<div class="card-body">
							<div class="col-md-12">
								<div class="card border"
									style="background-color: #e2e3e5; border-color: #d6d8db; color: #383d41">
									<!-- 
									<div class="card-header">
										<strong class="card-title">订单信息</strong>
									</div>
									 -->
									<div class="card-body">
										<p style="color: #383d41"">
											<h4>订单信息</h4> <small>支付成功后的订单方可</small> <code>重要</code>
										</p>
										<form action="#" method="post" class="form-horizontal">
											<div class="row form-group">
												<div class="col col-md-6">
													<p>
														订单号：<span id='ordersId' value='${ordersId}'>${ordersId}</span>
													</p>
												</div>
												<div class="col col-md-6">
													<p>
														订单状态：<span>${status}</span>
													</p>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-4">
													<p>
														验货时间：<span>${exceData}</span>
													</p>
												</div>
												<div class="col col-md-4">
													<p>
														报告语言：<span>中文</span>
													</p>
												</div>
												<div class="col col-md-4">
													<p>
														检验类型：<span>初次检验</span>
													</p>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-4">
													<p>
														服务类型：<span>初期验货</span>
													</p>
												</div>
												<div class="col col-md-4">
													<p>
														产品信息：<span>${goods}</span>
													</p>
												</div>
												<div class="col col-md-4">
													<p>
														工厂名称：<span>${factoyName}</span>
													</p>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-4">
													<p>
														工厂地址：<span>${facAddress}</span>
													</p>
												</div>
												<div class="col col-md-4">
													<p>
														联系人姓名：<span>${facMan}</span>
													</p>
												</div>
												<div class="col col-md-4">
													<p>
														手机号：<span>${facTel}</span>
													</p>
												</div>
											</div>
											<hr />
											<div class="row form-group">
												<div class="col col-md-4">
													<p>
														下单日期：<span>${date}</span>
													</p>
												</div>

											</div>

										</form>
									</div>
								</div>
							</div>
							<div class="col-md-12">
								<div class="card border"
									style="background-color: #d1ecf1; border-color: #bee5eb; color: #0c5460">
									<!-- 
									<div class="card-header">
										<strong>报告审核 </strong> <small>订单可以在验货日期的24小时前取消。24小时内取消会扣分。
											<code>重要</code>
										</small>
									</div>
									 -->
									<div class="card-body">
										<p style="color: #0c5460"">
											<h4>支付金额</h4> <small></small> <code>重要</code>
										</p>
										<p>
											<i class="fa fa-envelope-o"></i> ${report} <a id="download"
												href="${pageContext.request.contextPath}/downloadFile?fileuuid=${reportuuid}&filename=${report}"
												onclick="js_method();"> <span class="pull-right">下载</span>
											</a>
										<p>
										<hr />
										<button type="button"
											onclick="verifyReport2(this,${ordersId},'conform')"
											class="btn btn-success btn-lg">通过</button>
										<button type="button"
											onclick="verifyReport2(this,${ordersId},'cancel')"
											class="btn btn-danger btn-lg">拒绝</button>
									</div>
								</div>
								<!-- /# card -->
							</div>
						</div>
					</div>
					<!-- /.card -->
				</div>
				<!-- /.col-lg-8 -->

			</div>
			<!-- .row -->
		</div>
		<!-- .animated -->
	</div>
	<!-- .content -->

	<script src="assets/js/vendor/jquery-2.1.4.min.js"></script>
	<script src="assets/js/popper.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.matchHeight.min.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>