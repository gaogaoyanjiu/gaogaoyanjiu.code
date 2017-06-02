package test;

import java.util.List;

import org.junit.Test;

import gaogaoyanjiu.com.utils.COM3Utils;
import gnu.io.NoSuchPortException;
import gnu.io.PortInUseException;
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
		List<String> com3List = COM3Utils.getCOM3List();
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
		String baudRate = COM3Utils.setBaudRate(9600, "COM3");
		System.out.println(baudRate);
	}
	/**
	 * 测试获取COM串口波特率
	 * @throws PortInUseException 
	 * @throws NoSuchPortException 
	 */
	@Test
	public  void TestgetBaudRate() throws NoSuchPortException, PortInUseException {
		int baudRate = COM3Utils.getBaudRate("COM3");
		int baudRate2 = COM3Utils.getBaudRate("COM4");
		System.out.println("COM3"+" 的波特率是: "+baudRate);
		System.out.println("COM4"+" 的波特率是: "+baudRate2);
	}
}