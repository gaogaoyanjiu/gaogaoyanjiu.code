package zhao;

import com.sun.net.httpserver.HttpContext;

public class ProcessRequest {
	public static void ProcessRequests(HttpContext context) {
		
	
	/* String img;//���վ���base64�� ֮����ַ���   
     context.Response.ContentType = "text/plain";        
	 try {           
		 img =context.Request["img"].ToString();
		 //��ȡbase64�ַ���         
		 byte[] imgBytes = Convert.FromBase64String(img);
		 //��base64�ַ���ת��Ϊ�ֽ�����            
		 System.IO.Stream stream = new System.IO.MemoryStream(imgBytes);
   		 //���ֽ�����ת��Ϊ�ֽ���      
         //����ת��Image�����ڽ�PNG ʽ��ƬתΪjpg��ѹ������Ա㱣�档         
    	 System.Drawing.Image imgae = System.Drawing.Image.FromStream(stream);   
         imgae.Save(context.Server.MapPath("~/Test/") + Guid.NewGuid().ToString()+".jpg", System.Drawing.Imaging.ImageFormat.Jpeg);//����ͼƬ            
         context.Response.Write("OK");//������ý��               
        } catch (Exception msg){            
	       img = null;            
           context.Response.Write(msg);      
           return;               
    }              */
}
}