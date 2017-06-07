package gaogaoyanjiu.com.utils.serialPort;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.TooManyListenersException;
import javax.swing.JOptionPane;

import gaogaoyanjiu.com.utils.serialPort.serialException.NoSuchPort;
import gaogaoyanjiu.com.utils.serialPort.serialException.NotASerialPort;
import gaogaoyanjiu.com.utils.serialPort.serialException.PortInUse;
import gaogaoyanjiu.com.utils.serialPort.serialException.ReadDataFromSerialPortFailure;
import gaogaoyanjiu.com.utils.serialPort.serialException.SendDataToSerialPortFailure;
import gaogaoyanjiu.com.utils.serialPort.serialException.SerialPortInputStreamCloseFailure;
import gaogaoyanjiu.com.utils.serialPort.serialException.SerialPortOutputStreamCloseFailure;
import gaogaoyanjiu.com.utils.serialPort.serialException.SerialPortParameterFailure;
import gaogaoyanjiu.com.utils.serialPort.serialException.TooManyListeners;
import gnu.io.CommPort;
import gnu.io.CommPortIdentifier;
import gnu.io.NoSuchPortException;
import gnu.io.PortInUseException;
import gnu.io.SerialPort;
import gnu.io.SerialPortEvent;
import gnu.io.SerialPortEventListener;
import gnu.io.UnsupportedCommOperationException;


/**
 * ���ڷ����࣬�ṩ�򿪡��رմ��ڣ���ȡ�����ʹ������ݵȷ��񣨲��õ������ģʽ��
 * @author zhang
 *
 */
public class SerialTool {
	
	private static final long serialVersionUID = 1L;
	
	private static SerialTool serialTool = null;
	private List<String> commList = null;	//������ö˿ں�
	private SerialPort serialPort = null;	//���洮�ڶ���
	static {
		//�ڸ��౻ClassLoader����ʱ�ͳ�ʼ��һ��SerialTool����
		if (serialTool == null) {
			serialTool = new SerialTool();
		}
	}
	
	//˽�л�SerialTool��Ĺ��췽��������������������SerialTool����
	private SerialTool() {}	
	
	/**
	 * ��ȡ�ṩ�����SerialTool����
	 * @return serialTool
	 */
	public static SerialTool getSerialTool() {
		if (serialTool == null) {
			serialTool = new SerialTool();
		}
		return serialTool;
	}


	/**
	 * �������п��ö˿�
	 * @return ���ö˿������б�
	 */
	public static final List<String> findPort() {

		//��õ�ǰ���п��ô���
        Enumeration<CommPortIdentifier> portList = CommPortIdentifier.getPortIdentifiers();	
        
        List<String> portNameList = new ArrayList<>();

        //�����ô�������ӵ�List�����ظ�List
        while (portList.hasMoreElements()) {
            String portName = portList.nextElement().getName();
            portNameList.add(portName);
        }

        return portNameList;

    }
    
    /**
     * �򿪴���
     * @param portName �˿�����
     * @param baudrate ������
     * @return ���ڶ���
     * @throws SerialPortParameterFailure ���ô��ڲ���ʧ��
     * @throws NotASerialPort �˿�ָ���豸���Ǵ�������
     * @throws NoSuchPort û�иö˿ڶ�Ӧ�Ĵ����豸
     * @throws PortInUse �˿��ѱ�ռ��
     */
    public static final SerialPort openPort(String portName, int baudrate) throws SerialPortParameterFailure, NotASerialPort, NoSuchPort, PortInUse {

        try {

            //ͨ���˿���ʶ��˿�
            CommPortIdentifier portIdentifier = CommPortIdentifier.getPortIdentifier(portName);

            //�򿪶˿ڣ������˿����ֺ�һ��timeout���򿪲����ĳ�ʱʱ�䣩
            CommPort commPort = portIdentifier.open(portName, 2000);

            //�ж��ǲ��Ǵ���
            if (commPort instanceof SerialPort) {
            	
                SerialPort serialPort = (SerialPort) commPort;
                
                try {                    	
                    //����һ�´��ڵĲ����ʵȲ���
                    serialPort.setSerialPortParams(baudrate, SerialPort.DATABITS_8, SerialPort.STOPBITS_1, SerialPort.PARITY_NONE);                              
                } catch (UnsupportedCommOperationException e) {  
                	throw new SerialPortParameterFailure();
                }
                
                System.out.println("�� " + portName + " �˿ڳɹ� !");
                return serialPort;
            
            }        
            else {
            	//���Ǵ���
            	throw new NotASerialPort();
            }
        } catch (NoSuchPortException e1) {
          throw new NoSuchPort();
        } catch (PortInUseException e2) {
        	throw new PortInUse();
        }
    }
    
