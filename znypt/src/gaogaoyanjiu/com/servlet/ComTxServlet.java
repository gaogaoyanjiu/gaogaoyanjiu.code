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
 * �������ݽ���������
 * д����
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
				//���ñ���
				resp.setCharacterEncoding("UTF-8");
				resp.setContentType("text/html;charset=UTF-8");

				String str = req.getParameter("btn1");
				//���ַ���ת��Ϊ16����
				Integer vof = Integer.valueOf(str,16);
				
				int parseInt = vof;
				System.out.println(parseInt);
				//����FF�����С��16��������
				byte b=(byte) parseInt;
				b=(byte) (parseInt & 0xFF);
			    byte[] bt = new byte[]{b}; 
			    
			    
				if (str!=null&&str.length()==2) {
					//��õ�ǰ���п��ô���(����ö������)
				    Enumeration<CommPortIdentifier> portList = CommPortIdentifier.getPortIdentifiers();	
			       
				    while (portList.hasMoreElements()) {  
			        	 //�����ô������������ȡ��Ԫ��
			        	portId = (CommPortIdentifier) portList.nextElement(); 
			            //�ж��ǲ��Ǵ���
			          if (portId.getPortType() == CommPortIdentifier.PORT_SERIAL) { 
			            	//�ж϶˿ں��Ƿ���COM3
			                if (portId.getName().equals("COM3")) {  
							    System.out.println(bt);
							    //��ͨѶ  
					            try {
									serialPort = (SerialPort) portId.open("COM3", 2000);
								 
					            serialPort.setRTS(false);//�˲������ʡ�ԣ��²�Ĭ���������false  
					            //����һ�´��ڵĲ����ʵȲ���==1200,2400,4800,9600,14400,19200,115200
					            //����˵��������һ:������;������������λ;��������ֹͣλ��������:����ż��У��λ
					           
									serialPort.setSerialPortParams(9600, SerialPort.DATABITS_8, SerialPort.STOPBITS_1, SerialPort.PARITY_NONE);
								} catch (Exception e) {
									e.printStackTrace();
								}  
					           
					            
					            in = serialPort.getInputStream();//��ȡ������ 
					            out = serialPort.getOutputStream(); 
					            
					            //ѭ�������COM3��
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
