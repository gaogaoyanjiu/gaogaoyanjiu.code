<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
    <link href="TryDemo_files/1.css" rel="stylesheet" type="text/css">
    <script src="TryDemo_files/jquery.js" type="text/javascript"></script>
    <script src="TryDemo_files/shCore.js" type="text/javascript"></script>
    <script src="TryDemo_files/shBrushJScript.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="TryDemo_files/shCoreDefault.css">
	<style type="text/css" id="igtranslator-color"></style></head><body onbeforeunload="closeSession();">
    <script src="TryDemo_files/jquery_002.js" type="text/javascript"></script>
    <script type="text/javascript">
        var cameraCode = "05382050000000000101#c04e57371ee0443da9dd8cbce3ce24af";
        //第一次初始化方法
        function FirstLoad() {
            if (ocx) {
                var result = ocx.IVS_OCX_Init();
                if (result == 0) {
                    //隐藏工具栏
                    ocx.IVS_OCX_ShowToolbar(0);

                    //隐藏标题栏
                    ocx.IVS_OCX_ShowTitlebar(0);

                    // 设置OCX界面色调： "1"为黑色(暗色调) ，"2"为白色(亮色调)
                    ocx.IVS_OCX_SetSkin(1);
                    //显示方式：1-原始比例 2-铺满窗格
                    ocx.IVS_OCX_SetDisplayScale(2);

                    // 设置登录参数
                    var user = "HuaweiDEMO";
                    var pwd = "Huawei@54321";
                    var ip = "172.19.33.102";
                    var port = "9900";
                    // 登录
                    var result = ocx.IVS_OCX_Login(user, pwd, ip, port, 1);
                    //alert(result);
                    result += ocx.IVS_OCX_SetWndLayout(11);
                    //                    StartRealPlay();
                    if (result == 0) {
                        $("#CameraStatusImage").attr("src", "imgs/camera_able.png");
                    }
                }
            }
            else {
               // alert("无法加载OCX");
            }
        }


        //键盘事件
        document.onkeydown = function (event) {
            var e = event || window.event || arguments.callee.caller.arguments[0];
            if (e) {
                //如果没有播放直接返回
                if (!ocx) {
                    return;
                }
                if (!isInPlay) {
                    return;
                }
                //alert(e.keyCode);
                if (e.keyCode == 38) //up
                {
                    ptzmouseclick(3);
                    setTimeout("ptzmouseup(3)", 100)
                }
                else if (e.keyCode == 37) //left
                {
                    ptzmouseclick(1);
                    setTimeout("ptzmouseup(1)", 100)
                }
                else if (e.keyCode == 40)  //down
                {
                    ptzmouseclick(4);
                    setTimeout("ptzmouseup(4)", 100)
                }
                else if (e.keyCode == 39) //right 
                {
                    ptzmouseclick(2);
                    setTimeout("ptzmouseup(2)", 100)
                }
                else if (e.keyCode == 107)//+
                {
                    mouseclick("L");
                    setTimeout("mouseup('L')", 100)
                }
                else if (e.keyCode == 109) //-
                {
                    mouseclick("S");
                    setTimeout("mouseup('S')", 100)
                }
            }

        }


        //OCX的一些方法
        function StartRealPlay() {
            // 获取播放窗口ID
            var wnd = ocx.IVS_OCX_GetSelectWnd();
            // 设置实况参数
            var pMediaParaxml = "<?xml version='1.0' encoding='utf-8'?><Content><RealplayParam><StreamType>1</StreamType><ProtocolType>2</ProtocolType><DirectFirst>0</DirectFirst><Multicast>0</Multicast></RealplayParam></Content>";
            // 开始实况
            var result = ocx.IVS_OCX_StartRealPlay(pMediaParaxml, cameraCode, wnd);
            //alert("IVS_OCX_StartRealPlay:" + result);
            return result == 0;
        }


        function StopRealPlay() {
            var selectedWnd = ocx.IVS_OCX_GetSelectWnd();
            var result = ocx.IVS_OCX_StopRealPlay(selectedWnd);
            return result == 0;
        }

        function closeSession() {
            try {
                ocx.IVS_OCX_StopAllRealPlay(); // Stop All Playing Live 
                ocx.IVS_OCX_Logout(); // User Logout
                ocx.IVS_OCX_CleanUp(); // Release OCX
                ocx = null;
            }
            catch (e) {
            }
        }
        /*
        *	云台控制方法
        * @param optCode 云台操作类型编码
        */
        function ptzControlMethod(optCode) {
           try
           {
                if (ocx) {
                    // 云台转动模式："1"为点动模式，"2"为连动模式
                    var paramModel = 2;

                    // 云台转动速度：1~10
                    var paramSpeed = 5

                    var selectedWnd = ocx.IVS_OCX_GetSelectWnd();
                    var cameraCode = ocx.IVS_OCX_GetCameraByWnd(selectedWnd);

                    var resultXml = ocx.IVS_OCX_PtzControl(cameraCode, optCode, paramModel, paramSpeed);
					setTimeout("StopPTZControl()", 1000);
                }
            }
            catch(ex)
            {
                //alert(ex);
            }
        }
		
		function StopPTZControl()
		{
		   var paramModel = 2;

          // 云台转动速度：1~10
          var paramSpeed = 5

          var selectedWnd = ocx.IVS_OCX_GetSelectWnd();
          var cameraCode = ocx.IVS_OCX_GetCameraByWnd(selectedWnd);
		   resultXml = ocx.IVS_OCX_PtzControl(cameraCode, 1, paramModel, paramSpeed);
		}

        function GotoPreset(index) {
            try {
                if (ocx) {
                    var optCode = 11;
                    var paramSpeed = 5;

                    var selectedWnd = ocx.IVS_OCX_GetSelectWnd();
                    var cameraCode = ocx.IVS_OCX_GetCameraByWnd(selectedWnd);

                    var resultXml = ocx.IVS_OCX_PtzControl(cameraCode, optCode, index, paramSpeed);
                }
            }
            catch (ex) {
                //alert(ex);
            }
          //  alert(resultXml);
        }


