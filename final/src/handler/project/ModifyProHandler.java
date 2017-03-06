package handler.project;

import javax.annotation.Resource;
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
public class ModifyProHandler implements CommandHandler {

	@Resource(name="memberDao")
	private MemberDao dao;
	
	@RequestMapping("/modifyPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		MemberDataBean dto = new MemberDataBean();
		
		String passwd = request.getParameter("passwd");
		dto.setPasswd(passwd);
		
		
		
		
		String email = null;
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		if( ! email1.equals("") && ! email2.equals("") ){
			email = email1 + "@" + email2;
		}
		dto.setEmail( email );
		dto.setId( (String)request.getSession().getAttribute("memId") );
		int result = dao.modifyMember( dto );	
		
	
		request.setAttribute("result", result);
		System.out.println(result);
		return new ModelAndView("final/modifyPro");
	}

}
