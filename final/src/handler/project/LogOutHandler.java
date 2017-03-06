package handler.project;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.schedule.ScheduleDao;
import dao.schedule.ScheduleDataBean;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class LogOutHandler implements CommandHandler {

	@Resource( name="ScheduleDao")
	private ScheduleDao ScheduleDao;
	
	@RequestMapping("/logout")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		int page = 0;
		String word= request.getParameter("word");
		
		if( word == null ){
			List <ScheduleDataBean> list = ScheduleDao.getSchedule();
			request.setAttribute("list", list);
		} else {
			Map<String, String> map 
			= new HashMap<String , String>();
			map.put("word", word);
			List <ScheduleDataBean> list = ScheduleDao.getSearchMain( map );
			request.setAttribute("list", list);
		}
	
		request.setAttribute("page", page);
		request.setAttribute("word", word);
		
		request.getSession().removeAttribute("memId");
		request.getSession().removeAttribute("lastcount");
		
		return new ModelAndView( "final/main");
	}

}
