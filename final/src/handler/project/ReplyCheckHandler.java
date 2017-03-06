package handler.project;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.member.MemberDao;
import dao.reply.ReplyDao;
import dao.schedule.ScheduleDao;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class ReplyCheckHandler implements CommandHandler {

	@Resource( name="ReplyDao")
	private ReplyDao ReplyDao;
	
	@Resource( name="ScheduleDao")
	private ScheduleDao ScheduleDao;
	
	@RequestMapping("/replyCheck")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		String memId = request.getParameter("memId");
		System.out.println("멤아이디 " + memId);
		int count = 0;
		int lastcount = 0;
		if( request.getSession().getAttribute( "lastcount" ) == null){
			count = ReplyDao.getMatchingReplyNum(memId);
			System.out.println("count 처음 :" + count );
			request.getSession().setAttribute( "lastcount", count );
			count = 0;
		} else {
			count = ReplyDao.getMatchingReplyNum(memId);
			lastcount = (Integer)request.getSession().getAttribute( "lastcount" );
			System.out.println("count : " + count  + "lastcount : " + lastcount );
			if( count > lastcount ) {
				System.out.println("count > lastcount");
				request.getSession().setAttribute( "lastcount", count );
			} else {
				count = 0;
			}
		}
		
			request.setAttribute( "count", count );
		
		return new ModelAndView("final/replyCheck");
	}
}