//        function aa() {
//            $(".syntaxhighlighter .code .container div").css("word-break", "break-all");
//            //alert($(".syntaxhighlighter .code .container div").length);
//            $(".syntaxhighlighter .code .container div").each(
//              function (index, element) {
//                  if ($(element).height() > 0) {
//                      $(".syntaxhighlighter .gutter div:eq(" + index + ")").css("height", $(element).height());
//                  }
//                  else {
//                      $(".syntaxhighlighter .gutter div:eq(" + index + ")").css("height","auto")
//                  }
//              }
//            );
//        }

        // Line wrap back
        function Reloadgutter() {
            //alert("bb")
            if ($('.syntaxhighlighter').length == 0) {
                setTimeout(Reloadgutter, 50);
                return;
            }

            $('.syntaxhighlighter').each(function () {
                // Fetch
                var $sh = $(this),
                $gutter = $sh.find('td.gutter'),
                $code = $sh.find('td.code')
                ;
                // Cycle through lines
                $gutter.children('.line').each(function (i) {
                    // Fetch
                    var $gutterLine = $(this),
                    $codeLine = $code.find('.line:nth-child(' + (i + 1) + ')')
                    ;
                    $codeLine.css("word-break", "break-all");
                    //alert($gutterLine);
                    // Fetch height
                    var height = $codeLine.height() || 0;
                    if (!height) {
                        height = 'auto';
                    }
                    else {
                        height = height + 'px';
                        //alert(height);
                    }
                    // Copy height over
                    $gutterLine.attr('style', 'height: ' + height + ' !important'); // fix by Edi, for JQuery 1.7+ under Firefox 15.0
                 
                });
            });
        }
        SyntaxHighlighter.all();
        //加载后界面的操作和一些事件的绑定
        $(document).ready(
         function () {
             $("#codeSampleMenu li").corner();

             $("#YunArea").click(
                 function (ev) {
                     if (!ocx) {
                         return;
                     }
                     if (!isInPlay) {
                         return;
                     }
                     var offset = $(this).offset();
                     var divLeft = offset.left;
                     var divTop = offset.top;
                     var mouseLeft = ev.pageX;
                     var mouseTop = ev.pageY;
                     var arr = $("#Map area");
                     if (arr.length == 0) {
                         return;
                     }
                     // alert(mouseLeft - divLeft);
                     // alert(mouseTop - divTop);
                     for (var index = 0; index < arr.length; index++) {
                         // alert($(arr[index]).attr("coords"));
                         var coords = $(arr[index]).attr("coords").split(",")
                         if (isPointInPolygon(mouseLeft - divLeft, mouseTop - divTop, coords)) {
                             //alert($(arr[index]).attr("coords"));
                             // alert($(arr[index]).attr("relatedId"));
                             var relatedId = $(arr[index]).attr("relatedId");
                             // alert(relatedId);
                             if (relatedId == "yuA") {
                                 mouseclick("A");
                                 //mouseup('A');
                                 setTimeout("mouseup('A')", 100)
                             }
                             else if (relatedId == "yuB") {
                                 mouseclick("B");
                                 setTimeout("mouseup('B')", 100)
                             }
                             else if (relatedId == "leftMode") {
                                 ptzmouseclick(1);
                                 setTimeout("ptzmouseup(1)", 100)
                             }
                             else if (relatedId == "rightMode") {
                                 ptzmouseclick(2);
                                 setTimeout("ptzmouseup(2)", 100)
                             }
                             else if (relatedId == "upMode") {
                                 ptzmouseclick(3);
                                 setTimeout("ptzmouseup(3)", 100)
                             }
                             else if (relatedId == "downMode") {
                                 ptzmouseclick(4);
                                 setTimeout("ptzmouseup(4)", 100)
                             }
                             else if (relatedId == "smallMode") {
                                 mouseclick("S");
                                 setTimeout("mouseup('S')", 100)
                             }
                             else if (relatedId == "bigMode") {
                                 mouseclick("L");
                                 setTimeout("mouseup('L')", 100)
                             }
                             break;
                         }
                     }

                 }
             );

             var cacheCodeArr=[];
             $("#codeSampleMenu li").mouseenter(
               function () {
                   $(this).css("cursor", "pointer");
               }
             ).mouseleave(
                function () {
                    $(this).css("cursor", "auto");
                }
             ).click(
                function () {
                    if (!isInPlay) {
                        return;
                    }

                    $(this).siblings().css("background-color", "");
                    $(this).css("background-color", "#1BB790");
                    //处理代码显示；
                    if ($('div[id="' + $(this).text() + '"').length == 0) {
                        $("#codeSampleContainer>div").hide();
                    }
                    else {
                        if ($('div[id="' + $(this).text() + '"').is(":hidden")) {
                            
                            $('div[id="' + $(this).text() + '"').siblings().hide();
							
							$('div[id="' + $(this).text() + '"').show(0, Reloadgutter);
						
                            var tabtext = $(this).text();
                            if (tabtext == "Left") {
                                ptzmouseclick(1);
                                setTimeout("ptzmouseup(1)", 100)
                            }
                            else if (tabtext == "Right") {
                                ptzmouseclick(2);
                                setTimeout("ptzmouseup(2)", 100)
                            }
                            else if (tabtext == "Up") {
                                ptzmouseclick(3);
                                setTimeout("ptzmouseup(3)", 100)
                            }
                            else if (tabtext == "Down") {
                                ptzmouseclick(4);
                                setTimeout("ptzmouseup(4)", 100)
                            }
                            else if (tabtext == "Zoom in") {
                                mouseclick("L");
                                setTimeout("mouseup('L')", 100)
                            }
                            else if (tabtext == "Zoom out") {
                                mouseclick("S");
                                setTimeout("mouseup('S')", 100)
                            }
                        }
                    }
                }
             )
             ;

             FirstLoad();
             $("#preload").hide();
             $("#MainContainer").show();
             isInPlay = true;
             //$("#MenuUpButton").click();
             isInPlay = false;
         }
        );



         function mouseclick(item) {
             if (item == 'A') {
                 $("#yuA").attr("src", "imgs/yuliu_A_click.png")
                 GotoPreset(1);
             }
             else if (item == 'B') {
                 $("#yuB").attr("src", "imgs/yuliu_B_click.png")
                 GotoPreset(2);
             }
             else if (item == 'S') {
                 $("#smallMode").attr("src", "imgs/S_mov.png");
                 ptzControlMethod(24);
                 $("#MenuZoomOutButton").click();
             }
             else if (item == "L") {
                 $("#bigMode").attr("src", "imgs/L_mov.png");
                 ptzControlMethod(23);
                 $("#MenuZoomInButton").click();
             }
         }
         function mouseup(item) {
            if (item == 'A') {
                $("#yuA").attr("src", "imgs/yuliu_A_normal.png")
                
             }
             else if (item == 'B') {
                 $("#yuB").attr("src", "imgs/yuliu_B_normal.png")
              
             }
             else if (item == 'S') {
                 $("#smallMode").attr("src", "imgs/S.png");
             }
             else if (item == "L") {
                 $("#bigMode").attr("src", "imgs/L.png");
             }
         }


         function ptzmouseclick(mode) {
             if (mode == 1) {
                 $("#leftMode").attr("src", "imgs/control_left_click.png")
                 //setTimeout("ptzControlMethod(4)", 0);
                 ptzControlMethod(4);
                 $('#MenuLeftButton').click();
             }
             else if (mode == 2) {
                 $("#rightMode").attr("src", "imgs/control_right_click.png")
                 //setTimeout("ptzControlMethod(7)", 0);
                 ptzControlMethod(7);
                 $('#MenuRightButton').click();
             }
             else if (mode == 3) {
                 $("#upMode").attr("src", "imgs/control_top_click.png")
                 //setTimeout("ptzControlMethod(2)", 0);
                 ptzControlMethod(2);
                 $('#MenuUpButton').click();
             }
             else {
                 $("#downMode").attr("src", "imgs/control_down_click.png")
                 //setTimeout("ptzControlMethod(3)", 0);
                 ptzControlMethod(3);
                 $('#MenuDownButton').click();
             }
         }

         function ptzmouseup(mode) {
             if (mode == 1) {
                 $("#leftMode").attr("src", "imgs/left.png");
             }
             else if (mode == 2) {
                  $("#rightMode").attr("src", "imgs/right.png");
             }
             else if (mode == 3) {
                 $("#upMode").attr("src", "imgs/up.png");
             }
             else {
                 $("#downMode").attr("src", "imgs/down.png");
             }
         }

         /** 
         * PIP problem, Winding number
         * @param {number} x
         * @param {number} y
         * @param {Array.<number>} coords
         */
         function isPointInPolygon(x, y, coords) {
             var wn = 0;
             for (var shiftP, shift = coords[1] > y, i = 3; i < coords.length; i += 2) {
                 shiftP = shift;
                 shift = coords[i] > y;
                 if (shiftP != shift) {
                     var n = (shiftP ? 1 : 0) - (shift ? 1 : 0);
                     // dot product for vectors (c[0]-x, c[1]-y) . (c[2]-x, c[3]-y)
                     if (n * ((coords[i - 3] - x) * (coords[i - 0] - y) - (coords[i - 2] - y) * (coords[i - 1] - x)) > 0)
                         wn += n;
                 }
             }
             return wn;
         }


         var isInPlay = false;
         function BeginEndPlay() {
             if (!ocx) {
                 return;
             }
             if (isInPlay) {
                 if (StopRealPlay()) {
                     $("#PalyStatusImage").attr("src", "imgs/btn_off.png");
                     $("#CameraStatusImage").attr("src", "imgs/camera_able.png");
                     isInPlay = false;
                 }
             }
             else {
                 if (StartRealPlay()) {
                     $("#PalyStatusImage").attr("src", "imgs/btn_on.png");
                     $("#CameraStatusImage").attr("src", "imgs/camera_using.png");
                     isInPlay = true;
                 }
             }
         
         }
		 
		 // ==============================================页面关闭清理关闭ocx控件================================================================
