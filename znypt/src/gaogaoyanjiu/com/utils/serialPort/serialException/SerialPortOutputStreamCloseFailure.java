package gaogaoyanjiu.com.utils.serialPort.serialException;

/**
 * �رմ��ڶ����������쳣��
 */
public class SerialPortOutputStreamCloseFailure extends Exception {
	private static final long serialVersionUID = 1L;

	public SerialPortOutputStreamCloseFailure() {}

	@Override
	public String toString() {
		return "�رմ��ڶ�����������OutputStream��ʱ����";
	}
}
