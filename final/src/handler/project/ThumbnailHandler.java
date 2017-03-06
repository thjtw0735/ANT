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
public class ThumbnailHandler implements CommandHandler{
	
	@Resource(name="memberDao")
	private MemberDao dao;
	
	@RequestMapping("/thumbnail")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
	
		request.setAttribute("server", request.getServletContext().getRealPath("/"));
		String src = request.getParameter( "src" );
		request.setAttribute("src", src);
		String src2 = request.getParameter("src2");
		request.setAttribute("src2", src2);
		String id = request.getParameter("id");
		request.setAttribute("id", id);

		
		System.out.println(src + " , " + id);
		
		MemberDataBean mdb=dao.getMember(id);
		request.setAttribute("mdb", mdb);
		
		return new ModelAndView("final/thumbnail");
	}

}
