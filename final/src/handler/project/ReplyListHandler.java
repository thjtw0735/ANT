package handler.project;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.reply.ReplyDao;
import dao.reply.ReplyDataBean;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class ReplyListHandler implements CommandHandler {
	
	@Resource( name="ReplyDao")
	private ReplyDao ReplyDao;
	
	@RequestMapping("/replyList")
		@Override
		public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {

		int schedule_num =  Integer.parseInt(request.getParameter("schedule_num"));
		List<ReplyDataBean> list = ReplyDao.getReply(schedule_num);
		int count = ReplyDao.getReplyNum(schedule_num);
		
		/*System.out.println(list.get(0).getReply_content());*/
		request.setAttribute("list", list);
		request.setAttribute("count", count);
	
		return new ModelAndView("final/reply/replyList");
				
		}
}
