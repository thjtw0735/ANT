package handler.project;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;



@Controller
public class uploadImgHandler implements CommandHandler{

	@RequestMapping("/uploadImg")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String path = request.getSession().getServletContext().getRealPath("/save");
		System.out.println(request.getSession().getServletContext().getRealPath("/"));
		//	request.setAttribute("path", path);
			
		new File(path).mkdir();
		
		try {
			MultipartHttpServletRequest multi = (MultipartHttpServletRequest) request;	
			List<MultipartFile> files = multi.getFiles("img");
			System.out.println("날라온파일사이즈크기 : " + files.size());
			for (int i = 0; i < files.size(); i++) {
		         if (files.get(i).getOriginalFilename() != null && !files.get(i).getOriginalFilename().equals("")) {
		            String genId = UUID.randomUUID().toString(); // 파일 중복명 처리
		            String originalfileName = files.get(i).getOriginalFilename(); // 본래 파일명
		            String saveFileName = originalfileName;
		            String savePath = path + "/" + saveFileName; // 저장 될 파일 경로
		            System.out.println("genId : " + genId);
		            System.out.println("originalfileName : " + originalfileName);
		            System.out.println("saveFileName : " + saveFileName);
		            System.out.println("savePath : " + savePath);
		            try {
		               files.get(i).transferTo(new File(savePath)); // 파일 저장
		            } catch (IllegalStateException | IOException e) {
		               e.printStackTrace();
		            } 
		         }
		      }
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		}
		
		return new ModelAndView("final/uploadImg");
	}

}
