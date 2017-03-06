package handler.project;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class CreateScheduleHandler implements CommandHandler {

	@RequestMapping("/createSchedule")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		String id = (String) request.getSession().getAttribute( "memId" );
		System.out.println("id : " + id);
		if(id==null) {
			request.setAttribute("result", 0);
		} else {
			String start_date = request.getParameter( "start_date" );
			request.setAttribute("start_date", start_date);
			
			String stay_date = request.getParameter("stay_date");
			request.setAttribute("stay_date", stay_date);
			request.setAttribute("result", 1);
			System.out.println(stay_date);
			System.out.println(start_date);
		}
		
		return new ModelAndView("final/createSchedule");
	}

}
