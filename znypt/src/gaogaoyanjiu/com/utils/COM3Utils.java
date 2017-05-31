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
 * COM3���ڹ�����
 * @author Administrator
 *
 */
public class COM3Utils {
	/**
	 * ��õ�ǰ���п��ô����б�
	 */
	public static List<String>  getCOM3List() {
		//��õ�ǰ���п��ô���(����ö������)
	    Enumeration<CommPortIdentifier> portList = CommPortIdentifier.getPortIdentifiers();		    
	    //���弯�����ڽ�������
	    ArrayList<String> portNameList = new ArrayList<>();
	    //�����ô�������ӵ�List
	    while (portList.hasMoreElements()) {
	        String portName = portList.nextElement().getName();
	        portNameList.add(portName);
	    }
	    //����˿�����
	    //System.out.println(portNameList);
		return portNameList;
	}
	
	/**
	 * ��ȡ������
	 * @throws NoSuchPortException 
	 * @throws PortInUseException 
	 */
	@SuppressWarnings("unused")
	public static int getBaudRate(String COM) throws NoSuchPortException, PortInUseException {
		SerialPort serialPort=null;
		//ͨ���˿���ʶ��˿�,COM3��COM4
        CommPortIdentifier portIdentifier = CommPortIdentifier.getPortIdentifier(COM);
        //�򿪶˿ڣ������˿����ֺ�һ��timeout���򿪲����ĳ�ʱʱ�䣩
        CommPort commPort = portIdentifier.open(COM, 2000);
        //�ж��ǲ��Ǵ���
       if (commPort instanceof SerialPort) { 
           serialPort = (SerialPort) commPort;
       }
       //Ĭ�ϲ�������9600�����COM3�ⲿ�������豸������Ĵ�ӡ���ᱨio�쳣���˿�ռ��
       //System.out.println(serialPort.getBaudRate());
	return serialPort.getBaudRate();
	}
	
	

	public static String setBaudRate(int baudrate,String portName) throws UnsupportedCommOperationException, PortInUseException, NoSuchPortException {
		 String success="";
		//ͨ���˿���ʶ��˿�
        CommPortIdentifier portIdentifier = CommPortIdentifier.getPortIdentifier(portName);
        //�򿪶˿ڣ������˿����ֺ�һ��timeout���򿪲����ĳ�ʱʱ�䣩
        CommPort commPort = portIdentifier.open(portName, 2000);
        //�ж��ǲ��Ǵ���
        if (commPort instanceof SerialPort) {
            SerialPort serialPort = (SerialPort) commPort;
            //����һ�´��ڵĲ����ʵȲ���==1200,2400,4800,9600,14400,19200,115200
            //����˵��������һ:������;������������λ;��������ֹͣλ��������:����ż��У��λ
            serialPort.setSerialPortParams(baudrate, SerialPort.DATABITS_8, SerialPort.STOPBITS_1, SerialPort.PARITY_NONE);                              
            
            success = "��  " + portName + " �ɹ� !";
            //System.out.println("Open " + portName + " sucessfully !");
            //��ȡ������,������֤�Ƿ����óɹ�
            //System.out.println(serialPort.getBaudRate());
        }
		return success;
	}

	
}
