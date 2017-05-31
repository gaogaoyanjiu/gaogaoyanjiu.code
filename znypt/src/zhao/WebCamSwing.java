package zhao;

import java.awt.BorderLayout;
import java.awt.Component;
import java.awt.Image;
import java.awt.Label;

import javax.media.Buffer;
import javax.media.CaptureDeviceInfo;
import javax.media.CaptureDeviceManager;
import javax.media.Manager;
import javax.media.MediaLocator;
import javax.media.Player;
import javax.media.format.VideoFormat;
import javax.media.util.BufferToImage;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class WebCamSwing extends JFrame /*implements ActionListener */{
	public static Player player = null;
	
	public JPanel panel = null;
	
	public JPanel panel1 = null;


	private CaptureDeviceInfo di = null;

	private MediaLocator ml = null;

	/** * 拍照按钮 */
	private JButton capture = null;

	/** * 保存按钮 */
	private JButton save = null;

	private JTextField num = null;

	private Buffer buf = null;

	private Image img = null;

	private VideoFormat vf = null;

	private BufferToImage btoi = null;
	
//	private ImagePanel imgpanel = null;
	
	/** * 选取框的x,y,width,height参数的默认值 */
	private int rectX;

	private int rectY;

	private int rectWidth = 300;

	private int rectHeight = 200;

	private int imgWidth = 320;

	private int imgHeight = 240;

	/** * 默认保存文件名 */
	private String fname = "test";
	public WebCamSwing() {
		   setLayout(new BorderLayout());
		   setSize(550,550);
		   panel = new JPanel();
		   panel1 = new JPanel();
//		   imgpanel = new ImagePanel();
//		   imgpanel.addMouseMotionListener(imgpanel);
		   capture = new JButton("拍照");
//		   capture.addActionListener(this);
		   save = new JButton("保存");
//		   save.addActionListener(this);
		   num = new JTextField();

		   String str1 = "vfw:Logitech USB Video Camera:0";
		   String str2 = "vfw:Microsoft WDM Image Capture (Win32):0";
		   di = CaptureDeviceManager.getDevice(str2);
		   ml = di.getLocator();
		   try {
		    player = Manager.createRealizedPlayer(ml);
		    player.start();
		    Component comp;
		    if ((comp = player.getVisualComponent()) != null) {
		     add(comp, BorderLayout.NORTH);
		    }
		    JPanel panel2 = new JPanel(new BorderLayout());
		    panel2.add(capture, BorderLayout.NORTH);
		    panel2.add(new Label("请输入对应的文件名:"), BorderLayout.WEST);
		    panel2.add(num, BorderLayout.CENTER);
		    panel2.add(save, BorderLayout.SOUTH);
		    add(panel2, BorderLayout.CENTER);
		    add(panel,BorderLayout.EAST);
		    add(panel1,BorderLayout.WEST);
//		    add(imgpanel, BorderLayout.SOUTH);
		   } catch (Exception e) {
		    e.printStackTrace();
		   }
		   
		}
	
}