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
 * �������ݽ���������
 * ��ʱ�������ڶ�ȡ����
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
    StringToHex sHex;//�ڼ�������Windows����ϵͳ�£�Ĭ�ϱ��뷽ʽΪ"GBK"����Androidƽ̨�ϣ�Ĭ�ϱ��뷽ʽΪ"UTF-8"�� ��Ҫת��16����
    
    public ComRxServlet() {
        super(); 
    }
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				//���ñ���
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
