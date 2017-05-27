<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
   <title>ajax请求测试页面</title>
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
		padding:4px 5px 2px 5px;
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
      $(function(){
    	    $("#btn1").click(function(){
    	        $.post("http://localhost:8081/testComIO/COMServlet",{btn1:"AA"},function(data){
    	           // window.location.href="ServletAjax";
    	           /*  $("#btn1").val("关闭");
    	            $("#btn2").val("关闭"); */
    	            document.getElementById("img1").src="img/b.png";
    	            document.getElementById("img2").src="img/b.png";
    	           alert(data);
    	            
    	        });
    	     });
    	    
    	    $("#btn2").click(function(){
    	        $.post("http://localhost:8081/testComIO/COMServlet",{btn2:"02"},function(data){
    	            //window.location.href="ServletAjax";
    	        	 /* $("#btn1").val("开启");
     	             $("#btn2").val("开启"); */
     	            $("#img1").attr('src','img/a.png');
     	            $("#img2").attr('src','img/a.png');
    	        	
    	        });
    	    });
    	});
   </script>
    	
    	
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
	});
</script> 
</head>
    <body>
    <img alt="" src="img/qq.jpg" width="50px" height="50px">
    <img alt="" src="img/znjj.jpg">
    <img alt="" src="img/timg.jpg" >
    <img alt="" src="img/aaa.jpg" >
    <img alt="" src= "img/bbb.jpg">
    <img alt="" src= "img/ddd.jpg">
    <img alt="" src="img/fff.jpg" >
    <img alt="" src= "img/ccc.png">
    <h1>
    <a href="http://www.315433.com/jukzt.htm">智能数字网关系统图拓扑图</a>
    </h1>
    	<form action="" method="post">
	电灯1<button class="mwui-switch-btn"><span change="开" class="off">关</span><input type="hidden" name="show_icon" value="0" /></button> 
	电灯2<button class="mwui-switch-btn"><span change="关">开</span><input type="hidden" name="open_topbar" value="1" /></button> 
	<br />
	空调1<button class="mwui-switch-btn"><span change="OFF">ON</span><input type="hidden" name="show_icon2" value="1" /></button> 
	空调2<button class="mwui-switch-btn"><span change="ON" class="off">OFF</span><input type="hidden" name="open_topbar2" value="0" /></button> 
	<br />
	<input type="submit" id="submit" value="提交" />
</form>
    	    <br/>
    	    <br/>
    	    <br/>
    	    <br/>
    		&nbsp;&nbsp;&nbsp;&nbsp;<img src="img/a.png"  id="img1" width="15px" height="15px">
    	    <input type="button" name="test"  id="btn1" value="开启"/>
    	    &nbsp;&nbsp;&nbsp;&nbsp;
    	   <!--  <input type="text" name="text1"  id="text1" /> -->
    	    <textarea rows="3" cols="50">
			在此输入需要发送的内容
			</textarea>
    	    
    	   <input type="button" name="test"  id="btnf" value="发送数据"/> 
    	    <br/>
    	    <br/>
    		&nbsp;&nbsp;&nbsp;&nbsp;
    		<img src="img/b.png"  id="img2" width="15px" height="15px">
    	    <input type="button" name="test"  id="btn2" value="关闭"/>
    	    &nbsp;&nbsp;&nbsp;&nbsp;
    	    
    	  <!--   <input type="text" name="text2"  id="text2" /> -->
    	  
    	  <textarea rows="3" cols="50">
		       在此显示需要接收的内容
		  </textarea>
    	    <input type="button" name="test"  id="btnf" value="接收数据"/>
    	    
    	    
    	    
    	</body>
    	</html>