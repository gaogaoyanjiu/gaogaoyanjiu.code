package gaogaoyanjiu.com.utils.serialPort.serialException;

/**
 * ���ڼ��������������쳣��
 */
public class TooManyListeners extends Exception {
	private static final long serialVersionUID = 1L;

	public TooManyListeners() {}

	@Override
	public String toString() {
		return "���ڼ������������࣡��Ӳ���ʧ�ܣ�";
	}
	
}
