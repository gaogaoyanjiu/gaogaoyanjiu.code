package test;

import java.util.List;

import org.junit.Test;

import gaogaoyanjiu.com.utils.serialPort.SerialTool;
import gaogaoyanjiu.com.utils.serialPort.serialException.NoSuchPort;
import gaogaoyanjiu.com.utils.serialPort.serialException.NotASerialPort;
import gaogaoyanjiu.com.utils.serialPort.serialException.PortInUse;
import gaogaoyanjiu.com.utils.serialPort.serialException.SerialPortParameterFailure;
import gnu.io.NoSuchPortException;
import gnu.io.PortInUseException;
import gnu.io.SerialPort;
import gnu.io.UnsupportedCommOperationException;

/**
 * 测试COM串口
 * @author Administrator
 *
 */

public class TestCOM {
	/**
	 * 测试得到com3串口列表
	 */
	
	@Test
	public  void TestgetCOM3List() {
		List<String> com3List = SerialTool.findPort();
		System.out.println(com3List);
	}
	/**
	 * 测试设置COM串口波特率
	 * @throws NoSuchPortException 
	 * @throws PortInUseException 
	 * @throws UnsupportedCommOperationException 
	 */
	@Test
	public  void TestsetBaudRate() throws UnsupportedCommOperationException, PortInUseException, NoSuchPortException {
		SerialPort baudRate = null;
		try {
			baudRate = SerialTool.openPort("COM3", 9600);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(baudRate);
	}
	
}