<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
    <title>智能云平台首页</title>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/bootstrap-maizi.css"/>
    <link rel="stylesheet" href="css/animate.css"/>
    
    
     <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.0.min.js"></script>
	<style type="text/css">
	*{margin:0;padding:0;}
	body{font-size:14px;color:#444;font-family:"微软雅黑",Arial;background:#fff;padding:50px;}
	a{color:#444;text-decoration: none;}
	a:hover{color:#065BC2;text-decoration: none;}
	.clear{clear:both;}
	img{border:none;vertical-align: middle;}
	ul{list-style: none;}
	.mwui-switch-btn{
		width:84px;  
		display:block;
		padding:1px;
		background:#3B75FD;
		overflow:hidden;
		margin-bottom:5px;
		border:1px solid #2E58C1;
		border-radius:18px;
		cursor: pointer;
	}
	.mwui-switch-btn span{
		width:32px;
		font-size:16px;
		height:24px;
		display:block; 
		filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#f6f6f6,endColorstr=#eeeeee,grandientType=1);
		background:-webkit-gradient(linear, 0 0, 0 100%, from(#f6f6f6), to(#eeeeee));
		background:-moz-linear-gradient(top, #f6f6f6, #eeeeee);
		border-radius:18px;
		float:left;
		color:#3B75FD;
		text-align:center; 
	} 
	.mwui-switch-btn:hover span{
		background:#fff;
	}
	.mwui-switch-btn span.off{float:right;}
	input[type='submit']{padding:5px 10px;cursor: pointer;}
	</style>
	
	<script type="text/javascript">
	$(function() { 
		//$('.mwui-switch-btn').each(function() {
			//$(this).bind("click", function() { 
			$("#light1").bind("click", function() { 
				var btn = $(this).find("span");
				var change = btn.attr("change");
				btn.toggleClass('off'); 

				if(btn.attr("class") == 'off') { 
					$(this).find("input").val("0");
					btn.attr("change", btn.html()); 
					btn.html(change);
					
					alert($(this).find("input").val());
					
				} else { 
					$(this).find("input").val("1");
					btn.attr("change", btn.html()); 
					btn.html(change);
					
					//alert($(this).find("input").val());
					var bt=$(this).find("input").val();
					var json={"bt":bt};
					
					alert(json.bt);
					alert("${pageContext.request.contextPath}");
					
					//提交数据
					var url="${pageContext.request.contextPath}/comRxServlet";
					$.post(url,json,function(data){
						
						var result = eval("("+data+")");
						alert(result.success);
					}); 
					
				}
					
				

				return false;
			});
		//});

		$("#submit").click(function() {
			
			 alert("提交成功！！！");
			 
			var form = $(this).parent()[0];
			var inputs = form.getElementsByTagName('input'); 
			var params = [];
			$('#debuger').html('');

			for (var i=0; i < inputs.length; i++) { 
				params.push(inputs[i].name+"="+inputs[i].value);
			} 

			$.post("post.php", params.join("&")+"&temp="+Math.random(), function(data) {
				$('#debuger').html(data);
			});

			return false;	
		});
	
		/* 播放视频 */
		 $('.overview').on('click', '.j-play', function () {
             $videoWrap.show();
             $video.trigger('play');
         });
	
	/* $("#submit").click(function(){
		$("form").submit(function(e){
			  alert("提交成功！！！");
			});
	}); */
	
	});
	
	
</script> 
</head>
<body>
<!--导航-->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <!--小屏幕导航按钮和logo-->
        <div class="navbar-header">
            <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="index.html" class="navbar-brand">智能云平台</a>
        </div>
        <!--小屏幕导航按钮和logo-->
        <!--导航-->
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#home">首页</a></li>
                <li><a href="#light">电灯</a></li>
                <li><a href="#aircontroller">空调</a></li>
                <li><a href="#socket">插座</a></li>
                <li><a href="#camera">摄像头</a></li>
                <li><a href="#icebox">冰箱</a></li>
                <li><a href="#electricPot">电饭煲</a></li>
                <li><a href="#TV">电视机</a></li>
            </ul>
        </div>
        <!--导航-->

    </div>
</nav>
<!--导航-->

<!--home-->
<section id="home">
    <div class="lvjing">
        <div class="container">
            <div class="row wow fadeInUp" data-wow-duration="1s" data-wow-delay="1s">
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <h1>智能云平台改变生活！</h1>
                    <p>
                       	 智能云平台最初的发展主要以灯光遥控控制、电器远程控制和电动窗帘控制为主，随着行业的发展，智能控制的功能越来越多，控制的对象不断扩展，控制的联动场景要求更高，其不断延伸到家庭安防报警、背景音乐、可视对讲、门禁指纹控制等领域，可以说智能云平台几乎可以涵盖所有传统的弱电行业，市场发展前景诱人，因此和其产业相关的各路品牌不约而同加大力度争夺智能云平台业务，市场渐成春秋争霸之势。 
                    </p>
                    
                    <a class="btn btn-primary btn-trial" target="_blank" href="https://www.baidu.com?eid=46673" onclick="ga('send', 'event', 'Meiqia_chat link', 'link_click','www.baidu.com');">
                    	申请试用
                    </a>
					<a class="btn btn-default j-play" href="javascript:;">
						观看视频
					<i class="icon icon-play"></i>
					</a>
                    
                    <!-- <video src="video/kujialetool.mp4" preload="none" width="100%" height="100%"></video> -->
                   
                    <!-- <video src="video/kujialetool.mp4" width="100%" height="100%"></video> -->
                    <br/>
                    <img src="img/ddd.jpg" class="img-responsive" alt="这是一张图片" width="62%" height="62%"/>
                </div>
                <div class="col-md-1"></div>
            </div>
        </div>
    </div>
</section>
<!--home-->

<!--电灯-->
<section id="light">

     <div class="container">
            <div class="row wow fadeInUp" data-wow-duration="0.5s" data-wow-delay="1s">
                <div class="col-md-1"></div>
                <div class="col-md-8">
                    <h1>智能电灯</h1>
                    <p>
						智能灯的核心功能是控制、灯光效果、创作、分享、光与音乐互动、光提升健康和幸福。
                    </p>
                    <img src="images/light.jpg" class="img-responsive" alt="这是一张图片" width="62%" height="62%"/>
                </div>
                <div class="col-md-2">
                
                <!-- 测试按钮 -->
                <br/> <br/> <br/> <br/>
                <br/> <br/> <br/> <br/>
                <form action="" method="post">
	                <table>
		                <tr>
			                <td>
								智能灯1<button class="mwui-switch-btn" id="light1" ><span change="开" class="off">关</span><input type="hidden" name="show_icon" value="0" /></button> 
			                </td>
			                 <td style="width:15px;display:inline-block;"></td>
			                <td>
								智能灯2<button class="mwui-switch-btn" id="light2"><span change="关">开</span><input type="hidden" name="open_topbar" value="1" /></button> 
			                </td>
		                </tr>
	                </table>
	               
	         <table>
    	 <!-- <input type="button" name="test"  id="btnf" value="接收数据"/> -->
    	    <tr><td><br></td></tr>
    	   	 <tr >
                <td style="width: 35px;">
	                <img src="img/a.png"  id="znd_1" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="znd_2" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="znd_3" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="znd_4" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="znd_5" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="znd_6" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="znd_7" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="znd_8" width="15px" height="15px"/> &nbsp;&nbsp;
                </td>
	          <tr/>
	          
	          <tr><td><br></td></tr>
	          
    	    	<!-- 发送数据 -->
    	    		<tr style="color: red ;" >
    	    		<td>
	    	    		只能输入16进制HEX数据(即0~9,A~F)
    	    		</td>
    	    		</tr>
    	    		<tr style="height: 10px;" >
    	    		<td></td>
    	    		</tr>
    	    	<tr>
					<td><textarea id="Dialog_scrRequire" name="scrRequire"
							style="width: 300px; height: 50px; border: 1px solid #DDDDDD;"
							validType="length[0,30]" invalidMessage="不能超过30个字符"
							missingMessage="必填项" required="true">在此输入需要发送的数据</textarea> 
					</td>
					<td>
						<span>
							<input type="button" name="test"  id="btnf" value="发送数据"/> 
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<span style="color: red" >输入内容不超过30字符</span>
					</td>
				</tr>
				
				<tr><td><br/></td></tr>
    	    
    	    	<!-- 接收数据 -->
    	    	<tr>
					<td>
					
					<textarea id="Dialog_scrRequire" name="scrRequire"
							style="width: 300px; height: 50px; border: 1px solid #DDDDDD;"
							validType="length[0,30]" invalidMessage="不能超过30个字符"
							missingMessage="必填项" required="true" readonly="readonly">在此显示需要接收的内容</textarea>
					<td>
						<input type="button" name="test"  id="btnf" value="接收数据"/>
					</td>
				</tr>
				<tr>
					<td>
						<span style="color: red" >输入内容不超过30字符</span>
					</td>
				</tr>
    	    </table>
		</form>
     </div>
      <div class="col-md-1"></div>
   </div>
</div>
     
</section>
<!--电灯-->

<!--空调-->
<section id="aircontroller">
   
     <div class="container">
            <div class="row wow fadeInUp" data-wow-duration="0.5s" data-wow-delay="1s">
                <div class="col-md-1"></div>
                <div class="col-md-8">
                    <h1>空调</h1>
                    <p>
                       	 智能云平台最初的发展主要以灯光遥控控制、电器远程控制和电动窗帘控制为主，随着行业的发展，智能控制的功能越来越多，控制的对象不断扩展，控制的联动场景要求更高，其不断延伸到家庭安防报警、背景音乐、可视对讲、门禁指纹控制等领域，可以说智能云平台几乎可以涵盖所有传统的弱电行业，市场发展前景诱人，因此和其产业相关的各路品牌不约而同加大力度争夺智能云平台业务，市场渐成春秋争霸之势。 
                    </p>
                    <img src="images/kt.jpg" class="img-responsive" alt="这是一张图片" width="62%" height="62%"/>
                </div>
                <div class="col-md-2">
                
                <!-- 测试按钮 -->
                <br/> <br/> <br/> <br/>
                <br/> <br/> <br/> <br/>
                
                 <form action="" method="post">
	                <table>
		                <tr>
			                <td>
								空调1<button class="mwui-switch-btn" id="kt1"><span change="OFF">ON</span><input type="hidden" name="show_icon2" value="1" /></button> 
			                </td>
			                
			                <td style="width:15px;display:inline-block;"></td>
			                
			                <td>
								空调2<button class="mwui-switch-btn" id="kt2"><span change="ON" class="off">OFF</span><input type="hidden" name="open_topbar2" value="0" /></button> 
			                </td>
			          </tr>
	               </table>
	               
	         <table>

    	    <tr><td><br></td></tr>
    	   	 
    	   	 <tr >
                <td style="width: 35px;">
	                <img src="img/a.png"  id="kt_1" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="kt_2" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="kt_3" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="kt_4" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="kt_5" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="kt_6" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="kt_7" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="kt_8" width="15px" height="15px"/> &nbsp;&nbsp;
                </td>
	          <tr/>
	          
	          <tr><td><br></td></tr>
	          
    	    	<!-- 发送数据 -->
    	    		<tr style="color: red ;" >
    	    		<td>
	    	    		只能输入16进制HEX数据(即0~9,A~F)
    	    		</td>
    	    		</tr>
    	    		<tr style="height: 10px;" >
    	    		<td></td>
    	    		</tr>
    	    	<tr>
					<td><textarea id="#" name="#"
							style="width: 300px; height: 50px; border: 1px solid #DDDDDD;"
							validType="length[0,30]" invalidMessage="不能超过30个字符"
							missingMessage="必填项" required="true">在此输入需要发送的数据</textarea> 
					</td>
					<td>
						<span>
							<input type="button" name="#"  id="#" value="发送数据"/> 
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<span style="color: red" >输入内容不超过30字符</span>
					</td>
				</tr>
				
				<tr><td><br/></td></tr>
    	    
    	    	<!-- 接收数据 -->
    	    	<tr>
					<td>
					
					<textarea id="#" name="#"
							style="width: 300px; height: 50px; border: 1px solid #DDDDDD;"
							validType="length[0,30]" invalidMessage="不能超过30个字符"
							missingMessage="必填项" required="true" readonly="readonly">在此显示需要接收的内容</textarea>
					<td>
						<input type="button" name="#"  id="#" value="接收数据"/>
					</td>
				</tr>
				<tr>
					<td>
						<span style="color: red" >输入内容不超过30字符</span>
					</td>
				</tr>
    	    </table>
		</form>
                </div>
                <div class="col-md-1"></div>
            </div>
        </div>
     
</section>
<!--空调-->

<!--插座-->
<section id="socket">
    
     <div class="container">
            <div class="row wow fadeInUp" data-wow-duration="0.5s" data-wow-delay="1s">
                <div class="col-md-1"></div>
                <div class="col-md-8">
                    <h1>插座</h1>
                    <p>
                       	 智能云平台最初的发展主要以灯光遥控控制、电器远程控制和电动窗帘控制为主，随着行业的发展，智能控制的功能越来越多，控制的对象不断扩展，控制的联动场景要求更高，其不断延伸到家庭安防报警、背景音乐、可视对讲、门禁指纹控制等领域，可以说智能云平台几乎可以涵盖所有传统的弱电行业，市场发展前景诱人，因此和其产业相关的各路品牌不约而同加大力度争夺智能云平台业务，市场渐成春秋争霸之势。 
                    </p>
                    <img src="img/ddd.jpg" class="img-responsive" alt="这是一张图片" width="62%" height="62%"/>
                </div>
                <div class="col-md-2">
                 <!-- 测试按钮 -->
                <br/> <br/> <br/> <br/>
                <br/> <br/> <br/> <br/>
                
                 <form action="" method="post">
	                <table>
		                <tr>
			                <td>
								插座1<button class="mwui-switch-btn" id="cz1"><span change="OFF">ON</span><input type="hidden" name="show_icon2" value="1" /></button> 
			                </td>
			                
			                <td style="width:15px;display:inline-block;"></td>
			                
			                <td>
								插座2<button class="mwui-switch-btn" id="cz2"><span change="ON" class="off">OFF</span><input type="hidden" name="open_topbar2" value="0" /></button> 
			                </td>
			          </tr>
	               </table>
	               
	         <table>

    	    <tr><td><br></td></tr>
    	   	 
    	   	 <tr >
                <td style="width: 35px;">
	                <img src="img/a.png"  id="cz_1" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="cz_2" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="cz_3" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="cz_4" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="cz_5" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="cz_6" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="cz_7" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="cz_8" width="15px" height="15px"/> &nbsp;&nbsp;
                </td>
	          <tr/>
	          
	          <tr><td><br></td></tr>
	          
    	    	<!-- 发送数据 -->
    	    		<tr style="color: red ;" >
    	    		<td>
	    	    		只能输入16进制HEX数据(即0~9,A~F)
    	    		</td>
    	    		</tr>
    	    		<tr style="height: 10px;" >
    	    		<td></td>
    	    		</tr>
    	    	<tr>
					<td><textarea id="#" name="#"
							style="width: 300px; height: 50px; border: 1px solid #DDDDDD;"
							validType="length[0,30]" invalidMessage="不能超过30个字符"
							missingMessage="必填项" required="true">在此输入需要发送的数据</textarea> 
					</td>
					<td>
						<span>
							<input type="button" name="#"  id="#" value="发送数据"/> 
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<span style="color: red" >输入内容不超过30字符</span>
					</td>
				</tr>
				
				<tr><td><br/></td></tr>
    	    
    	    	<!-- 接收数据 -->
    	    	<tr>
					<td>
					
					<textarea id="#" name="#"
							style="width: 300px; height: 50px; border: 1px solid #DDDDDD;"
							validType="length[0,30]" invalidMessage="不能超过30个字符"
							missingMessage="必填项" required="true" readonly="readonly">在此显示需要接收的内容</textarea>
					<td>
						<input type="button" name="#"  id="#" value="接收数据"/>
					</td>
				</tr>
				<tr>
					<td>
						<span style="color: red" >输入内容不超过30字符</span>
					</td>
				</tr>
    	    </table>
		</form>
                </div>
                <div class="col-md-1"></div>
            </div>
        </div>
     
</section>
<!--插座-->

<!--摄像头-->
<section id="camera">
    
     <div class="container">
            <div class="row wow fadeInUp" data-wow-duration="0.5s" data-wow-delay="1s">
                <div class="col-md-1"></div>
                <div class="col-md-8">
                    <h1>摄像头</h1>
                    <p>
						无线摄像头是将无线接收器嵌入到网络摄像机里的新型监控摄像机。
						它使用WIFI频道，符合IEEE 802.11B/G标准协议。
						WIFI是由AP(Access Point)和无线网卡组成的无线网络。
						AP一般称为网络桥接器或接入点，它是当作传统的有线局域网络与无线局域网络之间的桥梁，因此任何一台装有无线网卡的PC均可透过AP去分享有线局域网络甚至广域网络的资源，
						其工作原理相当于一个内置无线发射器的HUB或者是路由，而无线网卡则是负责接收由AP所发射信号的CLIENT端设备。
						有了AP，就像一般有线网络的交换机或路由器一般，无线工作站可以快速且轻易地与网络相连。
						简言之，当交换机的一端接入了无线AP或无线路由器，在无线AP/无线路由器信号覆盖范围内，安装一个或多个无线摄像头，就组成了一个简单的无线视频监控系统，而音视频显示和管理通过局域网内（无线网内或接入交换机）的电脑来实现，云台控制信号同样通过无线来传输。
						如果无线AP或路由接入了互联网，对无线摄像进行动态域名解析和端口映射之后，便可实现远程音视频监控了。
                    </p>
                    <img src="img/wifi.jpg" class="img-responsive" alt="这是一张图片" width="62%" height="62%"/>
                </div>
                <div class="col-md-2">
                 <!-- 测试按钮 -->
                <br/> <br/> <br/> <br/>
                <br/> <br/> <br/> <br/>
                
<<<<<<< HEAD
                 <!-- 测试按钮 -->
                <!-- <br/> <br/> <br/> <br/>
                <br/> <br/> <br/> <br/> -->
                
                 <form action="" method="post">
	                <table>
	                <tr>
	                <td colspan="2" style="width: 50%;">
	                <%-- <iframe src="${pageContext.request.contextPath}/TryDemo.jsp"></iframe> --%>
	                <!-- 插入页面 -->
	               <%--  <jsp:include page="${pageContext.request.contextPath}/TryDemo.jsp">
		                <jsp:param value="username" name="tom"/>
		                <jsp:param value="pwd" name="123"/>
	                </jsp:include> --%>
	                
	                <%@ include file="TryDemo.jsp" %>
	                
	                </td>
	                
	                </tr>
	                
	               
		                <tr>
			                <td>
									摄像头1<button class="mwui-switch-btn" id="sxt1"><span change="OFF">ON</span><input type="hidden" name="show_icon2" value="1" /></button> 
			                </td>
			                
			                
			                <td>
									摄像头2<button class="mwui-switch-btn" id="sxt2"><span change="ON" class="off">OFF</span><input type="hidden" name="open_topbar2" value="0" /></button> 
=======
                 <form action="" method="post">
	                <table>
		                <tr>
			                <td>
								摄像头1<button class="mwui-switch-btn" id="sxt1"><span change="OFF">ON</span><input type="hidden" name="show_icon2" value="1" /></button> 
			                </td>
			                
			                <td style="width:15px;display:inline-block;"></td>
			                
			                <td>
								摄像头2<button class="mwui-switch-btn" id="sxt2"><span change="ON" class="off">OFF</span><input type="hidden" name="open_topbar2" value="0" /></button> 
>>>>>>> refs/remotes/origin/master
			                </td>
			          </tr>
	               </table>
	               
	         <table>

    	    <tr><td><br></td></tr>
    	   	 
    	   	 <tr >
                <td style="width: 35px;">
	                <img src="img/a.png"  id="sxt_1" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="sxt_2" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="sxt_3" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="sxt_4" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="sxt_5" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="sxt_6" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="sxt_7" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="sxt_8" width="15px" height="15px"/> &nbsp;&nbsp;
                </td>
	          <tr/>
	          
	          <tr><td><br></td></tr>
	          
    	    	<!-- 发送数据 -->
    	    		<tr style="color: red ;" >
    	    		<td>
	    	    		只能输入16进制HEX数据(即0~9,A~F)
    	    		</td>
    	    		</tr>
    	    		<tr style="height: 10px;" >
    	    		<td></td>
    	    		</tr>
    	    	<tr>
					<td><textarea id="#" name="#"
							style="width: 300px; height: 50px; border: 1px solid #DDDDDD;"
							validType="length[0,30]" invalidMessage="不能超过30个字符"
							missingMessage="必填项" required="true">在此输入需要发送的数据</textarea> 
					</td>
					<td>
						<span>
							<input type="button" name="#"  id="#" value="发送数据"/> 
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<span style="color: red" >输入内容不超过30字符</span>
					</td>
				</tr>
				
				<tr><td><br/></td></tr>
    	    
    	    	<!-- 接收数据 -->
    	    	<tr>
					<td>
					
					<textarea id="#" name="#"
							style="width: 300px; height: 50px; border: 1px solid #DDDDDD;"
							validType="length[0,30]" invalidMessage="不能超过30个字符"
							missingMessage="必填项" required="true" readonly="readonly">在此显示需要接收的内容</textarea>
					<td>
						<input type="button" name="#"  id="#" value="接收数据"/>
					</td>
				</tr>
				<tr>
					<td>
						<span style="color: red" >输入内容不超过30字符</span>
					</td>
				</tr>
    	    </table>
		</form>
                </div>
                <div class="col-md-1"></div>
            </div>
        </div>
   
</section>
<!--摄像头-->

<!--冰箱-->
<section id="icebox">

     <div class="container">
            <div class="row wow fadeInUp" data-wow-duration="0.5s" data-wow-delay="1s">
                <div class="col-md-1"></div>
                <div class="col-md-8">
                    <h1>冰箱</h1>
                    <p>
                       	 智能云平台最初的发展主要以灯光遥控控制、电器远程控制和电动窗帘控制为主，随着行业的发展，智能控制的功能越来越多，控制的对象不断扩展，控制的联动场景要求更高，其不断延伸到家庭安防报警、背景音乐、可视对讲、门禁指纹控制等领域，可以说智能云平台几乎可以涵盖所有传统的弱电行业，市场发展前景诱人，因此和其产业相关的各路品牌不约而同加大力度争夺智能云平台业务，市场渐成春秋争霸之势。 
                    </p>
                    <img src="img/ddd.jpg" class="img-responsive" alt="这是一张图片" width="62%" height="62%"/>
                </div>
                <div class="col-md-2">
                 <!-- 测试按钮 -->
                <br/> <br/> <br/> <br/>
                <br/> <br/> <br/> <br/>
                
                 <form action="" method="post">
	                <table>
		                <tr>
			                <td>
								电冰箱1<button class="mwui-switch-btn" id="dbx1"><span change="OFF">ON</span><input type="hidden" name="show_icon2" value="1" /></button> 
			                </td>
			                
			                <td style="width:15px;display:inline-block;"></td>
			                
			                <td>
								电冰箱2<button class="mwui-switch-btn" id="dbx2"><span change="ON" class="off">OFF</span><input type="hidden" name="open_topbar2" value="0" /></button> 
			                </td>
			          </tr>
	               </table>
	               
	         <table>

    	    <tr><td><br></td></tr>
    	   	 
    	   	 <tr >
                <td style="width: 35px;">
	                <img src="img/a.png"  id="dbx_1" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="dbx_2" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="dbx_3" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="dbx_4" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="dbx_5" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="dbx_6" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="dbx_7" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="dbx_8" width="15px" height="15px"/> &nbsp;&nbsp;
                </td>
	          <tr/>
	          
	          <tr><td><br></td></tr>
	          
    	    	<!-- 发送数据 -->
    	    		<tr style="color: red ;" >
    	    		<td>
	    	    		只能输入16进制HEX数据(即0~9,A~F)
    	    		</td>
    	    		</tr>
    	    		<tr style="height: 10px;" >
    	    		<td></td>
    	    		</tr>
    	    	<tr>
					<td><textarea id="#" name="#"
							style="width: 300px; height: 50px; border: 1px solid #DDDDDD;"
							validType="length[0,30]" invalidMessage="不能超过30个字符"
							missingMessage="必填项" required="true">在此输入需要发送的数据</textarea> 
					</td>
					<td>
						<span>
							<input type="button" name="test"  id="btnf" value="发送数据"/> 
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<span style="color: red" >输入内容不超过30字符</span>
					</td>
				</tr>
				
				<tr><td><br/></td></tr>
    	    
    	    	<!-- 接收数据 -->
    	    	<tr>
					<td>
					
					<textarea id="#" name="#"
							style="width: 300px; height: 50px; border: 1px solid #DDDDDD;"
							validType="length[0,30]" invalidMessage="不能超过30个字符"
							missingMessage="必填项" required="true" readonly="readonly">在此显示需要接收的内容</textarea>
					<td>
						<input type="button" name="#"  id="#" value="接收数据"/>
					</td>
				</tr>
				<tr>
					<td>
						<span style="color: red" >输入内容不超过30字符</span>
					</td>
				</tr>
    	    </table>
		</form>
                </div>
                <div class="col-md-1"></div>
            </div>
        </div>
     
</section>
<!--冰箱-->

<!--电饭锅-->
<section id="electricPot">
   
     <div class="container">
            <div class="row wow fadeInUp" data-wow-duration="0.5s" data-wow-delay="1s">
                <div class="col-md-1"></div>
                <div class="col-md-8">
                    <h1>电饭锅</h1>
                    <p>
                       	 智能云平台最初的发展主要以灯光遥控控制、电器远程控制和电动窗帘控制为主，随着行业的发展，智能控制的功能越来越多，控制的对象不断扩展，控制的联动场景要求更高，其不断延伸到家庭安防报警、背景音乐、可视对讲、门禁指纹控制等领域，可以说智能云平台几乎可以涵盖所有传统的弱电行业，市场发展前景诱人，因此和其产业相关的各路品牌不约而同加大力度争夺智能云平台业务，市场渐成春秋争霸之势。 
                    </p>
                    <img src="img/ddd.jpg" class="img-responsive" alt="这是一张图片" width="62%" height="62%"/>
                </div>
                <div class="col-md-2">
                 <!-- 测试按钮 -->
                <br/> <br/> <br/> <br/>
                <br/> <br/> <br/> <br/>
                
                 <form action="" method="post">
	                <table>
		                <tr>
			                <td>
								电饭锅1<button class="mwui-switch-btn" id="dfg1"><span change="OFF">ON</span><input type="hidden" name="show_icon2" value="1" /></button> 
			                </td>
			                
			                <td style="width:15px;display:inline-block;"></td>
			                
			                <td>
								电饭锅2<button class="mwui-switch-btn" id="dfg2"><span change="ON" class="off">OFF</span><input type="hidden" name="open_topbar2" value="0" /></button> 
			                </td>
			          </tr>
	               </table>
	               
	         <table>

    	    <tr><td><br></td></tr>
    	   	 
    	   	 <tr >
                <td style="width: 35px;">
	                <img src="img/a.png"  id="dfg_1" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="dfg_2" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="dfg_3" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="dfg_4" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="dfg_5" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="dfg_6" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="dfg_7" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="dfg_8" width="15px" height="15px"/> &nbsp;&nbsp;
                </td>
	          <tr/>
	          
	          <tr><td><br></td></tr>
	          
    	    	<!-- 发送数据 -->
    	    		<tr style="color: red ;" >
    	    		<td>
	    	    		只能输入16进制HEX数据(即0~9,A~F)
    	    		</td>
    	    		</tr>
    	    		<tr style="height: 10px;" >
    	    		<td></td>
    	    		</tr>
    	    	<tr>
					<td><textarea id="#" name="#"
							style="width: 300px; height: 50px; border: 1px solid #DDDDDD;"
							validType="length[0,30]" invalidMessage="不能超过30个字符"
							missingMessage="必填项" required="true">在此输入需要发送的数据</textarea> 
					</td>
					<td>
						<span>
							<input type="button" name="#"  id="#" value="发送数据"/> 
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<span style="color: red" >输入内容不超过30字符</span>
					</td>
				</tr>
				
				<tr><td><br/></td></tr>
    	    
    	    	<!-- 接收数据 -->
    	    	<tr>
					<td>
					
					<textarea id="#" name="#"
							style="width: 300px; height: 50px; border: 1px solid #DDDDDD;"
							validType="length[0,30]" invalidMessage="不能超过30个字符"
							missingMessage="必填项" required="true" readonly="readonly">在此显示需要接收的内容</textarea>
					<td>
						<input type="button" name="#"  id="#" value="接收数据"/>
					</td>
				</tr>
				<tr>
					<td>
						<span style="color: red" >输入内容不超过30字符</span>
					</td>
				</tr>
    	    </table>
		</form>
                </div>
                <div class="col-md-1"></div>
            </div>
        </div>
     
</section>
<!--电饭锅-->

<!--电视机-->
<section id="TV">
   
     <div class="container">
            <div class="row wow fadeInUp" data-wow-duration="0.5s" data-wow-delay="1s">
                <div class="col-md-1"></div>
                <div class="col-md-8">
                    <h1>电视机</h1>
                    <p>
                       	 智能云平台最初的发展主要以灯光遥控控制、电器远程控制和电动窗帘控制为主，随着行业的发展，智能控制的功能越来越多，控制的对象不断扩展，控制的联动场景要求更高，其不断延伸到家庭安防报警、背景音乐、可视对讲、门禁指纹控制等领域，可以说智能云平台几乎可以涵盖所有传统的弱电行业，市场发展前景诱人，因此和其产业相关的各路品牌不约而同加大力度争夺智能云平台业务，市场渐成春秋争霸之势。 
                    </p>
                    <img src="img/ddd.jpg" class="img-responsive" alt="这是一张图片" width="62%" height="62%"/>
                </div>
                <div class="col-md-2">
                 <!-- 测试按钮 -->
                <br/> <br/> <br/> <br/>
                <br/> <br/> <br/> <br/>
                
                 <form action="" method="post">
	                <table>
		                <tr>
			                <td>
								电视机1<button class="mwui-switch-btn" id="TV1"><span change="OFF">ON</span><input type="hidden" name="show_icon2" value="1" /></button> 
			                </td>
			                
			                <td style="width:15px;display:inline-block;"></td>
			                
			                <td>
								电视机2<button class="mwui-switch-btn" id="TV2"><span change="ON" class="off">OFF</span><input type="hidden" name="open_topbar2" value="0" /></button> 
			                </td>
			          </tr>
	               </table>
	               
	         <table>

    	    <tr><td><br></td></tr>
    	   	 
    	   	 <tr >
                <td style="width: 35px;">
	                <img src="img/a.png"  id="TV_1" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="TV_2" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="TV_3" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="TV_4" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="TV_5" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="TV_6" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="TV_7" width="15px" height="15px"/> &nbsp;&nbsp;
	                <img src="img/a.png"  id="TV_8" width="15px" height="15px"/> &nbsp;&nbsp;
                </td>
	          <tr/>
	          
	          <tr><td><br></td></tr>
	          
    	    	<!-- 发送数据 -->
    	    		<tr style="color: red ;" >
    	    		<td>
	    	    		只能输入16进制HEX数据(即0~9,A~F)
    	    		</td>
    	    		</tr>
    	    		<tr style="height: 10px;" >
    	    		<td></td>
    	    		</tr>
    	    	<tr>
					<td><textarea id="#" name="#"
							style="width: 300px; height: 50px; border: 1px solid #DDDDDD;"
							validType="length[0,30]" invalidMessage="不能超过30个字符"
							missingMessage="必填项" required="true">在此输入需要发送的数据</textarea> 
					</td>
					<td>
						<span>
							<input type="button" name="#"  id="#" value="发送数据"/> 
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<span style="color: red" >输入内容不超过30字符</span>
					</td>
				</tr>
				
				<tr><td><br/></td></tr>
    	    
    	    	<!-- 接收数据 -->
    	    	<tr>
					<td>
					
					<textarea id="#" name="#"
							style="width: 300px; height: 50px; border: 1px solid #DDDDDD;"
							validType="length[0,30]" invalidMessage="不能超过30个字符"
							missingMessage="必填项" required="true" readonly="readonly">在此显示需要接收的内容</textarea>
					<td>
						<input type="button" name="#"  id="#" value="接收数据"/>
					</td>
				</tr>
				<tr>
					<td>
						<span style="color: red" >输入内容不超过30字符</span>
					</td>
				</tr>
    	    </table>
		</form>
                </div>
                <div class="col-md-1"></div>
            </div>
        </div>
     
</section>
<!--电视机-->


<!--###-->
<section id="#">
   
     <div class="container">
            <div class="row wow fadeInUp" data-wow-duration="0.5s" data-wow-delay="1s">
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <h1></h1>
                    <p>
                    </p>
                </div>
                <div class="col-md-1"></div>
            </div>
        </div>
     
</section>
<!--###-->


<!--footer-->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <p>
                    Copyright&nbsp;©&nbsp;2013-2017&nbsp;&nbsp;www.gaogaoyanjiu.com&nbsp;&nbsp;蜀ICP备13014270号-4
                </p>
            </div>
        </div>
    </div>
</footer>
<!--footer-->
<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.singlePageNav.min.js"></script>
<script src="js/wow.min.js"></script>
<script>
    $(function(){
        /*导航跳转效果插件*/
        $('.nav').singlePageNav({
            offset:70
        });
        /*小屏幕导航点击关闭菜单*/
        $('.navbar-collapse a').click(function(){
            $('.navbar-collapse').collapse('hide');
        });
        new WOW().init();
    })
</script>
</body>
</html>