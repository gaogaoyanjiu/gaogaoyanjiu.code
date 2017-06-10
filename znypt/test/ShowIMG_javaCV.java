package test;

import static org.bytedeco.javacpp.opencv_core.*;
import static org.bytedeco.javacpp.opencv_imgcodecs.*;
import static org.bytedeco.javacpp.opencv_highgui.*;	//imshow()位于此
import static org.bytedeco.javacpp.opencv_imgproc.*;	//COLOR_RGB2GRAY
public class ShowIMG_javaCV {
	public static void main(String[] args) {

		Mat image=imread("abc.jpg");	//加载图像
		if(image.empty()){
			System.out.println("图像加载错误，请检查图片路径！");
			return ;
		}
		imshow("原始图像",image); 	
		Mat gray=new Mat();
		cvtColor(image,gray,COLOR_RGB2GRAY);		//彩色图像转为灰度图像
		imshow("灰度图像",gray);
		Mat bin=new Mat();
		threshold(gray,bin,120,255,THRESH_TOZERO); 	//图像二值化
		imshow("二值图像",bin);
		waitKey(0);
	}
}
