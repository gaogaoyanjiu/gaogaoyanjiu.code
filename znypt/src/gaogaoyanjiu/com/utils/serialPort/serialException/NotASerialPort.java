package gaogaoyanjiu.com.utils.serialPort.serialException;

/**
 * �˿�ָ���豸���Ǵ��������쳣��
 */
public class NotASerialPort extends Exception {
	private static final long serialVersionUID = 1L;

	public NotASerialPort() {}

	@Override
	public String toString() {
		return "�˿�ָ���豸���Ǵ������ͣ��򿪴��ڲ���ʧ�ܣ�";
	}
	
	
}
