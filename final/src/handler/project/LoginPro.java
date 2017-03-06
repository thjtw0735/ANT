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
public class LoginPro implements CommandHandler{

	@Resource(name="memberDao")
	private MemberDao dao;
	
	
	@RequestMapping("/loginPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		int result = dao.check( id , passwd);
		
		request.setAttribute("result", result);
		
		if(result == 1) {
			request.getSession().setAttribute("memId", id);
		}
		
		return new ModelAndView("final/loginPro");
	}

}
