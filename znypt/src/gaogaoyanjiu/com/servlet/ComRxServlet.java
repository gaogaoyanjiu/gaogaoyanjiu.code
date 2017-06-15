package gaogaoyanjiu.com.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
				String bt= req.getParameter("bt");
				System.out.println(bt);
				byte[] data = new byte[]{(byte)0xaa,(byte)0xbb,(byte)0xcc,(byte)0xdd,(byte)0xee,(byte)0x33,(byte)0xFF,(byte)0x55};  
				//byte[] data = null;
				
				//检查session是否存在已经使用的COM端口
				HttpSession session = req.getSession(); 
				String COM = (String) session.getAttribute("COM"); 
<<<<<<< HEAD
				
				
				
				if (COM!=null&&!"".equals(COM)) {
					//查询出占用的端口
					List<String> findPort = SerialTool.findPort();
					//如果不为空,先关闭端口
					for (String port : findPort) {
						if (COM.equals(port)) {
							SerialTool serialTool = SerialTool.getSerialTool();
							SerialPort serial = serialTool.getSerialPort();
							SerialTool.closePort(serial);
						}
					}
				}
				
				//获取已经连接的串口
=======
				//如果不为空,先关闭端口
				if (COM!=null&&"".equals(COM)) {
					
					SerialTool.closePort(serialPort);
				}
				
>>>>>>> refs/remotes/origin/master
				session.setAttribute("COM", "COM3"); 
				//session.removeAttribute("key"); 
				//session.invalidate(); //删除所有session中保存的键
				
				SerialTool.testReadData();
				//data.toString().toUpperCase();
				String upperCase = Integer.toHexString(data[0] & 0xFF).toUpperCase();
				//返回json
				resp.getWriter().write("{'success':'返回的数据为  : "+upperCase+"'}");
				
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

   
}
