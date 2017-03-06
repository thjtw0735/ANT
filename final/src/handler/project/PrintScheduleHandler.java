package handler.project;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.matching.MatchingDao;
import dao.member.MemberDataBean;
import dao.schedule.ScheduleDao;
import dao.schedule.ScheduleDataBean;
import dao.story.StoryDao;
import dao.story.StoryDataBean;
import dao.timetable.TimetableDao;
import dao.timetable.TimetableDataBean;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class PrintScheduleHandler implements CommandHandler{
   @Resource(name="ScheduleDao")
   private ScheduleDao ScheduleDao;
   
   @Resource(name="TimetableDao")
   private TimetableDao TimetableDao;
   
   @Resource(name="MatchingDao")
   private MatchingDao matchingDao;
   
   @Resource(name="StoryDao")
   private StoryDao storyDao;
   
   @RequestMapping("/printSchedule")
   @Override
   public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
      String schedule_num = request.getParameter("schedule_num");
      
      ScheduleDataBean scheduleDto = ScheduleDao.getIdSchedule(Integer.parseInt(schedule_num));
      MemberDataBean memberDto = matchingDao.getId(Integer.parseInt(schedule_num));
      List<TimetableDataBean> timetableDto = TimetableDao.getTimetable(Integer.parseInt(schedule_num));
      
      List<StoryDataBean> storyDto = storyDao.getStoryList(Integer.parseInt(schedule_num));
      
      request.setAttribute("scheduleDto", scheduleDto);
      request.setAttribute("timetableDto", timetableDto);
      request.setAttribute("memberDto", memberDto);
      request.setAttribute("storyDto", storyDto);
      
      return new ModelAndView("final/printSchedule");
   }

}