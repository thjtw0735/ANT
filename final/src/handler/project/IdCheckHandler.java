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
public class IdCheckHandler implements CommandHandler {

	@Resource( name="memberDao")
	private MemberDao memberDao;
	
	@RequestMapping("/idCheck")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		String id = request.getParameter("id");
		System.out.println("아이디 오나 : "  + id);
		
		MemberDataBean list = memberDao.idCheck( id );
		request.setAttribute("list", list);
		
		
		return new ModelAndView("final/idCheck");
	}
}
