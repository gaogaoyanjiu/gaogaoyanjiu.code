package gaogaoyanjiu.com.utils.serialPort;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.TooManyListenersException;
import javax.swing.JOptionPane;

import gaogaoyanjiu.com.utils.serialPort.serialException.NoSuchPort;
import gaogaoyanjiu.com.utils.serialPort.serialException.NotASerialPort;
import gaogaoyanjiu.com.utils.serialPort.serialException.PortInUse;
import gaogaoyanjiu.com.utils.serialPort.serialException.ReadDataFromSerialPortFailure;
import gaogaoyanjiu.com.utils.serialPort.serialException.SendDataToSerialPortFailure;
import gaogaoyanjiu.com.utils.serialPort.serialException.SerialPortInputStreamCloseFailure;
import gaogaoyanjiu.com.utils.serialPort.serialException.SerialPortOutputStreamCloseFailure;
import gaogaoyanjiu.com.utils.serialPort.serialException.SerialPortParameterFailure;
import gaogaoyanjiu.com.utils.serialPort.serialException.TooManyListeners;
import gnu.io.CommPort;
import gnu.io.CommPortIdentifier;
import gnu.io.NoSuchPortException;
import gnu.io.PortInUseException;
import gnu.io.SerialPort;
import gnu.io.SerialPortEvent;
import gnu.io.SerialPortEventListener;
import gnu.io.UnsupportedCommOperationException;


/**
 * 串口服务类，提供打开、关闭串口，读取、发送串口数据等服务（采用单例设计模式）
 * @author zhang
 *
 */
public class SerialTool {
	
	private static final long serialVersionUID = 1L;
	
	private static SerialTool serialTool = null;
	private List<String> commList = null;	//保存可用端口号
	private SerialPort serialPort = null;	//保存串口对象
	static {
		//在该类被ClassLoader加载时就初始化一个SerialTool对象
		if (serialTool == null) {
			serialTool = new SerialTool();
		}
	}
	
	//私有化SerialTool类的构造方法，不允许其他类生成SerialTool对象
	private SerialTool() {}	
	
	/**
	 * 获取提供服务的SerialTool对象
	 * @return serialTool
	 */
	public static SerialTool getSerialTool() {
		if (serialTool == null) {
			serialTool = new SerialTool();
		}
		return serialTool;
	}


	/**
	 * 查找所有可用端口
	 * @return 可用端口名称列表
	 */
	public static final List<String> findPort() {

		//获得当前所有可用串口
        Enumeration<CommPortIdentifier> portList = CommPortIdentifier.getPortIdentifiers();	
        
        List<String> portNameList = new ArrayList<>();

        //将可用串口名添加到List并返回该List
        while (portList.hasMoreElements()) {
            String portName = portList.nextElement().getName();
            portNameList.add(portName);
        }

        return portNameList;

    }
    
    /**
     * 打开串口
     * @param portName 端口名称
     * @param baudrate 波特率
     * @return 串口对象
     * @throws SerialPortParameterFailure 设置串口参数失败
     * @throws NotASerialPort 端口指向设备不是串口类型
     * @throws NoSuchPort 没有该端口对应的串口设备
     * @throws PortInUse 端口已被占用
     */
    public static final SerialPort openPort(String portName, int baudrate) throws SerialPortParameterFailure, NotASerialPort, NoSuchPort, PortInUse {

        try {

            //通过端口名识别端口
            CommPortIdentifier portIdentifier = CommPortIdentifier.getPortIdentifier(portName);

            //打开端口，并给端口名字和一个timeout（打开操作的超时时间）
            CommPort commPort = portIdentifier.open(portName, 2000);

            //判断是不是串口
            if (commPort instanceof SerialPort) {
            	
                SerialPort serialPort = (SerialPort) commPort;
                
                try {                    	
                    //设置一下串口的波特率等参数
                    serialPort.setSerialPortParams(baudrate, SerialPort.DATABITS_8, SerialPort.STOPBITS_1, SerialPort.PARITY_NONE);                              
                } catch (UnsupportedCommOperationException e) {  
                	throw new SerialPortParameterFailure();
                }
                
                System.out.println("打开 " + portName + " 端口成功 !");
                return serialPort;
            
            }        
            else {
            	//不是串口
            	throw new NotASerialPort();
            }
        } catch (NoSuchPortException e1) {
          throw new NoSuchPort();
        } catch (PortInUseException e2) {
        	throw new PortInUse();
        }
    }
    
