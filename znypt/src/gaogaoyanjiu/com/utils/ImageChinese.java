package gaogaoyanjiu.com.utils;

import org.bytedeco.javacpp.opencv_core.Mat;  
 
/**
 * 
 * 功能说明：测试中文路径下,中文窗口的图像显示 
 *  
 */  
public class ImageChinese {
	
    public static void main(String[] args) {  
    String filePath = "中文/莲花.png";  
    //读取mat  
    Mat mat = JavaCVUtil.imRead(filePath);  
    //显示图像  
    JavaCVUtil.imShow(mat, "莲花");  
    //保存mat  
    JavaCVUtil.imWrite(mat, "中文/莲花-保存.png"); 
    
    System.out.println("文件路径:" + filePath);  
    
    }  
}  
  
/** 
* 现实就是实现理想的过程。 
*  
*/  
