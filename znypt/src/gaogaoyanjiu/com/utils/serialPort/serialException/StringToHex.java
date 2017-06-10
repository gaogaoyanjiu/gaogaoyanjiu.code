package gaogaoyanjiu.com.utils.serialPort.serialException;

import java.util.ArrayList;
import java.util.List;

/**
 * 由于读出过程中，遇到了乱码问题，上网搜了许多资料，最终解决了乱码问题。
 * 从相应串口读出的数据，不要进行其他处理，直接进行十六进制转换，就不会出现乱码问题。
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
	     //System.out.print(hex.toUpperCase()); //转成大写 
	     list.add(hex.toUpperCase());
	   }  
	   //System.out.println("\t\n"); //回车换行
	   return list;
    }    
}  