package gaogaoyanjiu.com.utils.serialPort.serialException;

/**
 * �����ڷ�������ʧ��
 */
public class SendDataToSerialPortFailure extends Exception {
	private static final long serialVersionUID = 1L;

	public SendDataToSerialPortFailure() {}

	@Override
	public String toString() {
		return "�����ڷ�������ʧ�ܣ�";
	}
	
}