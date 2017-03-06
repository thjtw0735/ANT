package handler.project;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.matching.MatchingDao;
import dao.matching.MatchingDataBean;
import dao.schedule.*;
import dao.scheduleImg.ScheduleImgDao;
import dao.scheduleImg.ScheduleImgDataBean;
import dao.story.StoryDataBean;
import dao.story.StoryDao;
import dao.timetable.TimetableDao;
import dao.timetable.TimetableDataBean;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class CreateScheduleProHandler implements CommandHandler{
	
	@Resource(name="ScheduleDao")
	private ScheduleDao ScheduleDao;
	
	@Resource(name="TimetableDao")
	private TimetableDao TimetableDao;
	
	@Resource(name="MatchingDao")
	private MatchingDao MatchingDao;
	
	@Resource(name="StoryDao")
	private StoryDao StoryDao;
	
	@Resource(name="ScheduleImgDao")
	private ScheduleImgDao ScheduleImgDao;
	
	
	@RequestMapping("/createSchedulePro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		String id = (String) request.getSession().getAttribute( "memId" );
		System.out.println("id : " + id);

		
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		String stay_date = request.getParameter("stay_date");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String spot = request.getParameter("spot");
		int spot_num = Integer.parseInt(request.getParameter("spot_num"));
		String timetable_date = request.getParameter("timetable_date");
		String timetable_time = request.getParameter("timetable_time");
		String timetable_content = request.getParameter("timetable_content");
		String timetable_title = request.getParameter("timetable_title");
		String timetable_address = request.getParameter("timetable_address");
		
		ScheduleDataBean scheduleDto = new ScheduleDataBean();
		scheduleDto.setSchedule_subject(subject);
		scheduleDto.setSchedule_content(content);
		scheduleDto.setSchedule_start(start_date);
		scheduleDto.setSchedule_end(end_date);
		scheduleDto.setSchedule_stay(stay_date);
		scheduleDto.setSchedule_spotnum(spot_num);
		scheduleDto.setSchedule_spot(spot);
		
		// 아이디와 스케줄넘을 디비에 넣어라
		MatchingDataBean MatchingDto = new MatchingDataBean();
		MatchingDto.setId(id);
		MatchingDto.setSchedule_num(0);
		int resultMatching = MatchingDao.setMathcingId(MatchingDto);
		
		// 해당 아이디에 있는 스케줄넘을 내림차순으로 맨위에꺼 하나가져와라
		int schedule_num = MatchingDao.getSchedule_Num(id);
		System.out.println("스케쥴넘 : " + schedule_num);
		scheduleDto.setSchedule_num(schedule_num);
		int resultSchedule = ScheduleDao.insertSchedule(scheduleDto);
		request.setAttribute( "resultSchedule", resultSchedule );
		
		
		
		String Tdate[] = timetable_date.split(",");
		String Ttime[] = timetable_time.split(",");
		String Tcontent[] = timetable_content.split(",");
		String Ttitle[] = timetable_title.split(",");
		String Taddress[] = timetable_address.split(",");
			
		TimetableDataBean timetableDto = new TimetableDataBean();
		
		for(int i=0; i<Tdate.length; i++) {
			timetableDto.setTimetable_index(i);
			// timetableDto.setSchedule_num(schedule_num);
			timetableDto.setTimetable_date(Tdate[i]);
			timetableDto.setTimetable_time(Ttime[i]);
			timetableDto.setTimetable_content(Tcontent[i]);
			timetableDto.setTimetable_title(Ttitle[i]);
			timetableDto.setTimetable_address(Taddress[i]);
			timetableDto.setSchedule_num(schedule_num);
			int resultTimetable = TimetableDao.insertTimetable(timetableDto);
			request.setAttribute("resultTimetable", resultTimetable);
		}
		
		String story_content = request.getParameter("story_content");
		String story_subject = request.getParameter("story_subject");
		
		System.out.println("스토리 : " + story_content);
		System.out.println("스토리 : " + story_subject);
		
		String Scontent[] = story_content.split(",");
		String Ssubject[] = story_subject.split(",");
		
		for(int i=0; i<Scontent.length; i++) {
			StoryDataBean storyDto = new StoryDataBean();
			storyDto.setSchedule_num(schedule_num);
			storyDto.setStory_subject(Ssubject[i]);
			storyDto.setStory_content(Scontent[i]);
			
			int result = StoryDao.insertStory(storyDto);
		}
		
		String imgSet = request.getParameter("imgSet");
		ScheduleImgDataBean scheduleImgDto = new ScheduleImgDataBean();
		scheduleImgDto.setSchedule_num(schedule_num);
		scheduleImgDto.setImg(imgSet);
		
		int imgResult = ScheduleImgDao.insertScheduleImg(scheduleImgDto);
		
		
		return new ModelAndView("final/createSchedulePro");
	}

}
