package gaogaoyanjiu.com.utils;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import gnu.io.CommPort;
import gnu.io.CommPortIdentifier;
import gnu.io.NoSuchPortException;
import gnu.io.PortInUseException;
import gnu.io.SerialPort;
import gnu.io.UnsupportedCommOperationException;

/**
 * COM3串口工具类
 * @author Administrator
 *
 */
public class COM3Utils {
	/**
	 * 获得当前所有可用串口列表
	 */
	public static List<String>  getCOM3List() {
		//获得当前所有可用串口(返回枚举类型)
	    Enumeration<CommPortIdentifier> portList = CommPortIdentifier.getPortIdentifiers();		    
	    //定义集合用于接收名称
	    ArrayList<String> portNameList = new ArrayList<>();
	    //将可用串口名添加到List
	    while (portList.hasMoreElements()) {
	        String portName = portList.nextElement().getName();
	        portNameList.add(portName);
	    }
	    //输出端口名称
	    //System.out.println(portNameList);
		return portNameList;
	}
	
	/**
	 * 获取波特率
	 * @throws NoSuchPortException 
	 * @throws PortInUseException 
	 */
	@SuppressWarnings("unused")
	public static int getBaudRate(String COM) throws NoSuchPortException, PortInUseException {
		SerialPort serialPort=null;
		//通过端口名识别端口,COM3或COM4
        CommPortIdentifier portIdentifier = CommPortIdentifier.getPortIdentifier(COM);
        //打开端口，并给端口名字和一个timeout（打开操作的超时时间）
        CommPort commPort = portIdentifier.open(COM, 2000);
        //判断是不是串口
       if (commPort instanceof SerialPort) { 
           serialPort = (SerialPort) commPort;
       }
       //默认波特率是9600，如果COM3外部连接了设备，下面的打印语句会报io异常，端口占用
       //System.out.println(serialPort.getBaudRate());
	return serialPort.getBaudRate();
	}
	
	

	public static String setBaudRate(int baudrate,String portName) throws UnsupportedCommOperationException, PortInUseException, NoSuchPortException {
		 String success="";
		//通过端口名识别端口
        CommPortIdentifier portIdentifier = CommPortIdentifier.getPortIdentifier(portName);
        //打开端口，并给端口名字和一个timeout（打开操作的超时时间）
        CommPort commPort = portIdentifier.open(portName, 2000);
        //判断是不是串口
        if (commPort instanceof SerialPort) {
            SerialPort serialPort = (SerialPort) commPort;
            //设置一下串口的波特率等参数==1200,2400,4800,9600,14400,19200,115200
            //参数说明：参数一:波特率;参数二：数据位;参数三：停止位；参数四:奇数偶数校验位
            serialPort.setSerialPortParams(baudrate, SerialPort.DATABITS_8, SerialPort.STOPBITS_1, SerialPort.PARITY_NONE);                              
            
            success = "打开  " + portName + " 成功 !";
            //System.out.println("Open " + portName + " sucessfully !");
            //获取波特率,用来验证是否设置成功
            //System.out.println(serialPort.getBaudRate());
        }
		return success;
	}

	
}
