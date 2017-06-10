package gaogaoyanjiu.com.utils.serialPort;
import java.io.InputStream;
import java.util.List;
import java.util.TooManyListenersException;

import javax.swing.JOptionPane;

import gaogaoyanjiu.com.utils.serialPort.serialException.StringToHex;
import gaogaoyanjiu.com.utils.serialPort.serialException.TooManyListeners;
import gnu.io.SerialPort;
import gnu.io.SerialPortEvent;
import gnu.io.SerialPortEventListener;

	/**
	 * 创建一个串口监听类
	 * @author zhang
	 *
	 */
	public class SerialListener implements SerialPortEventListener {
		
		private SerialPort serialPort;
		private InputStream inputStream;
	    StringToHex sHex;//在简体中文Windows操作系统下，默认编码方式为"GBK"，在Android平台上，默认编码方式为"UTF-8"。 需要转成16进制
		public SerialListener(SerialPort serialPort) {
			super();
			this.serialPort = serialPort;
		}

		public SerialListener() {
			super();
		}

		/**
		 * 处理监控到的串口事件
		 * @param serialPort 
		 */
	    public void serialEvent(SerialPortEvent serialPortEvent) {
	    	
	        switch (serialPortEvent.getEventType()) {

	            case SerialPortEvent.BI: // 10 通讯中断
	            	JOptionPane.showMessageDialog(null, "与串口设备通讯中断", "错误", JOptionPane.INFORMATION_MESSAGE);
	            	break;

	            case SerialPortEvent.OE: // 7 溢位（溢出）错误

	            case SerialPortEvent.FE: // 9 帧错误

	            case SerialPortEvent.PE: // 8 奇偶校验错误

	            case SerialPortEvent.CD: // 6 载波检测

	            case SerialPortEvent.CTS: // 3 清除待发送数据

	            case SerialPortEvent.DSR: // 4 待发送数据准备好了

	            case SerialPortEvent.RI: // 5 振铃指示

	            case SerialPortEvent.OUTPUT_BUFFER_EMPTY: // 2 输出缓冲区已清空
	            	break;
	            
	            case SerialPortEvent.DATA_AVAILABLE: // 1 串口存在可用数据
	           
	            	System.out.println("======================================发现 data 数据==========================================");
	            
	            	byte[] data = null;
				
					if (serialPort == null) {
						JOptionPane.showMessageDialog(null, "串口对象为空！监听失败！", "错误", JOptionPane.INFORMATION_MESSAGE);
					}else {
							try {
								data = SerialTool.readFromPort(serialPort);//读取数据，存入字节数组
								List<String> printHexString = sHex.printHexString(data);//将读出的字符数组数据，直接转换成十六进制。  
								//System.out.println(printHexString);
								
								String str2 = "";
								for (String str : printHexString) {
									//System.out.println(str.length());
									str2+=str;
								}
								System.out.println("数据："+str2);
							} catch (Exception e) {
								e.printStackTrace();
							}	
							//自定义解析过程
							if (data == null || data.length < 1) {	//检查数据是否读取正确	
								JOptionPane.showMessageDialog(null, "读取数据过程中未获取到有效数据！请检查设备或程序！", "错误", JOptionPane.INFORMATION_MESSAGE);
								System.exit(0);
							}
							else {
								//System.out.println("有数据");
							}
					}
	        }
	  } 
	    
	    
    /**
     * 添加监听器
     * @param port     串口对象
     * @param listener 串口监听器
     * @throws TooManyListeners 监听类对象过多
     */
	public void addListener(SerialPort port, SerialPortEventListener listener) throws TooManyListenersException{
	    	 //给串口添加监听器
	        port.addEventListener(listener);
	        //设置当有数据到达时唤醒监听接收线程
	        port.notifyOnDataAvailable(true);
	        //设置当通信中断时唤醒中断线程
	        port.notifyOnBreakInterrupt(true);
	}    
	    
 }
	
