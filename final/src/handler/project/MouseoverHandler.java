package handler.project;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.schedule.ScheduleDBBean;
import dao.schedule.ScheduleDao;
import dao.schedule.ScheduleDataBean;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class MouseoverHandler implements CommandHandler{

	@Resource(name="ScheduleDao")
	private ScheduleDao ScheduleDao;
	
	@RequestMapping("/mouseover")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		String title = request.getParameter("title");
		
		
		List<ScheduleDataBean> scheduleDto = ScheduleDao.getMouseOverSchedule(title);
		request.setAttribute("scheduleDto", scheduleDto);
		
		return new ModelAndView("final/mouseover");
	}

}
