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
	 * ����һ�����ڼ�����
	 * @author zhang
	 *
	 */
	public class SerialListener implements SerialPortEventListener {
		
		private SerialPort serialPort;
		private InputStream inputStream;
	    StringToHex sHex;//�ڼ�������Windows����ϵͳ�£�Ĭ�ϱ��뷽ʽΪ"GBK"����Androidƽ̨�ϣ�Ĭ�ϱ��뷽ʽΪ"UTF-8"�� ��Ҫת��16����
		public SerialListener(SerialPort serialPort) {
			super();
			this.serialPort = serialPort;
		}

		public SerialListener() {
			super();
		}

		/**
		 * �����ص��Ĵ����¼�
		 * @param serialPort 
		 */
	    public void serialEvent(SerialPortEvent serialPortEvent) {
	    	
	        switch (serialPortEvent.getEventType()) {

	            case SerialPortEvent.BI: // 10 ͨѶ�ж�
	            	JOptionPane.showMessageDialog(null, "�봮���豸ͨѶ�ж�", "����", JOptionPane.INFORMATION_MESSAGE);
	            	break;

	            case SerialPortEvent.OE: // 7 ��λ�����������

	            case SerialPortEvent.FE: // 9 ֡����

	            case SerialPortEvent.PE: // 8 ��żУ�����

	            case SerialPortEvent.CD: // 6 �ز����

	            case SerialPortEvent.CTS: // 3 �������������

	            case SerialPortEvent.DSR: // 4 ����������׼������

	            case SerialPortEvent.RI: // 5 ����ָʾ

	            case SerialPortEvent.OUTPUT_BUFFER_EMPTY: // 2 ��������������
	            	break;
	            
	            case SerialPortEvent.DATA_AVAILABLE: // 1 ���ڴ��ڿ�������
	           
	            	System.out.println("======================================���� data ����==========================================");
	            
	            	byte[] data = null;
				
					if (serialPort == null) {
						JOptionPane.showMessageDialog(null, "���ڶ���Ϊ�գ�����ʧ�ܣ�", "����", JOptionPane.INFORMATION_MESSAGE);
					}else {
							try {
								data = SerialTool.readFromPort(serialPort);//��ȡ���ݣ������ֽ�����
								List<String> printHexString = sHex.printHexString(data);//���������ַ��������ݣ�ֱ��ת����ʮ�����ơ�  
								//System.out.println(printHexString);
								
								String str2 = "";
								for (String str : printHexString) {
									//System.out.println(str.length());
									str2+=str;
								}
								System.out.println("���ݣ�"+str2);
							} catch (Exception e) {
								e.printStackTrace();
							}	
							//�Զ����������
							if (data == null || data.length < 1) {	//��������Ƿ��ȡ��ȷ	
								JOptionPane.showMessageDialog(null, "��ȡ���ݹ�����δ��ȡ����Ч���ݣ������豸�����", "����", JOptionPane.INFORMATION_MESSAGE);
								System.exit(0);
							}
							else {
								//System.out.println("������");
							}
					}
	        }
	  } 
	    
	    
    /**
     * ��Ӽ�����
     * @param port     ���ڶ���
     * @param listener ���ڼ�����
     * @throws TooManyListeners ������������
     */
	public void addListener(SerialPort port, SerialPortEventListener listener) throws TooManyListenersException{
	    	 //��������Ӽ�����
	        port.addEventListener(listener);
	        //���õ������ݵ���ʱ���Ѽ��������߳�
	        port.notifyOnDataAvailable(true);
	        //���õ�ͨ���ж�ʱ�����ж��߳�
	        port.notifyOnBreakInterrupt(true);
	}    
	    
 }
	
