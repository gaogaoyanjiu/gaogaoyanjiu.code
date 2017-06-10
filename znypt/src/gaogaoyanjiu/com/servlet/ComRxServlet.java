package gaogaoyanjiu.com.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gaogaoyanjiu.com.utils.serialPort.SerialTool;
import gaogaoyanjiu.com.utils.serialPort.serialException.StringToHex;
import gnu.io.CommPortIdentifier;
import gnu.io.SerialPort;

/**
 * 串口数据交互控制器
 * 定时监听串口读取数据
 * @author zhangliang
 *
 */
public class ComRxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static CommPortIdentifier portId;  
    static InputStream in;  
    static OutputStream out;  
    static SerialPort serialPort;  
    static int count = 0;  
    StringToHex sHex;//在简体中文Windows操作系统下，默认编码方式为"GBK"，在Android平台上，默认编码方式为"UTF-8"。 需要转成16进制
    
    public ComRxServlet() {
        super(); 
    }
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				//设置编码
				resp.setCharacterEncoding("UTF-8");
				resp.setContentType("text/html;charset=UTF-8");
				
				byte[] data = new byte[]{(byte)0x22,(byte)0xbb,(byte)0xcc,(byte)0xdd,(byte)0xee,(byte)0x33,(byte)0xFF,(byte)0x55};  
				//byte[] data = null;

				SerialTool.testReadData();
				//data.toString().toUpperCase();
				resp.getWriter().write("{'success':"+Integer.toHexString(data[0] & 0xFF).toUpperCase()+"}");
							
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

   
}
