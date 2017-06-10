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
		font-size:14px;
		height:18px;
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
		$('.mwui-switch-btn').each(function() {
			$(this).bind("click", function() { 
				var btn = $(this).find("span");
				var change = btn.attr("change");
				btn.toggleClass('off'); 

				if(btn.attr("class") == 'off') { 
					$(this).find("input").val("0");
					btn.attr("change", btn.html()); 
					btn.html(change);
				} else { 
					$(this).find("input").val("1");
					btn.attr("change", btn.html()); 
					btn.html(change);
				}  

				return false;
			});
		});

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
                
                <!--  -->
                <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/>
                <form action="" method="post">
	                <table>
		                <tr>
			                <td>
								电灯1<button class="mwui-switch-btn"><span change="开" class="off">关</span><input type="hidden" name="show_icon" value="0" /></button> 
			                </td>
			                 <td style="width:15px;display:inline-block;"></td>
			                <td>
								电灯2<button class="mwui-switch-btn"><span change="关">开</span><input type="hidden" name="open_topbar" value="1" /></button> 
			                </td>
		                </tr>
		                
		                <tr style="height:15px;display:inline-block;"></tr>
		                
		                <tr>
			                <td>
								空调1<button class="mwui-switch-btn"><span change="OFF">ON</span><input type="hidden" name="show_icon2" value="1" /></button> 
			                </td>
			                
			                <td style="width:15px;display:inline-block;"></td>
			                
			                <td>
								空调2<button class="mwui-switch-btn"><span change="ON" class="off">OFF</span><input type="hidden" name="open_topbar2" value="0" /></button> 
			                </td>
			                
			                <tr>
			                <td>
								<input type="submit" id="submit" value="提交" />
			                </td>
			                </tr>
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
                       	 智能云平台最初的发展主要以灯光遥控控制、电器远程控制和电动窗帘控制为主，随着行业的发展，智能控制的功能越来越多，控制的对象不断扩展，控制的联动场景要求更高，其不断延伸到家庭安防报警、背景音乐、可视对讲、门禁指纹控制等领域，可以说智能云平台几乎可以涵盖所有传统的弱电行业，市场发展前景诱人，因此和其产业相关的各路品牌不约而同加大力度争夺智能云平台业务，市场渐成春秋争霸之势。 
                    </p>
                    <img src="img/ddd.jpg" class="img-responsive" alt="这是一张图片" width="62%" height="62%"/>
                </div>
                <div class="col-md-2">
                
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