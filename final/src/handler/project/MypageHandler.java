package handler.project;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.member.MemberDao;
import dao.member.MemberDataBean;
import dao.schedule.ScheduleDao;
import dao.schedule.ScheduleDataBean;
import handler.CommandHandler;
import handler.HandlerException;




@Controller
public class MypageHandler implements CommandHandler{

	@Resource(name="memberDao")
	private MemberDao dao;
	
	@Resource( name="ScheduleDao")
	private ScheduleDao ScheduleDao;
	
	@RequestMapping("/mypage")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		int page = 0;
		String id = (String)request.getSession().getAttribute("memId");
		String content = request.getParameter("content");
		request.setAttribute("content", content);		
		
		
		if( id == null ){
			System.out.println("널일때" + id );
		} else {
			int resultP = dao.myPImageCheck(id);
			int resultB = dao.myBImageCheck(id);
			String originName = "";
			String boriginName = "";
			String intro="";
			if(resultB == 0 && resultP == 0){
				//아이디에 저장된 이미지가 없는 경우.
				MemberDataBean mdb = dao.getMember(id);	
				originName = "none.png";
				boriginName = "background.jpg";
				intro = mdb.getIntro();
				request.setAttribute("originName", originName);
				request.setAttribute("boriginName", boriginName);
				request.setAttribute("intro", intro);

			}else if(resultP == 0 && resultB != 0){
				//저장된 이미지가 있는 경우.
				MemberDataBean mdb = dao.getMember(id);		
				originName = "none.png";
				boriginName=mdb.getbImage();
				intro = mdb.getIntro(); 
				
				request.setAttribute("boriginName", boriginName);
				request.setAttribute("originName", originName);
				request.setAttribute("intro", intro);
			} else if(resultP != 0 && resultB == 0 ){
				//저장된 이미지가 있는 경우.
				MemberDataBean mdb = dao.getMember(id);		
				originName=mdb.getpImage();
				boriginName = "background.jpg";
				intro = mdb.getIntro(); 
				
				
				request.setAttribute("boriginName", boriginName);
				request.setAttribute("originName", originName);
				request.setAttribute("intro", intro);
			} else if ( resultP != 0 && resultB !=0 ){
				//저장된 이미지가 있는 경우.
				MemberDataBean mdb = dao.getMember(id);		
				originName=mdb.getpImage();
				boriginName = mdb.getbImage();
				intro = mdb.getIntro(); 
				
				
				request.setAttribute("boriginName", boriginName);
				request.setAttribute("originName", originName);
				request.setAttribute("intro", intro);
			}
			
			List <ScheduleDataBean> list = ScheduleDao.getSchedule( id );
			request.setAttribute("list", list);
		}
		
		
		
	
		return new ModelAndView("final/mypage");
	}

}