/**
		 * 退出时使用中断，防止OCX卸载异常，造成浏览器崩溃
		 * 
		 */
		function closeSession()
		{
			if (ocx)
			{
				try
				{
					event.returnValue = alert("Quit, Thanks to experience...");
					logout();
				}
				catch (e)
				{
				}
			}
		}
		
		/**
		 * 退出界面关闭所有资源
		 * Release Ocx Object
		 */
		function logout()
		{
			try
			{
				ocx.IVS_OCX_StopAllRealPlay(); // Stop All Playing Live 
				ocx.IVS_OCX_Logout(); // User Logout
				ocx.IVS_OCX_CleanUp(); // Release OCX
				ocx = null;
				$("#ocx").remove(); // Remove OCX From Html Document
			} 
			catch (e)
			{
			}
		}
    </script>


   <!--
   <div class="overlay" id="preload">
      <img src="TryDemo_files/LOADING.gif">
   </div>

    <div id="MainContainer" class="MainContainer">
       <div id="leftContainer" class="Container Left">
           <div class="ItemTitle">
               <img src="TryDemo_files/line.png" alt="">
               <span>DEMO CODE</span>
           </div>
           <div class="CodeInfoContainer">
               <div id="codeSampleMenu" class="Menu">
                  <ul>
                     <li style="width: 40px; border-radius: 10px;" id="MenuUpButton">Up</li>
                     <li style="width: 40px; border-radius: 10px;" id="MenuDownButton">Down</li>
                     <li style="width: 40px; border-radius: 10px;" id="MenuLeftButton">Left</li>
                     <li style="width: 40px; border-radius: 10px;" id="MenuRightButton">Right</li>
                     <li style="width: 60px; border-radius: 10px;" id="MenuZoomInButton">Zoom in</li>
                     <li style="width: 60px; border-radius: 10px;" id="MenuZoomOutButton">Zoom out</li>
                  </ul>
               </div>
               <div id="codeSampleContainer" class="CodeSampleContainer">
                  <div style="display :none" id="Up">
                    <div><div id="highlighter_492818" class="syntaxhighlighter  js"><table cellspacing="0" cellpadding="0" border="0"><tbody><tr><td class="gutter"><div class="line number1 index0 alt2">1</div><div class="line number2 index1 alt1">2</div><div class="line number3 index2 alt2">3</div><div class="line number4 index3 alt1">4</div><div class="line number5 index4 alt2">5</div><div class="line number6 index5 alt1">6</div><div class="line number7 index6 alt2">7</div><div class="line number8 index7 alt1">8</div><div class="line number9 index8 alt2">9</div><div class="line number10 index9 alt1">10</div><div class="line number11 index10 alt2">11</div><div class="line number12 index11 alt1">12</div><div class="line number13 index12 alt2">13</div><div class="line number14 index13 alt1">14</div></td><td class="code"><div class="container"><div class="line number1 index0 alt2"><code class="js keyword">var</code> <code class="js plain">cameraCode = </code><code class="js string">"07479370000000000101#4322119b0bd34114861e3ac662c13277"</code><code class="js plain">;</code></div><div class="line number2 index1 alt1">&nbsp;</div><div class="line number3 index2 alt2"><code class="js comments">//云台操作类型编码</code></div><div class="line number4 index3 alt1"><code class="js keyword">var</code> <code class="js plain">optCode = 2;</code></div><div class="line number5 index4 alt2">&nbsp;</div><div class="line number6 index5 alt1"><code class="js comments">// 云台转动模式："1"为点动模式，"2"为连动模式</code></div><div class="line number7 index6 alt2"><code class="js keyword">var</code> <code class="js plain">paramModel = 1;</code></div><div class="line number8 index7 alt1">&nbsp;</div><div class="line number9 index8 alt2"><code class="js comments">// 云台转动速度：1~10</code></div><div class="line number10 index9 alt1"><code class="js keyword">var</code> <code class="js plain">paramSpeed = 5;</code></div><div class="line number11 index10 alt2">&nbsp;</div><div class="line number12 index11 alt1"><code class="js keyword">var</code> <code class="js plain">selectedWnd = ocx.IVS_OCX_GetSelectWnd();</code></div><div class="line number13 index12 alt2"><code class="js keyword">var</code> <code class="js plain">cameraCode = ocx.IVS_OCX_GetCameraByWnd(selectedWnd);</code></div><div class="line number14 index13 alt1"><code class="js keyword">var</code> <code class="js plain">resultXml = ocx.IVS_OCX_PtzControl(cameraCode, optCode, paramModel, paramSpeed);</code></div></div></td></tr></tbody></table></div></div>
                      </div>
                      <div style="display :none" id="Down">
                         <div><div id="highlighter_67952" class="syntaxhighlighter  js"><table cellspacing="0" cellpadding="0" border="0"><tbody><tr><td class="gutter"><div class="line number1 index0 alt2">1</div><div class="line number2 index1 alt1">2</div><div class="line number3 index2 alt2">3</div><div class="line number4 index3 alt1">4</div><div class="line number5 index4 alt2">5</div><div class="line number6 index5 alt1">6</div><div class="line number7 index6 alt2">7</div><div class="line number8 index7 alt1">8</div><div class="line number9 index8 alt2">9</div><div class="line number10 index9 alt1">10</div><div class="line number11 index10 alt2">11</div><div class="line number12 index11 alt1">12</div><div class="line number13 index12 alt2">13</div><div class="line number14 index13 alt1">14</div></td><td class="code"><div class="container"><div class="line number1 index0 alt2"><code class="js keyword">var</code> <code class="js plain">cameraCode = </code><code class="js string">"07479370000000000101#4322119b0bd34114861e3ac662c13277"</code><code class="js plain">; </code></div><div class="line number2 index1 alt1">&nbsp;</div><div class="line number3 index2 alt2"><code class="js comments">//云台操作类型编码</code></div><div class="line number4 index3 alt1"><code class="js keyword">var</code> <code class="js plain">optCode = 3;</code></div><div class="line number5 index4 alt2">&nbsp;</div><div class="line number6 index5 alt1"><code class="js comments">// 云台转动模式："1"为点动模式，"2"为连动模式</code></div><div class="line number7 index6 alt2"><code class="js keyword">var</code> <code class="js plain">paramModel = 1;</code></div><div class="line number8 index7 alt1">&nbsp;</div><div class="line number9 index8 alt2"><code class="js comments">// 云台转动速度：1~10</code></div><div class="line number10 index9 alt1"><code class="js keyword">var</code> <code class="js plain">paramSpeed = 5;</code></div><div class="line number11 index10 alt2">&nbsp;</div><div class="line number12 index11 alt1"><code class="js keyword">var</code> <code class="js plain">selectedWnd = ocx.IVS_OCX_GetSelectWnd();</code></div><div class="line number13 index12 alt2"><code class="js keyword">var</code> <code class="js plain">cameraCode = ocx.IVS_OCX_GetCameraByWnd(selectedWnd);</code></div><div class="line number14 index13 alt1"><code class="js keyword">var</code> <code class="js plain">resultXml = ocx.IVS_OCX_PtzControl(cameraCode, optCode, paramModel, paramSpeed);</code></div></div></td></tr></tbody></table></div></div>
                      </div>
                      <div style="display :none" id="Left">
                         <div><div id="highlighter_358876" class="syntaxhighlighter  js"><table cellspacing="0" cellpadding="0" border="0"><tbody><tr><td class="gutter"><div class="line number1 index0 alt2">1</div><div class="line number2 index1 alt1">2</div><div class="line number3 index2 alt2">3</div><div class="line number4 index3 alt1">4</div><div class="line number5 index4 alt2">5</div><div class="line number6 index5 alt1">6</div><div class="line number7 index6 alt2">7</div><div class="line number8 index7 alt1">8</div><div class="line number9 index8 alt2">9</div><div class="line number10 index9 alt1">10</div><div class="line number11 index10 alt2">11</div><div class="line number12 index11 alt1">12</div><div class="line number13 index12 alt2">13</div><div class="line number14 index13 alt1">14</div></td><td class="code"><div class="container"><div class="line number1 index0 alt2"><code class="js keyword">var</code> <code class="js plain">cameraCode = </code><code class="js string">"07479370000000000101#4322119b0bd34114861e3ac662c13277"</code><code class="js plain">;</code></div><div class="line number2 index1 alt1">&nbsp;</div><div class="line number3 index2 alt2"><code class="js comments">//云台操作类型编码</code></div><div class="line number4 index3 alt1"><code class="js keyword">var</code> <code class="js plain">optCode = 4;</code></div><div class="line number5 index4 alt2">&nbsp;</div><div class="line number6 index5 alt1"><code class="js comments">// 云台转动模式："1"为点动模式，"2"为连动模式</code></div><div class="line number7 index6 alt2"><code class="js keyword">var</code> <code class="js plain">paramModel = 1;</code></div><div class="line number8 index7 alt1">&nbsp;</div><div class="line number9 index8 alt2"><code class="js comments">// 云台转动速度：1~10</code></div><div class="line number10 index9 alt1"><code class="js keyword">var</code> <code class="js plain">paramSpeed = 5;</code></div><div class="line number11 index10 alt2">&nbsp;</div><div class="line number12 index11 alt1"><code class="js keyword">var</code> <code class="js plain">selectedWnd = ocx.IVS_OCX_GetSelectWnd();</code></div><div class="line number13 index12 alt2"><code class="js keyword">var</code> <code class="js plain">cameraCode = ocx.IVS_OCX_GetCameraByWnd(selectedWnd);</code></div><div class="line number14 index13 alt1"><code class="js keyword">var</code> <code class="js plain">resultXml = ocx.IVS_OCX_PtzControl(cameraCode, optCode, paramModel, paramSpeed);</code></div></div></td></tr></tbody></table></div></div>
                      </div>
                      <div style="display :none" id="Right">
                         <div><div id="highlighter_928687" class="syntaxhighlighter  js"><table cellspacing="0" cellpadding="0" border="0"><tbody><tr><td class="gutter"><div class="line number1 index0 alt2">1</div><div class="line number2 index1 alt1">2</div><div class="line number3 index2 alt2">3</div><div class="line number4 index3 alt1">4</div><div class="line number5 index4 alt2">5</div><div class="line number6 index5 alt1">6</div><div class="line number7 index6 alt2">7</div><div class="line number8 index7 alt1">8</div><div class="line number9 index8 alt2">9</div><div class="line number10 index9 alt1">10</div><div class="line number11 index10 alt2">11</div><div class="line number12 index11 alt1">12</div><div class="line number13 index12 alt2">13</div><div class="line number14 index13 alt1">14</div></td><td class="code"><div class="container"><div class="line number1 index0 alt2"><code class="js keyword">var</code> <code class="js plain">cameraCode = </code><code class="js string">"07479370000000000101#4322119b0bd34114861e3ac662c13277"</code><code class="js plain">;</code></div><div class="line number2 index1 alt1">&nbsp;</div><div class="line number3 index2 alt2"><code class="js comments">//云台操作类型编码</code></div><div class="line number4 index3 alt1"><code class="js keyword">var</code> <code class="js plain">optCode = 7;</code></div><div class="line number5 index4 alt2">&nbsp;</div><div class="line number6 index5 alt1"><code class="js comments">// 云台转动模式："1"为点动模式，"2"为连动模式</code></div><div class="line number7 index6 alt2"><code class="js keyword">var</code> <code class="js plain">paramModel = 1;</code></div><div class="line number8 index7 alt1">&nbsp;</div><div class="line number9 index8 alt2"><code class="js comments">// 云台转动速度：1~10</code></div><div class="line number10 index9 alt1"><code class="js keyword">var</code> <code class="js plain">paramSpeed = 5;</code></div><div class="line number11 index10 alt2">&nbsp;</div><div class="line number12 index11 alt1"><code class="js keyword">var</code> <code class="js plain">selectedWnd = ocx.IVS_OCX_GetSelectWnd();</code></div><div class="line number13 index12 alt2"><code class="js keyword">var</code> <code class="js plain">cameraCode = ocx.IVS_OCX_GetCameraByWnd(selectedWnd);</code></div><div class="line number14 index13 alt1"><code class="js keyword">var</code> <code class="js plain">resultXml = ocx.IVS_OCX_PtzControl(cameraCode, optCode, paramModel, paramSpeed);</code></div></div></td></tr></tbody></table></div></div>
                      </div>
                      <div style="display :none" id="Zoom in">
                         <div><div id="highlighter_231467" class="syntaxhighlighter  js"><table cellspacing="0" cellpadding="0" border="0"><tbody><tr><td class="gutter"><div class="line number1 index0 alt2">1</div><div class="line number2 index1 alt1">2</div><div class="line number3 index2 alt2">3</div><div class="line number4 index3 alt1">4</div><div class="line number5 index4 alt2">5</div><div class="line number6 index5 alt1">6</div><div class="line number7 index6 alt2">7</div><div class="line number8 index7 alt1">8</div><div class="line number9 index8 alt2">9</div><div class="line number10 index9 alt1">10</div><div class="line number11 index10 alt2">11</div><div class="line number12 index11 alt1">12</div><div class="line number13 index12 alt2">13</div><div class="line number14 index13 alt1">14</div></td><td class="code"><div class="container"><div class="line number1 index0 alt2"><code class="js keyword">var</code> <code class="js plain">cameraCode = </code><code class="js string">"07479370000000000101#4322119b0bd34114861e3ac662c13277"</code><code class="js plain">;</code></div><div class="line number2 index1 alt1">&nbsp;</div><div class="line number3 index2 alt2"><code class="js comments">//云台操作类型编码</code></div><div class="line number4 index3 alt1"><code class="js keyword">var</code> <code class="js plain">optCode = 23;</code></div><div class="line number5 index4 alt2">&nbsp;</div><div class="line number6 index5 alt1"><code class="js comments">// 云台转动模式："1"为点动模式，"2"为连动模式</code></div><div class="line number7 index6 alt2"><code class="js keyword">var</code> <code class="js plain">paramModel = 1;</code></div><div class="line number8 index7 alt1">&nbsp;</div><div class="line number9 index8 alt2"><code class="js comments">// 云台转动速度：1~10</code></div><div class="line number10 index9 alt1"><code class="js keyword">var</code> <code class="js plain">paramSpeed = 5;</code></div><div class="line number11 index10 alt2">&nbsp;</div><div class="line number12 index11 alt1"><code class="js keyword">var</code> <code class="js plain">selectedWnd = ocx.IVS_OCX_GetSelectWnd();</code></div><div class="line number13 index12 alt2"><code class="js keyword">var</code> <code class="js plain">cameraCode = ocx.IVS_OCX_GetCameraByWnd(selectedWnd);</code></div><div class="line number14 index13 alt1"><code class="js keyword">var</code> <code class="js plain">resultXml = ocx.IVS_OCX_PtzControl(cameraCode, optCode, paramModel, paramSpeed);</code></div></div></td></tr></tbody></table></div></div>
                      </div>
                      <div style="display :none" id="Zoom out">
                         <div><div id="highlighter_44320" class="syntaxhighlighter  js"><table cellspacing="0" cellpadding="0" border="0"><tbody><tr><td class="gutter"><div class="line number1 index0 alt2">1</div><div class="line number2 index1 alt1">2</div><div class="line number3 index2 alt2">3</div><div class="line number4 index3 alt1">4</div><div class="line number5 index4 alt2">5</div><div class="line number6 index5 alt1">6</div><div class="line number7 index6 alt2">7</div><div class="line number8 index7 alt1">8</div><div class="line number9 index8 alt2">9</div><div class="line number10 index9 alt1">10</div><div class="line number11 index10 alt2">11</div><div class="line number12 index11 alt1">12</div><div class="line number13 index12 alt2">13</div><div class="line number14 index13 alt1">14</div></td><td class="code"><div class="container"><div class="line number1 index0 alt2"><code class="js keyword">var</code> <code class="js plain">cameraCode = </code><code class="js string">"07479370000000000101#4322119b0bd34114861e3ac662c13277"</code><code class="js plain">;</code></div><div class="line number2 index1 alt1">&nbsp;</div><div class="line number3 index2 alt2"><code class="js comments">//云台操作类型编码</code></div><div class="line number4 index3 alt1"><code class="js keyword">var</code> <code class="js plain">optCode = 24;</code></div><div class="line number5 index4 alt2">&nbsp;</div><div class="line number6 index5 alt1"><code class="js comments">// 云台转动模式："1"为点动模式，"2"为连动模式</code></div><div class="line number7 index6 alt2"><code class="js keyword">var</code> <code class="js plain">paramModel = 1;</code></div><div class="line number8 index7 alt1">&nbsp;</div><div class="line number9 index8 alt2"><code class="js comments">// 云台转动速度：1~10</code></div><div class="line number10 index9 alt1"><code class="js keyword">var</code> <code class="js plain">paramSpeed = 5;</code></div><div class="line number11 index10 alt2">&nbsp;</div><div class="line number12 index11 alt1"><code class="js keyword">var</code> <code class="js plain">selectedWnd = ocx.IVS_OCX_GetSelectWnd();</code></div><div class="line number13 index12 alt2"><code class="js keyword">var</code> <code class="js plain">cameraCode = ocx.IVS_OCX_GetCameraByWnd(selectedWnd);</code></div><div class="line number14 index13 alt1"><code class="js keyword">var</code> <code class="js plain">resultXml = ocx.IVS_OCX_PtzControl(cameraCode, optCode, paramModel, paramSpeed);</code></div></div></td></tr></tbody></table></div></div>
                      </div>
               </div>
          </div>
       </div>
       
       
       
       <div id="middlerContainer" class="Container Middle">
           <div class="ItemTitle">
               <img src="TryDemo_files/line.png" alt="">
               <span>视频显示</span>
           </div>
           <div class="OCXContain">
               	<object id="ocx" style="width:100%;height: 100%;" classid="CLSID:3556A474-8B23-496F-9E5D-38F7B74654F4" codebase="../ocx/IVS_OCX.cab#version=2,2,0,9"> 
				    <param name="_Version" value="65536" valuetype="data">
					<param name="_ExtentX" value="2646" valuetype="data">
					<param name="_ExtentY" value="1323" valuetype="data">
					<param name="_StockProps" value="0" valuetype="data">
			    </object>
           </div>
       </div>
       -->
       
       <div id="rightContainer" class="Container Right">
          <div class="ItemTitle">
              <!--  <img src="TryDemo_files/line.png" alt=""> -->
               <span>操控区</span>
           </div>
           <div style="background-color:#FFF; height:553px ; padding-top:0px">
                <div class="guide"><p>请体验IVS能力：启动实时监控、预置位、云台控制</p></div>
                <div class="id">
                    <div class="L">
                        <table width="98%" cellspacing="0" cellpadding="0" border="0">
                            <tbody><tr>
                                <td class="LTDD">名称：</td>
                                <td class="LTD"><p>球机摄像头</p></td>
                            </tr>
                            <tr>
                                <td class="LTDD">型号：</td>
                                <td class="LTD">IPC652-Z20-FI</td>
                            </tr>
                            <tr>
                                <td class="LTDD">状态：</td>
                                <td style="color:#1da5f1" class="LTD">可用</td>
                            </tr>
                        </tbody></table>
                    </div>
                    <div class="R">
                       <div class="camera"><img src="TryDemo_files/camera_disable.png" id="CameraStatusImage"></div>
                       <div class="switch" onclick="BeginEndPlay()"><img src="TryDemo_files/btn_off.png" id="PalyStatusImage"></div>
                     <!--    <img src="imgs/camera_able.png" class="camera">
                         <img src="imgs/btn_off.png" class="switch">-->
                    </div>
                </div>
               <div class="area">
                  <div style=" z-index:99999; position:absolute; top:0px; left:0px; width:380px; height:320px ;" id="YunArea">
                                <img class="yuA" src="TryDemo_files/yuliu_A_normal.png" id="yuA" alt="" width="106" height="64">        
                                <img class="yuB" src="TryDemo_files/yuliu_B_normal.png" id="yuB" alt="" width="106" height="64">
                                <img class="LEFT" src="TryDemo_files/left.png" id="leftMode" alt="">
                                <img class="RIGHT" src="TryDemo_files/right.png" id="rightMode" alt="">
                                <img class="UP" src="TryDemo_files/up.png" id="upMode" alt="">
                                <img class="DOWN" src="TryDemo_files/down.png" id="downMode" alt="">
                                <img class="samllp" src="TryDemo_files/S.png" id="smallMode" alt="small">
                                <img class="bigp" src="TryDemo_files/L.png" id="bigMode" alt="big">

                                <img class="yunCycle" src="TryDemo_files/Circle_new.png">

                               <map name="Map" id="Map">
                                  <area shape="poly" coords="33,24,117,24,122,30,115,38,84,70,33,74,33,24" href="#" alt="" relatedid="yuA">
                                  <area shape="poly" coords="262,25,257,31,260,37,296,73,344,72,346,25,262,25" href="#" alt="" relatedid="yuB">
                                  <area shape="poly" coords="110,73,129,60,140,55,154,49,167,44,181,42,193,42,208,43,224,48,237,50,248,58,263,69,267,74,261,83,243,99,234,109,212,98,194,95,180,96,162,103,150,107,149,110,110,73" href="#" alt="" relatedid="upMode">
                                  <area shape="poly" coords="233,115,269,80,281,86,288,97,295,114,300,132,302,159,301,185,291,209,280,228,272,235,235,199,247,178,250,163,250,146,243,131,233,115" href="#" alt="" relatedid="rightMode">
                                  <area shape="poly" coords="107,75,146,113,137,135,133,156,134,175,141,189,144,197,109,233,94,218,81,186,77,159,79,131,88,106,107,75" href="#" alt="" relatedid="leftMode">
                                  <area shape="poly" coords="148,201,108,239,137,255,154,265,171,268,186,271,202,266,227,263,248,253,266,245,268,236,234,202,212,211,196,216,173,214,148,201" href="#" alt="" relatedid="downMode">
                                  <area shape="poly" coords="39,238,92,238,127,278,123,285,41,285,39,285,39,238" href="#" alt="" relatedid="smallMode">
                                  <area shape="poly" coords="294,237,255,279,258,284,262,288,337,285,342,281,341,237,294,237" href="#" alt="" relatedid="bigMode">
                                </map>
                      </div>

                   <!-- <div style=" z-index:99999; position:absolute; top:0px; left:0px; width:380px; height:340px"><img  src="imgs/tmpp.png" usemap="#Map" />
                                <map name="Map" id="Map">
                                <area shape="poly" coords="33,24,117,24,122,30,115,38,84,70,33,74" href="#" alt="" />
                                <area shape="poly" coords="262,25,257,31,260,37,296,73,344,72,346,25" href="#" alt="" />
                                <area shape="poly" coords="110,73,129,60,140,55,154,49,167,44,181,42,193,42,208,43,224,48,237,50,248,58,263,69,267,74,261,83,243,99,234,109,212,98,194,95,180,96,162,103,150,107,149,110" href="#" alt="" />
                                <area shape="poly" coords="233,115,269,80,281,86,288,97,295,114,300,132,302,159,301,185,291,209,280,228,272,235,235,199,247,178,250,163,250,146,243,131" href="#" alt="" />
                                <area shape="poly" coords="107,75,146,113,137,135,133,156,134,175,141,189,144,197,109,233,94,218,81,186,77,159,79,131,88,106" href="#" alt="" />
                                <area shape="poly" coords="148,201,108,239,137,255,154,265,171,268,186,271,202,266,227,263,248,253,266,245,268,236,234,202,212,211,196,216,173,214" href="#" alt="" />
                                 <area shape="poly" coords="39,238,92,238,127,278,123,285,41,285,39,285" href="#" alt="" />
                                 <area shape="poly" coords="294,237,255,279,258,284,262,288,337,285,342,281,341,237" href="#" alt="" />
                         </map>
                 </div>-->
        
             </div>
             </div>
       </div> 
  
    </div>



<div class="igtranslator-main-div" style="display: none; width: 0px; height: 0px;"><iframe src="TryDemo_files/a.htm" class="igtranslator-iframe" scrolling="no" frameborder="0"></iframe></div><div class="igtranslator-activator-icon bounceIn" style="background-image: url(&quot;resource://jid1-dgnibwqga0sibw-at-jetpack/data/icons/home.png&quot;); display: none;" title="Click to Show Translation"></div></body></html>