    /**
     * �رմ���
     * @param serialport ���رյĴ��ڶ���
     */
    public static void closePort(SerialPort serialPort) {
    	if (serialPort != null) {
    		serialPort.close();
    		serialPort = null;
    	}
    }
    
    /**
     * �����ڷ�������
     * @param serialPort ���ڶ���
     * @param order	����������
     * @throws SendDataToSerialPortFailure �򴮿ڷ�������ʧ��
     * @throws SerialPortOutputStreamCloseFailure �رմ��ڶ�������������
     */
    public static void sendToPort(SerialPort serialPort, byte[] order) throws SendDataToSerialPortFailure, SerialPortOutputStreamCloseFailure {

    	OutputStream out = null;
    	
        try {
        	
            out = serialPort.getOutputStream();
            out.write(order);
            out.flush();
            
        } catch (IOException e) {
        	throw new SendDataToSerialPortFailure();
        } finally {
        	try {
        		if (out != null) {
        			out.close();
        			out = null;
        		}				
			} catch (IOException e) {
				throw new SerialPortOutputStreamCloseFailure();
			}
        }
        
    }
    
    /**
     * �Ӵ��ڶ�ȡ����
     * @param serialPort ��ǰ�ѽ������ӵ�SerialPort����
     * @return ��ȡ��������
     * @throws ReadDataFromSerialPortFailure �Ӵ��ڶ�ȡ����ʱ����
     * @throws SerialPortInputStreamCloseFailure �رմ��ڶ�������������
     */
    public static byte[] readFromPort(SerialPort serialPort) throws ReadDataFromSerialPortFailure, SerialPortInputStreamCloseFailure {

    	InputStream in = null;
        byte[] bytes = null;

        try {
        	
        	in = serialPort.getInputStream();
        	int bufflenth = in.available();		//��ȡbuffer������ݳ���
            
        	while (bufflenth != 0) {                             
                bytes = new byte[bufflenth];	//��ʼ��byte����Ϊbuffer�����ݵĳ���
                in.read(bytes);
                bufflenth = in.available();
        	} 
        } catch (IOException e) {
        	throw new ReadDataFromSerialPortFailure();
        } finally {
        	try {
            	if (in != null) {
            		in.close();
            		in = null;
            	}
        	} catch(IOException e) {
        		throw new SerialPortInputStreamCloseFailure();
        	}

        }

        return bytes;

    }
    
    /**
     * ��Ӽ�����
     * @param port     ���ڶ���
     * @param listener ���ڼ�����
     * @throws TooManyListeners ������������
     */
    public static void addListener(SerialPort port, SerialPortEventListener listener) throws TooManyListeners {

        try {
        	
            //��������Ӽ�����
            port.addEventListener(listener);
            //���õ������ݵ���ʱ���Ѽ��������߳�
            port.notifyOnDataAvailable(true);
          //���õ�ͨ���ж�ʱ�����ж��߳�
            port.notifyOnBreakInterrupt(true);

        } catch (TooManyListenersException e) {
        	throw new TooManyListeners();
        }
    }
    

    
/**
 * ���Զ�ȡ��������
 */
  
