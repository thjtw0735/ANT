package handler.project;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.jdt.internal.compiler.parser.ParserBasicInformation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class PwCheckHandler implements CommandHandler{
	@RequestMapping("/passwdCheck")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		int passwd  = Integer.parseInt( request.getParameter("passwd") );
		int repasswd  = Integer.parseInt( request.getParameter("repasswd") );
		
		request.setAttribute("passwd", passwd);
		request.setAttribute("repasswd", repasswd);
		
		
		return new ModelAndView("final/passwdCheck");
	}
}