package handler.project;


import java.sql.Timestamp;
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
public class ReplyAppendHandler implements CommandHandler {
	
	
	@Resource( name="ReplyDao")
	private ReplyDao ReplyDao;
	
	@RequestMapping("/replyAppend")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {

	int schedule_num = Integer.parseInt(request.getParameter("schedule_num"));
	String id = request.getParameter("id");
	String content = request.getParameter("content");
	
	ReplyDataBean dto = new ReplyDataBean();
	dto.setReply_content(content);
	dto.setSchedule_num(schedule_num);
	dto.setReply_id(id);
	
	int result = ReplyDao.AppendReply(dto);
	int maxnum = ReplyDao.getReplyMaxNum(schedule_num);
	int count = ReplyDao.getReplyNum(schedule_num);

	 List<ReplyDataBean> dao = ReplyDao.getPImage( id );
	 System.out.println(dao.get(0).getpImage());
	
	 String pImage = dao.get(0).getpImage();
	 Timestamp date = dao.get(0).getReply_date();
	
	request.setAttribute("date", date);
	request.setAttribute("content", content);
	request.setAttribute("result", result);
	request.setAttribute("id", id);
	request.setAttribute("maxnum", maxnum);
	request.setAttribute("pImage", pImage);
	request.setAttribute("count", count);
	
	
		return new ModelAndView("final/reply/replyAppend");
	}
}