   public static void testReadData() {
    		
    	List<String> findPort = findPort();
        System.out.println(findPort);
    	if (findPort != null && findPort.size()>0) {
    			for (String str : findPort) {
    				if (str.equals("COM3")) {
    					try {
    						final SerialPort openPort = openPort("COM3", 9600);
    						//�Զ��嶨�崮�ڼ�����
    						SerialPortEventListener serialPortEventListener = new SerialPortEventListener() {
    							@Override
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
    								           System.out.println("=================================����   data ����==================================");
    								           //�����ֽ����飬���ڽ�������
    								           byte[] data = null;
    											if (openPort == null) {
    												JOptionPane.showMessageDialog(null, "���ڶ���Ϊ�գ�����ʧ�ܣ�", "����", JOptionPane.INFORMATION_MESSAGE);
    											}else {
    												try {
    												  //��ȡ���ݣ������ֽ�����
    												  data = SerialTool.readFromPort(openPort);
    												  //�Զ����������
    													if (data == null || data.length < 1) {	//��������Ƿ��ȡ��ȷ	
    														JOptionPane.showMessageDialog(null, "��ȡ���ݹ�����δ��ȡ����Ч���ݣ������豸�����", "����", JOptionPane.INFORMATION_MESSAGE);
    														System.exit(0);
    													}else {
    														String upperCase="";
    														for (int i = 0; i < data.length; i++) {
    															//System.out.println(data.length);
    															upperCase += " "+ Integer.toHexString(data[i] & 0xFF).toUpperCase();
															}
    														System.out.println("���յĴ���ԭʼ����:"+upperCase);
    														
    														System.out.println(
    															 " �¶�: "+data[0]+" ��;"
    															+" ʪ��: "+data[1]+" %;"
    															+" ѹǿ: "+data[2]+" hPa;"
    															+" ����: "+data[3]+" mm;"
    															+" ����: "+data[4]+" m/s;"
    															+" ����: "+data[5]+" ��;");
    														System.out.println(
    																		 " �¶�: "+(data[0] & 0xFF)+" ��;"
    																		+" ʪ��: "+(data[1] & 0xFF) +" %;"
    																		+" ѹǿ: "+(data[2] & 0xFF)+" hPa;"
    																		+" ����: "+(data[3] & 0xFF)+" mm;"
    																		+" ����: "+(data[4] & 0xFF)+" m/s;"
    																		+" ����: "+(data[5] & 0xFF)+" ��;");
    													}
    												} catch (Exception e) {
    												     JOptionPane.showMessageDialog(null, "���ݽ������̳������½�������ʧ�ܣ������豸�����", "����", JOptionPane.INFORMATION_MESSAGE);
    													 e.printStackTrace();
    													System.exit(0);
    											   }	
    										}
    									 }
    								 }
    							};
    								
    						//��Ӽ����¼�,�����Ѽ���(���˿���������¼���)
    						addListener(openPort, serialPortEventListener);
    						//�رն˿�,��ȡ���ݲ��ܹرն˿�
    						//closePort(openPort);
    						//˯һ���
    						//Thread.sleep(500);//50~~1400  
    					} catch (Exception e2) {
    						e2.printStackTrace();
    					}
    		}
    	}
   }
} 
    
    
/**
 * �����򴮿�д����
 */
  
    public static void testWriteData() {
    	//����16��������
    	byte[] bt = new byte[]{(byte)0x22,(byte)0xbb,(byte)0xcc,(byte)0xdd,(byte)0xee,(byte)0x33,(byte)0xFF,(byte)0x55};  
    	List<String> findPort = findPort();
		//System.out.println(findPort);
		if (findPort != null && findPort.size()>0) {
			for (String str : findPort) {
				if (str.equals("COM3")) {
					while(true){
						try {
							final SerialPort openPort = openPort("COM3", 9600);
							//��������
							sendToPort(openPort, bt);
							//16����ת��
							System.out.println(
									" "+Integer.toHexString(bt[0] & 0xFF).toUpperCase()+
									" "+Integer.toHexString(bt[1] & 0xFF).toUpperCase()+
									" "+Integer.toHexString(bt[2] & 0xFF).toUpperCase()+
									" "+Integer.toHexString(bt[3] & 0xFF).toUpperCase()+
									" "+Integer.toHexString(bt[4] & 0xFF).toUpperCase()+
									" "+Integer.toHexString(bt[5] & 0xFF).toUpperCase()+
									" "+Integer.toHexString(bt[6] & 0xFF).toUpperCase()+
									" "+Integer.toHexString(bt[7] & 0xFF).toUpperCase());
							//�رն˿�,������ʱ��Ҫ�رն˿�
							closePort(openPort);
							//˯һ���
							//Thread.sleep(500);//50~~1400  
						} catch (Exception e2) {
							e2.printStackTrace();
						}
					}
				}
    		}
		} 
    }
    
    
    public static void main(String[] args) {
    	//������
    	testReadData();
    	
    	//д����
    	//testWriteData();
	}
}