    /**
     * 关闭串口
     * @param serialport 待关闭的串口对象
     */
    public static void closePort(SerialPort serialPort) {
    	if (serialPort != null) {
    		serialPort.close();
    		serialPort = null;
    	}
    }
    
    /**
     * 往串口发送数据
     * @param serialPort 串口对象
     * @param order	待发送数据
     * @throws SendDataToSerialPortFailure 向串口发送数据失败
     * @throws SerialPortOutputStreamCloseFailure 关闭串口对象的输出流出错
     */
    public static void sendToPort(SerialPort serialPort, byte[] order) throws SendDataToSerialPortFailure, SerialPortOutputStreamCloseFailure {

    	OutputStream out = null;
    	
        try {
        	
            out = serialPort.getOutputStream();
            out.write(order);
            out.flush();
            
        } catch (IOException e) {
        	throw new SendDataToSerialPortFailure();
        } finally {
        	try {
        		if (out != null) {
        			out.close();
        			out = null;
        		}				
			} catch (IOException e) {
				throw new SerialPortOutputStreamCloseFailure();
			}
        }
        
    }
    
    /**
     * 从串口读取数据
     * @param serialPort 当前已建立连接的SerialPort对象
     * @return 读取到的数据
     * @throws ReadDataFromSerialPortFailure 从串口读取数据时出错
     * @throws SerialPortInputStreamCloseFailure 关闭串口对象输入流出错
     */
    public static byte[] readFromPort(SerialPort serialPort) throws ReadDataFromSerialPortFailure, SerialPortInputStreamCloseFailure {

    	InputStream in = null;
        byte[] bytes = null;

        try {
        	
        	in = serialPort.getInputStream();
        	int bufflenth = in.available();		//获取buffer里的数据长度
            
        	while (bufflenth != 0) {                             
                bytes = new byte[bufflenth];	//初始化byte数组为buffer中数据的长度
                in.read(bytes);
                bufflenth = in.available();
        	} 
        } catch (IOException e) {
        	throw new ReadDataFromSerialPortFailure();
        } finally {
        	try {
            	if (in != null) {
            		in.close();
            		in = null;
            	}
        	} catch(IOException e) {
        		throw new SerialPortInputStreamCloseFailure();
        	}

        }

        return bytes;

    }
    
    /**
     * 添加监听器
     * @param port     串口对象
     * @param listener 串口监听器
     * @throws TooManyListeners 监听类对象过多
     */
    public static void addListener(SerialPort port, SerialPortEventListener listener) throws TooManyListeners {

        try {
        	
            //给串口添加监听器
            port.addEventListener(listener);
            //设置当有数据到达时唤醒监听接收线程
            port.notifyOnDataAvailable(true);
          //设置当通信中断时唤醒中断线程
            port.notifyOnBreakInterrupt(true);

        } catch (TooManyListenersException e) {
        	throw new TooManyListeners();
        }
    }
    

    
/**
 * 测试读取串口数据
 */
  
