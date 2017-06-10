package gaogaoyanjiu.com.utils.serialPort.serialException;

/**
 * 从串口读取数据时出错
 */
public class ReadDataFromSerialPortFailure extends Exception {
	private static final long serialVersionUID = 1L;

	public ReadDataFromSerialPortFailure() {}

	@Override
	public String toString() {
		return "从串口读取数据时出错！";
	}
	
}
