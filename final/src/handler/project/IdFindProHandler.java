package handler.project;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.member.MemberDao;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class IdFindProHandler implements CommandHandler {

	@Resource(name="memberDao")
	private MemberDao dao;
	
	@RequestMapping("/idfindPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		String email1 = request.getParameter( "email1" );
		String email2 = request.getParameter( "email2" );
		String email = email1 + "@" + email2;
		System.out.println(email);
		String result = dao.echeck(email);	
		
		request.setAttribute("result", result);
		request.setAttribute("email", email);
		
		return new ModelAndView("final/idfindPro") ;
	}

}
