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
public class ConfirmIdHandler implements CommandHandler {
	
	@Resource(name="memberDao")
	private MemberDao dao;

	@RequestMapping("/confirmId")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		String id = request.getParameter( "id" );
		int result = dao.check(id);	
		request.setAttribute("result", result);
		request.setAttribute("id", id);
		
		// TODO Auto-generated method stub
		return new ModelAndView("final/confirmId");
	}
}
