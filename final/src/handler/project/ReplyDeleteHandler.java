package handler.project;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.reply.ReplyDao;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class ReplyDeleteHandler implements CommandHandler{
	
	@Resource( name="ReplyDao")
	private ReplyDao ReplyDao;
	
	@RequestMapping("/replyDelete")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {

		int reply_num = Integer.parseInt(request.getParameter("num"));
		int schedule_num = Integer.parseInt(request.getParameter("schedule_num"));
		
		int result = ReplyDao.deleteReply(reply_num);
		int count = ReplyDao.getReplyNum(schedule_num);
		
		request.setAttribute("result", result);
		request.setAttribute("reply_num", reply_num);
		request.setAttribute("count", count);
		
		
		
		
		// TODO Auto-generated method stub
		return new ModelAndView("final/reply/replyDelete");
	}
}
