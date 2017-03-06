package handler.project;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.member.MemberDao;
import dao.member.MemberDataBean;
import handler.CommandHandler;
import handler.HandlerException;


@Controller
public class InputProHandler implements CommandHandler{


   @Resource(name="memberDao")
   private MemberDao dao;
   
   @RequestMapping("/inputPro")
   @Override
   public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {

      try{
      request.setCharacterEncoding("utf-8");
      } catch (UnsupportedEncodingException e){
         e.printStackTrace();
      }
      MemberDataBean dto = new MemberDataBean();
      dto.setId(request.getParameter("id"));
      dto.setPasswd(request.getParameter("passwd"));
      dto.setName(request.getParameter("name"));
      
      

      // email
      String email = null;
      String email1 = request.getParameter("email1");
      String email2 = request.getParameter("email2");
      
      if( ! email1.equals("") ){
         if( email2.equals( "0")){
            //직접입력
            email = email1;
         } else  {
            //선택입력
            email = email1 + "@" + email2;
         }
      }
      dto.setEmail( email );      

      // reg_date
      dto.setReg_date( new Timestamp( System.currentTimeMillis() ) );

      int result = dao.insertMember( dto );

      request.setAttribute("result", result);
      
      String id = request.getParameter("id");
      String passwd = request.getParameter("passwd");
      int result1 = dao.check( id , passwd);
      
      request.setAttribute("result1", result1);
      
      if(result == 1) {
         request.getSession().setAttribute("memId", id);
      }
      
      return new ModelAndView ("final/inputPro");
   }
  }
