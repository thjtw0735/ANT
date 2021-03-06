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
public class ModifyViewHandler implements CommandHandler {

	@Resource(name="memberDao")
	private MemberDao dao;
	
	
	@RequestMapping("/modifyView")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
	

		String id = (String) request.getSession().getAttribute("memId");
		String passwd = request.getParameter("passwd");
		
		int result = dao.check( id, passwd );
		
		request.setAttribute("result", result);
		
		if(result == 1){
			
			MemberDataBean dto = dao.getMember( id );
			request.setAttribute("dto", dto);
		}
		
		
		return new ModelAndView("final/modifyView");
	}

}