   public static void testReadData() {
    		
    	List<String> findPort = findPort();
        System.out.println(findPort);
    	if (findPort != null && findPort.size()>0) {
    			for (String str : findPort) {
    				if (str.equals("COM3")) {
    					try {
    						final SerialPort openPort = openPort("COM3", 9600);
    						//自定义定义串口监听器
    						SerialPortEventListener serialPortEventListener = new SerialPortEventListener() {
    							@Override
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
    								           System.out.println("=================================发现   data 数据==================================");
    								           //定义字节数组，用于接收数据
    								           byte[] data = null;
    											if (openPort == null) {
    												JOptionPane.showMessageDialog(null, "串口对象为空！监听失败！", "错误", JOptionPane.INFORMATION_MESSAGE);
    											}else {
    												try {
    												  //读取数据，存入字节数组
    												  data = SerialTool.readFromPort(openPort);
    												  //自定义解析过程
    													if (data == null || data.length < 1) {	//检查数据是否读取正确	
    														JOptionPane.showMessageDialog(null, "读取数据过程中未获取到有效数据！请检查设备或程序！", "错误", JOptionPane.INFORMATION_MESSAGE);
    														System.exit(0);
    													}else {
    														String upperCase="";
    														for (int i = 0; i < data.length; i++) {
    															//System.out.println(data.length);
    															upperCase += " "+ Integer.toHexString(data[i] & 0xFF).toUpperCase();
															}
    														System.out.println("接收的串口原始数据:"+upperCase);
    														
    														System.out.println(
    															 " 温度: "+data[0]+" ℃;"
    															+" 湿度: "+data[1]+" %;"
    															+" 压强: "+data[2]+" hPa;"
    															+" 雨量: "+data[3]+" mm;"
    															+" 风速: "+data[4]+" m/s;"
    															+" 风向: "+data[5]+" °;");
    														System.out.println(
    																		 " 温度: "+(data[0] & 0xFF)+" ℃;"
    																		+" 湿度: "+(data[1] & 0xFF) +" %;"
    																		+" 压强: "+(data[2] & 0xFF)+" hPa;"
    																		+" 雨量: "+(data[3] & 0xFF)+" mm;"
    																		+" 风速: "+(data[4] & 0xFF)+" m/s;"
    																		+" 风向: "+(data[5] & 0xFF)+" °;");
    													}
    												} catch (Exception e) {
    												     JOptionPane.showMessageDialog(null, "数据解析过程出错，更新界面数据失败！请检查设备或程序！", "错误", JOptionPane.INFORMATION_MESSAGE);
    													 e.printStackTrace();
    													System.exit(0);
    											   }	
    										}
    									 }
    								 }
    							};
    								
    						//添加监听事件,并唤醒监听(将端口与监听器事件绑定)
    						addListener(openPort, serialPortEventListener);
    						//关闭端口,读取数据不能关闭端口
    						//closePort(openPort);
    						//睡一会儿
    						//Thread.sleep(500);//50~~1400  
    					} catch (Exception e2) {
    						e2.printStackTrace();
    					}
    		}
    	}
   }
} 
    
    
/**
 * 测试向串口写数据
 */
  
    public static void testWriteData() {
    	//构造16进制数据
    	byte[] bt = new byte[]{(byte)0x22,(byte)0xbb,(byte)0xcc,(byte)0xdd,(byte)0xee,(byte)0x33,(byte)0xFF,(byte)0x55};  
    	List<String> findPort = findPort();
		//System.out.println(findPort);
		if (findPort != null && findPort.size()>0) {
			for (String str : findPort) {
				if (str.equals("COM3")) {
					while(true){
						try {
							final SerialPort openPort = openPort("COM3", 9600);
							//发送数据
							sendToPort(openPort, bt);
							//16进制转换
							System.out.println(
									" "+Integer.toHexString(bt[0] & 0xFF).toUpperCase()+
									" "+Integer.toHexString(bt[1] & 0xFF).toUpperCase()+
									" "+Integer.toHexString(bt[2] & 0xFF).toUpperCase()+
									" "+Integer.toHexString(bt[3] & 0xFF).toUpperCase()+
									" "+Integer.toHexString(bt[4] & 0xFF).toUpperCase()+
									" "+Integer.toHexString(bt[5] & 0xFF).toUpperCase()+
									" "+Integer.toHexString(bt[6] & 0xFF).toUpperCase()+
									" "+Integer.toHexString(bt[7] & 0xFF).toUpperCase());
							//关闭端口,读数据时不要关闭端口
							closePort(openPort);
							//睡一会儿
							//Thread.sleep(500);//50~~1400  
						} catch (Exception e2) {
							e2.printStackTrace();
						}
					}
				}
    		}
		} 
    }
    
    
    public static void main(String[] args) {
    	//读数据
    	testReadData();
    	
    	//写数据
    	//testWriteData();
	}
}