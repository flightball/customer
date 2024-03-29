<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/commons.jsp" />
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="">
<!--<![endif]-->

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>自助下单</title>
	<meta name="description" content="Ela Admin - HTML5 Admin Template">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="assets/css/normalize.css">
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/css/themify-icons.css">
	<link rel="stylesheet" href="assets/css/pe-icon-7-filled.css">
	<link rel="stylesheet" href="assets/css/flag-icon.min.css">
	<link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
	<link rel="stylesheet" href="assets/css/lib/datatable/dataTables.bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/style.css">
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
	<script src="js/jquery.min.js"></script>
	<link href="zui/lib/datetimepicker/datetimepicker.min.css" rel="stylesheet">
	<script src="zui/lib/datetimepicker/datetimepicker.min.js"></script>

	<!--基于jQuery写的消息提示
  https://www.awaimai.com/1627.html
    -->
	<link rel="stylesheet" href="hxy/css/hxy-alert.css">
	<script src="hxy/js/hxy-alert.js"></script>

	<script type="text/javascript">

		$(document).ready(function () {
			//仅选择日期
			$("#excdate").datetimepicker(
				{
					//language: "zh-CN",
					weekStart: 1,
					todayBtn: 1,
					autoclose: 1,
					todayHighlight: 1,
					startView: 2,
					minView: 2,
					forceParse: 0,
					format: "yyyy-mm-dd"
				});
			
			$("#btn1")
				.click(
					function () {
						var excdate = $("#excdate").val();
						var facname = $("#facname").val();
						var facaddress = $("#facaddress").val();
						var facman = $("#facman").val();
						var factel = $("#factel").val();
						var profile = $("#profile").val();
						var goods = $("#goods").val();
						var type = $("#select").val();
						var goodsType = $("#goodsselect").val();

						console.log(excdate + "\t"+ facname+ "\t"+facaddress+ "\t"+facman+ "\t"+factel+ "\t"+profile+ "\t"+goods+ "\t"+type+ "\t"+goodsType)

						if (excdate == "") {

							$('.hxy-alert').removeClass('hxy-alert-success')
							$('.hxy-alert').html('请选择验货日期').addClass('hxy-alert-warning').show().delay(2000).fadeOut();
							return false;
						}
						if (facname == "") {
							$('.hxy-alert').removeClass('hxy-alert-success')
							$('.hxy-alert').html('请填写工厂名称').addClass('hxy-alert-warning').show().delay(2000).fadeOut();
							return false;
						}
						var file_obj = document.getElementById('afile').files[0];
					       var fd = new FormData();
				            fd.append('excdate', excdate)
				            fd.append('facname', facname);
				            fd.append("facaddress",facaddress );
				            fd.append("facman", facman);
				            fd.append("factel", factel);
				            fd.append( "profile", profile);
				            fd.append("goods",goods );
				            fd.append("type", type );
				            fd.append("goodsType", goodsType );
				            fd.append("file", file_obj );
						

						$.ajax({
							//几个参数需要注意一下
							url: "${pageContext.request.contextPath}/cusInsertOrder",//url
							type: "POST",//方法类型
							async: false,//同步需要等待服务器返回数据后再执行后面的两个函数，success和error。如果设置成异步，那么可能后面的success可能执行后还是没有收到消息。
							dataType: "json",//预期服务器返回的数据类型
							cache: false,
							data: fd,//这个是发送给服务器的数据
						    processData:false,  //tell jQuery not to process the data
			                contentType: false,  //tell jQuery not to set contentType
							success: function (result) {
								console.log(result);//打印服务端返回的数据(调试用)
								if (result.resultCode == 200) {
									//跳转到首页	$('.hxy-alert').removeClass('hxy-alert-success')
									$('.hxy-alert').html('提交成功').addClass('hxy-alert-success').show().delay(2000).fadeOut();
									document.getElementById("excdate").value = ''
									document.getElementById("facname").value = ''
									document.getElementById("facaddress").value = ''
									document.getElementById("facman").value = ''
									document.getElementById("factel").value = ''
									document.getElementById("profile").value = ''
									document.getElementById("goods").value = ''
									document.getElementById("afile").value = ''
								} else if (result.resultCode == 601) {
									//	$(this).remove();
									$('.hxy-alert')
										.removeClass(
											'hxy-alert-success')
									$('.hxy-alert')
										.html(
											'密码错误')
										.addClass(
											'hxy-alert-warning')
										.show()
										.delay(
											2000)
										.fadeOut();
									document
										.getElementById("passwd").value = ''
								} else if (result.resultCode == 404) {
									//	$(this).remove();
									$('.hxy-alert')
										.removeClass(
											'hxy-alert-success')
									$('.hxy-alert')
										.html(
											'手机号未注册')
										.addClass(
											'hxy-alert-warning')
										.show()
										.delay(
											2000)
										.fadeOut();
								} else if (result.resultCode == 604) {
									//跳转到首页
									window.location.href = 'login';
								}
								;
							},
							error: function () {
								//console.log(data);
								$('.hxy-alert').removeClass('hxy-alert-success')
								$('.hxy-alert').html('检查网络是否连接').addClass('hxy-alert-warning').show().delay(2000).fadeOut();
							}
						});
					});

			$("#btn2").click(function () {
				document.getElementById("excdate").value = ''
				document.getElementById("facname").value = ''
				document.getElementById("facaddress").value = ''
				document.getElementById("facman").value = ''
				document.getElementById("factel").value = ''
				document.getElementById("profile").value = ''
				document.getElementById("goods").value = ''
			});
			$("#btn3")
			.click(
				function () {
					var excdate = $("#excdate").val();
					var facname = $("#facname").val();
					var facaddress = $("#facaddress").val();
					var facman = $("#facman").val();
					var factel = $("#factel").val();
					var profile = $("#profile").val();
					var goods = $("#goods").val();
					var type = $("#select").val();
					var goodsType = $("#goodsselect").val();

					console.log(excdate + "\t"+ facname+ "\t"+facaddress+ "\t"+facman+ "\t"+factel+ "\t"+profile+ "\t"+goods+ "\t"+type+ "\t"+goodsType)
					var file_obj = document.getElementById('afile').files[0];
				       var fd = new FormData();
			            fd.append('excdate', excdate)
			            fd.append('facname', facname);
			            fd.append("facaddress",facaddress );
			            fd.append("facman", facman);
			            fd.append("factel", factel);
			            fd.append( "profile", profile);
			            fd.append("goods",goods );
			            fd.append("type", type );
			            fd.append("goodsType", goodsType );
			            fd.append("file", file_obj );
			            fd.append("post_type",'temp');//按钮的请求类型
					
					$.ajax({
						//几个参数需要注意一下
						url: "${pageContext.request.contextPath}/cusInsertOrder",//url
						type: "POST",//方法类型
						async: false,//同步需要等待服务器返回数据后再执行后面的两个函数，success和error。如果设置成异步，那么可能后面的success可能执行后还是没有收到消息。
						dataType: "json",//预期服务器返回的数据类型
						cache: false,
						data: fd,//这个是发送给服务器的数据
					    processData:false,  //tell jQuery not to process the data
		                contentType: false,  //tell jQuery not to set contentType
						success: function (result) {
							console.log(result);//打印服务端返回的数据(调试用)
							if (result.resultCode == 200) {
								//跳转到首页	$('.hxy-alert').removeClass('hxy-alert-success')
								$('.hxy-alert').html('草稿保存成功').addClass('hxy-alert-success').show().delay(2000).fadeOut();
								document.getElementById("excdate").value = ''
								document.getElementById("facname").value = ''
								document.getElementById("facaddress").value = ''
								document.getElementById("facman").value = ''
								document.getElementById("factel").value = ''
								document.getElementById("profile").value = ''
								document.getElementById("goods").value = ''
								document.getElementById("afile").value = ''
							} else if (result.resultCode == 601) {
								//	$(this).remove();
								$('.hxy-alert')
									.removeClass(
										'hxy-alert-success')
								$('.hxy-alert')
									.html(
										'密码错误')
									.addClass(
										'hxy-alert-warning')
									.show()
									.delay(
										2000)
									.fadeOut();
								document
									.getElementById("passwd").value = ''
							} else if (result.resultCode == 404) {
								//	$(this).remove();
								$('.hxy-alert')
									.removeClass(
										'hxy-alert-success')
								$('.hxy-alert')
									.html(
										'手机号未注册')
									.addClass(
										'hxy-alert-warning')
									.show()
									.delay(
										2000)
									.fadeOut();
							} else if (result.resultCode == 604) {
								//跳转到首页
								window.location.href = 'login';
							}
							;
						},
						error: function () {
							//console.log(data);
							$('.hxy-alert').removeClass('hxy-alert-success')
							$('.hxy-alert').html('检查网络是否连接').addClass('hxy-alert-warning').show().delay(2000).fadeOut();
						}
					});
				});


		});
	</script>
	    <script type="text/javascript">
        var maxstrlen = 200;
        function Q(s) {
            return document.getElementById(s);
        }
        function checkWords(c) {
            len = maxstrlen;
            var str = c.value;
            myLen = getStrleng(str);
            var wck = Q("wordCheck");
            if (myLen > len * 2) {
                c.value = str.substring(0, i + 1);
            } else {
                wck.innerHTML = Math.floor((len * 2 - myLen) / 2);
            }
        }
        function getStrleng(str) {
            myLen = 0;
            i = 0;
            for (; (i < str.length) && (myLen <= maxstrlen * 2); i++) {
                if (str.charCodeAt(i) > 0 && str.charCodeAt(i) < 128)
                    myLen++;
                else
                    myLen += 2;
            }
            return myLen;
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

<body>
	<div class="hxy-alert"></div>
	<!-- Header-->
	<div class="content" style="background: #f1f2f7;;height:100%width:100%">
		<div class="animated fadeIn">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<strong class="card-title">自助下单</strong>
						</div>
						<div class="card-body">
							<div class="form-horizontal">
								<div class="row form-group">
									<div class="col col-md-2">
										<label for="text-input" class=" form-control-label"
											style="float:right">工厂名称</label>
									</div>
									<div class="col-12 col-md-9">
										<input type="text" id="facname" name="text-input"
											placeholder="请填写工厂有效名称，百度高德地图可以搜到" class="form-control"><small
											class="form-text text-muted">建议先地图搜索确定下再填写</small>
									</div>
								</div>
								<div class="row form-group">
									<div class="col col-md-2">
										<label for="email-input" class=" form-control-label"
											style="float:right">工厂地址</label>
									</div>
									<div class="col-12 col-md-9">
										<input type="text" id="facaddress" name="email-input" placeholder="工厂有效地址"
											class="form-control"><small
											class="help-block form-text">地图上确定可以搜到的地址</small>
									</div>
								</div>
								<div class="row form-group">
									<div class="col col-md-2">
										<label for="password-input" class=" form-control-label"
											style="float:right">联系人</label>
									</div>
									<div class="col-12 col-md-9">
										<input type="text" id="facman" name="password-input" placeholder="请填写联系人姓名"
											class="form-control"><small class="help-block form-text">不要填写一些别名</small>
									</div>
								</div>
								<div class="row form-group">
									<div class="col col-md-2">
										<label for="disabled-input" class=" form-control-label"
											style="float:right">联系人电话</label>
									</div>
									<div class="col-12 col-md-9">
										<input type="text" id="factel" name="disabled-input" placeholder="请填写有效的电话"
											class="form-control">
									</div>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-2">
									<label for="select" class=" form-control-label" style="float:right">验货类型</label>
								</div>
								<div class="col-12 col-md-9">
									<select name="select" id="select" class="form-control">
										<option value="0">在线检验</option>
										<option value="1">监柜</option>
										<option value="2">抽样</option>
										<option value="3">验货加监柜</option>
										<option value="4">工厂审核</option>
									</select>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-2">
									<label for="textarea-input" class=" form-control-label"
										style="float:right">产品名称</label>
								</div>
								<div class="col-12 col-md-9">
									<input name="text" id="goods" rows="5" placeholder="产品名称，货号"
										class="form-control"></input>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-2">
									<label for="select" class=" form-control-label" style="float:right">产品类型</label>
								</div>
								<div class="col-12 col-md-9">
									<select name="select" id="goodsselect" class="form-control">
										<option value="0">电子</option>
										<option value="1">食品</option>
										<option value="2">交通工具</option>
										<option value="3">零食</option>
										<option value="4">家具</option>
									</select>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-2">
									<label for="textarea-input" class=" form-control-label"
										style="float:right">验货日期</label>
								</div>
								<div class="col-12 col-md-9">
									<input class="form-control form-date" id="excdate"
										placeholder="选择或者输入一个日期：yyyy-MM-dd">
								</div>
							</div>

							<div class="row form-group">
								<div class="col col-md-2">
									<label for="textarea-input" class=" form-control-label"
										style="float:right">备注</label>
								</div>
								<div class="col-12 col-md-9">
									<textarea name="textarea-input" id="profile" rows="5"
										placeholder="请填写一些注意事项或者要求，建议等" class="form-control" onkeyup="javascript:checkWords(this);"
            onmousedown="javascript:checkWords(this);"></textarea>
										
										
										
										<small
											class="help-block form-text">还可以输入<span style="font-family: Georgia; font-size: 26px;" id="wordCheck">200</span>个汉字</small>
								</div>
							</div>
					
							<div class="row form-group">
								<div class="col col-md-2">
									<label for="file-multiple-input" class=" form-control-label"
										style="float:right">资料</label>
								</div>
								<div class="col-12 col-md-9">
									<input type="file" id="afile" name="file-multiple-input"
										class="form-control-file">
								</div>
							</div>
							<div>
								<button type="submit" id="btn1" class="btn btn-primary btn-sm">
									<i class="fa fa-dot-circle-o"></i> 提交
								</button>
								<button type="reset" id="btn2" class="btn btn-danger btn-sm">
									<i class="fa fa-ban"></i> 重置
								</button>
								<button  id="btn3" class="btn btn-danger btn-sm">
									<i class="fa fa-ban"></i> 草稿
								</button>
							</div>
						</div>


					</div>
				</div>
			</div>


		</div>
	</div>
	<!-- .animated -->

	<!-- .content -->

	<!-- Scripts -->
	<script src="assets/js/vendor/jquery-2.1.4.min.js"></script>
	<script src="assets/js/popper.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.matchHeight.min.js"></script>
	<script src="assets/js/main.js"></script>




</body>

</html>