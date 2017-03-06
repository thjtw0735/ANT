package handler.project;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.schedule.ScheduleDao;
import dao.schedule.ScheduleDataBean;
import dao.story.StoryDao;
import dao.story.StoryDataBean;
import dao.timetable.TimetableDao;
import dao.timetable.TimetableDataBean;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class ModifyScheduleViewHandler implements CommandHandler{
	@Resource(name="ScheduleDao")
	private ScheduleDao ScheduleDao;
	
	@Resource(name="TimetableDao")
	private TimetableDao TimetableDao;
	
	@Resource(name="StoryDao")
	private StoryDao StoryDao;
	
	
	@RequestMapping("/modifyScheduleView")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		int page=0;
		String schedule_num = request.getParameter("schedule_num");
		ScheduleDataBean scheduleDto = ScheduleDao.getIdSchedule(Integer.parseInt(schedule_num));
		
		List<TimetableDataBean> timetableDto = TimetableDao.getTimetable(Integer.parseInt(schedule_num));
		List<StoryDataBean> storyDto = StoryDao.getStoryList(Integer.parseInt(schedule_num));
		request.setAttribute("storyDto", storyDto);
		request.setAttribute("scheduleDto", scheduleDto);
		request.setAttribute("timetableDto", timetableDto);
		request.setAttribute("schedule_num", schedule_num);
		request.setAttribute("page", page);
		
		return new ModelAndView("final/modifyScheduleView");
	}

}
