package handler.project;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.member.MemberDao;
import dao.member.MemberDataBean;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
class MyAuthentication extends Authenticator {
    
    PasswordAuthentication pa;
    
 
    public MyAuthentication(){
         
        String id = "yoonbi12@gmail.com";       // 구글 ID
        String pw = "monster099";          // 구글 비밀번호
 
        // ID와 비밀번호를 입력한다.
        pa = new PasswordAuthentication(id, pw);
      
    }
 
    // 시스템에서 사용하는 인증정보
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
} 




@Controller
public class PasswdFindPro implements CommandHandler {

	@Resource(name="memberDao")
	private MemberDao dao;
	
	@RequestMapping("/passwdfindPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		
		
		
		
		Properties p = System.getProperties();
		p.put("mail.smtp.starttls.enable", "true");     
        p.put("mail.smtp.host", "smtp.gmail.com");      
        p.put("mail.smtp.auth","true");                 
        p.put("mail.smtp.port", "587");                
		
        Authenticator auth = new MyAuthentication();
		
        Session session = Session.getDefaultInstance(p, auth);
        MimeMessage msg = new MimeMessage(session);
        
        String id = request.getParameter("id");	
		String email1 = request.getParameter( "email1" );
		String email2 = request.getParameter( "email2" );
		String email = email1 + "@" + email2;
		
		Map < String, String > map = new HashMap<String, String>();
		map.put("id", id );
		map.put("email", email);
		
		List<MemberDataBean> result = dao.infocheck( map);	
		
		request.setAttribute("result", result);
		request.setAttribute("id", id);
		request.setAttribute("email", email);
		
		
		try{
            //편지보낸시간
            msg.setSentDate(new Date());
             
            InternetAddress from = new InternetAddress() ;
             
             
            from = new InternetAddress("ANT<yoonbi12@gmail.com>");
             
            // 이메일 발신자
            msg.setFrom(from);
             
             
            // 이메일 수신자
            InternetAddress to = new InternetAddress(email);
            msg.setRecipient(Message.RecipientType.TO, to);
             
            // 이메일 제목
            msg.setSubject("비밀번호 전송.", "UTF-8");
             
            // 이메일 내용 
            msg.setText("ANT 비밀번호는 : " + result + "입니다.", "UTF-8");
             
            // 이메일 헤더 
            msg.setHeader("content-Type", "text/html");
             
            //메일보내기
            javax.mail.Transport.send(msg);
             
        }catch (AddressException addr_e) {
            addr_e.printStackTrace();
        }catch (MessagingException msg_e) {
            msg_e.printStackTrace();
        }
		
		
		return new ModelAndView("final/passwdfindPro");
	}

}

