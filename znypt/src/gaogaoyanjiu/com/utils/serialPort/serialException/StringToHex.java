package gaogaoyanjiu.com.utils.serialPort.serialException;

import java.util.ArrayList;
import java.util.List;

/**
 * ���ڶ��������У��������������⣬��������������ϣ����ս�����������⡣
 * ����Ӧ���ڶ��������ݣ���Ҫ������������ֱ�ӽ���ʮ������ת�����Ͳ�������������⡣
 * @author Administrator
 *
 */
public class StringToHex {
    public static List<String> printHexString( byte[] b) {  
	   List<String> list = new ArrayList<>();
    	for (int i = 0; i < b.length; i++) {  
	     String hex = Integer.toHexString(b[i] & 0xFF)+" ";  
	     if (hex.length() == 2) {  
	       hex = '0' + hex;  
	     }  
	     //System.out.print(hex.toUpperCase()); //ת�ɴ�д 
	     list.add(hex.toUpperCase());
	   }  
	   //System.out.println("\t\n"); //�س�����
	   return list;
    }    
}  