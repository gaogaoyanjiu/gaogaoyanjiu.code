<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>摄像头实时视频</title>
</head>
<body>
		<video id="video" width="640" height="480" autoplay></video>
		<button id="snap">拍照</button>
		<canvas id="canvas" width="640" height="480"></canvas>

		<script>

			window.addEventListener("DOMContentLoaded", function() {

				var canvas = document.getElementById("canvas"),
					context = canvas.getContext("2d"),
					video = document.getElementById("video"),
					videoObj = { "video": true },
					errBack = function(error) {
						console.log("Video capture error: ", error.code);
					};

				
				if(navigator.getUserMedia) { // Standard 
					navigator.getUserMedia(videoObj, function(stream) {
						video.src = stream;
						video.play();
					}, errBack);
				} else if(navigator.webkitGetUserMedia) { // WebKit-prefixed 
					navigator.webkitGetUserMedia(videoObj, function(stream) {
						video.src = window.webkitURL.createObjectURL(stream);
						video.play();
					}, errBack);
				} else if(navigator.mozGetUserMedia) { // Firefox-prefixed 
					navigator.mozGetUserMedia(videoObj, function(stream) {
						video.src = window.URL.createObjectURL(stream);
						video.play();
					}, errBack);
				}
			}, false);

			// 触发拍照动作 
			document.getElementById("snap").addEventListener("click", function() {
				document.getElementById("canvas").getContext("2d").drawImage(video, 0, 0, 640, 480);
				alert('要拍照啦！');
			});
		</script>
</body>
</html>