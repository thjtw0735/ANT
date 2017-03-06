package handler.project;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class CreatePostHandler implements CommandHandler {

	@RequestMapping("/createPost")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String index = (String)request.getParameter("index");
		String content = (String)request.getParameter("content");
		String subject = (String) request.getParameter("subject");
		String imgCnt = (String) request.getParameter("imgCnt");
		if(imgCnt.equals("")) {
			imgCnt = "0";
		}
		System.out.println("imgCnt :" +imgCnt);
		//null값 넘어옴
		request.setAttribute("index", index);
		request.setAttribute("content", content);
		request.setAttribute("subject", subject);
		request.setAttribute("imgCnt", imgCnt);
		return new ModelAndView("final/createPost");
	}

}