package handler.project;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.member.MemberDao;
import dao.member.MemberDataBean;
import handler.CommandHandler;
import handler.HandlerException;


@Controller
public class ThumbnailProHandler implements CommandHandler{
   
   @Resource(name="memberDao")
   private MemberDao dao;
   
   
   @RequestMapping("/thumbnailPro")
   @Override
   public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
      if( request.getSession().getAttribute("memId") != null ){
         String ch = request.getParameter("ch");
         
         int resultupload = 0;
   
         /*if( ch != null ) {
            */
            /*String path=request.getSession().getServletContext().getRealPath("/save");
            
            //   request.setAttribute("path", path);
            
            new File(path).mkdir();
            
            try {
               MultipartRequest multi = new MultipartRequest( request, path, 1024*1024*5, "utf-8", new DefaultFileRenamePolicy());
               //String modifyName = multi.getOriginalFileName("userfile");
               
               //넘어온 데이터 세개 받기.
               String systemName = multi.getFilesystemName("userfile");
               String bsystemName = multi.getFilesystemName("buserfile");
               String id = multi.getParameter("id");
               String intro = multi.getParameter("intro");
               
               request.setAttribute("id", id);*/
               
               /*
               mdb.setId(id);
               mdb.setbImage(bsystemName);
               mdb.setpImage(systemName);*/
               
               /*String id = request.getParameter("id");
               
               MemberDataBean mdb = new MemberDataBean();      
               
               MemberDataBean mdb2 = new MemberDataBean();   
               mdb2 = dao.getMember(id);
               
               if( mdb2.getpImage() != null ) {
                  dao.deletePImage(mdb2);
                  mdb.setpImage(mdb2.getpImage());
                  mdb.setbImage(mdb2.getbImage());
               } else {
                  mdb.setpImage(mdb2.getpImage());
                  mdb.setbImage(mdb2.getbImage());
               }
               
               mdb.setIntro(intro);
               
                  //페이지에 경로가 성공적으로 들어온 경우.
                  mdb=dao.getMember(id);      
                  request.setAttribute("Member", mdb);
                  
               }
               
            } catch (IOException e) {
               e.printStackTrace();
            }
            request.setAttribute("resultupload", resultupload);
            
            return new ModelAndView("final/thumbnail");
            
         } else{*/
            
            String path=request.getSession().getServletContext().getRealPath("/save");
            
            //   request.setAttribute("path", path);
            
            new File(path).mkdir();
            
            try {
               MultipartRequest multi = new MultipartRequest( request, path, 1024*1024*5, "utf-8", new DefaultFileRenamePolicy());
               //String modifyName = multi.getOriginalFileName("userfile");
               
               //넘어온 데이터 세개 받기.
               String systemName = multi.getFilesystemName("userfile");
               String bsystemName = multi.getFilesystemName("buserfile");
               String id = multi.getParameter("id");
               String intro = multi.getParameter("intro");
               
               request.setAttribute("id", id);
               
               MemberDataBean mdb = new MemberDataBean();      
               int result=0;
               
               mdb.setId(id);
               mdb.setbImage(bsystemName);
               mdb.setpImage(systemName);
               
               String asd = multi.getParameter("asd");
               String asdf = multi.getParameter("asdf");
               
               if( asd.equals("1") &&  asdf.equals("1") ){
                  if(systemName==null && bsystemName==null) {
                     MemberDataBean mdb2 = new MemberDataBean();   
                     mdb2 = dao.getMember(id);
                     mdb.setbImage(mdb2.getbImage());
                     mdb.setpImage(mdb2.getpImage());
                  }else if(systemName==null) {
                     //배경화면 있고 프로필 없음
                     MemberDataBean mdb2 = new MemberDataBean();   
                     mdb2 = dao.getMember(id);
                     mdb.setpImage(mdb2.getpImage());
                  }else if(bsystemName==null) {
                     MemberDataBean mdb2 = new MemberDataBean();   
                     mdb2 = dao.getMember(id);
                     mdb.setbImage(mdb2.getbImage());
                  }
               }else if( asd.equals("0") ){
                  if(systemName==null && bsystemName==null) {
                     MemberDataBean mdb2 = new MemberDataBean();   
                     mdb2 = dao.getMember(id);
                     mdb.setbImage(mdb2.getbImage());
                  }else if(systemName==null) {
                     //배경화면 있고 프로필 없음
                     MemberDataBean mdb2 = new MemberDataBean();   
                     mdb2 = dao.getMember(id);
                  }else if(bsystemName==null) {
                     MemberDataBean mdb2 = new MemberDataBean();   
                     mdb2 = dao.getMember(id);
                     mdb.setbImage(mdb2.getbImage());
                  }
               }else if( asdf.equals("0") ){
                  if(systemName==null && bsystemName==null) {
                     MemberDataBean mdb2 = new MemberDataBean();   
                     mdb2 = dao.getMember(id);
                     mdb.setpImage(mdb2.getpImage());
                  }else if(systemName==null) {
                     //배경화면 있고 프로필 없음
                     MemberDataBean mdb2 = new MemberDataBean();   
                     mdb2 = dao.getMember(id);
                     mdb.setpImage(mdb2.getpImage());
                  }else if(bsystemName==null) {
                     MemberDataBean mdb2 = new MemberDataBean();   
                     mdb2 = dao.getMember(id);
                  }
               }
               
   //            if(systemName==null && bsystemName==null) {
   //               MemberDataBean mdb2 = new MemberDataBean();   
   //               mdb2 = dao.getMember(id);
   //               mdb.setbImage(mdb2.getbImage());
   //               mdb.setpImage(mdb2.getpImage());
   //            }else if(systemName==null) {
   //               //배경화면 있고 프로필 없음
   //               MemberDataBean mdb2 = new MemberDataBean();   
   //               mdb2 = dao.getMember(id);
   //               mdb.setpImage(mdb2.getpImage());
   //            }else if(bsystemName==null) {
   //               MemberDataBean mdb2 = new MemberDataBean();   
   //               mdb2 = dao.getMember(id);
   //               mdb.setbImage(mdb2.getbImage());
   //            }
               
               mdb.setIntro(intro);
               result = dao.editPImage(mdb);
               
               if (result==1){
                  //페이지에 경로가 성공적으로 들어온 경우.
                  mdb=dao.getMember(id);      
                  resultupload = 1;
                  request.setAttribute("Member", mdb);
                  
               }
               
            } catch (IOException e) {
               e.printStackTrace();
            }
            request.setAttribute("resultupload", resultupload);
            
            return new ModelAndView("final/thumbnail");
         }else{
            return new ModelAndView("final/main");
         }
      }
/*   }*/

}