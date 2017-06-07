package gaogaoyanjiu.com.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.List;
import java.util.TooManyListenersException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import gaogaoyanjiu.com.utils.serialPort.SerialTool;
import gaogaoyanjiu.com.utils.serialPort.serialException.StringToHex;
import gnu.io.CommPortIdentifier;
import gnu.io.PortInUseException;
import gnu.io.SerialPort;
import gnu.io.SerialPortEvent;
import gnu.io.SerialPortEventListener;
import gnu.io.UnsupportedCommOperationException;

/**
 * 串口数据交互控制器
 * 写数据
 * @author zhangliang
 *
 */
public class ComTxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static CommPortIdentifier portId;  
    static InputStream in;  
    static OutputStream out;  
    static SerialPort serialPort;  
    static int count = 0;  
    
    public ComTxServlet() {
        super(); 
    }
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				//设置编码
				resp.setCharacterEncoding("UTF-8");
				resp.setContentType("text/html;charset=UTF-8");

				String str = req.getParameter("btn1");
				//将字符串转换为16进制
				Integer vof = Integer.valueOf(str,16);
				
				int parseInt = vof;
				System.out.println(parseInt);
				//与上FF求出最小的16进制数据
				byte b=(byte) parseInt;
				b=(byte) (parseInt & 0xFF);
			    byte[] bt = new byte[]{b}; 
			    
			    
				if (str!=null&&str.length()==2) {
					//获得当前所有可用串口(返回枚举类型)
				    Enumeration<CommPortIdentifier> portList = CommPortIdentifier.getPortIdentifiers();	
			       
				    while (portList.hasMoreElements()) {  
			        	 //将可用串口名逐个遍历取出元素
			        	portId = (CommPortIdentifier) portList.nextElement(); 
			            //判断是不是串口
			          if (portId.getPortType() == CommPortIdentifier.PORT_SERIAL) { 
			            	//判断端口号是否是COM3
			                if (portId.getName().equals("COM3")) {  
							    System.out.println(bt);
							    //打开通讯  
					            try {
									serialPort = (SerialPort) portId.open("COM3", 2000);
								 
					            serialPort.setRTS(false);//此步骤可以省略，猜测默认情况即是false  
					            //设置一下串口的波特率等参数==1200,2400,4800,9600,14400,19200,115200
					            //参数说明：参数一:波特率;参数二：数据位;参数三：停止位；参数四:奇数偶数校验位
					           
									serialPort.setSerialPortParams(9600, SerialPort.DATABITS_8, SerialPort.STOPBITS_1, SerialPort.PARITY_NONE);
								} catch (Exception e) {
									e.printStackTrace();
								}  
					           
					            
					            in = serialPort.getInputStream();//获取输入流 
					            out = serialPort.getOutputStream(); 
					            
					            //循环输出到COM3口
					           // while(true){
						            out.write(bt);  
						            out.flush();  
						            out.close();  
						            try {
										Thread.sleep(200);
									} catch (InterruptedException e) {
										e.printStackTrace();
									}  
					            //}
							}
							
							try {
								resp.getWriter().write("{'success':"+Integer.toHexString(b & 0xFF).toUpperCase()+"}");
							} catch (IOException e) {
								e.printStackTrace();
							}
			             }  
			           }  
			        }  		 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
