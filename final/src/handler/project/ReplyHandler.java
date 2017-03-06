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

import dao.reply.ReplyDao;
import dao.reply.ReplyDataBean;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class ReplyHandler implements CommandHandler {
	
	@Resource( name="ReplyDao")
	private ReplyDao ReplyDao;
	
	@RequestMapping("/reply")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String memId = request.getParameter("memId");
		System.out.println("멤아이디는 " + memId);
/*		int page = 1;
		String checkStr = null;
		int check =0;
		String word = null;
		checkStr = request.getParameter("check");
		if ( checkStr != null){
			check = Integer.parseInt(checkStr);
		}
		word = request.getParameter("word");
*/		
		int pageSize = 5;			// 한페이지에 출력할 글 개수
		int pageBlock = 3;			// 한 번에 보여줄 페이지 개수
		int count = 0;
		
		String pageNum = null;
		int currentPage = 0;		// 현재 페이지 
		int start = 0;				// 현재 페이지 시작 번호
		int end = 0;				// 현재 페이지 끝 번호
		int number = 0;				// 출력용 글번호 계산
		
		int pageCount = 0;			// 페이지 개수
		int startPage = 0;			// 보여줄 페이지의 시작 번호
		int endPage = 0;			// 보여줄 페이지의 끝 번호
		
		/*if( check != 0 ){
		count = ScheduleDao.getScheduleCount(word);
		Map<String, String> countword 
		= new HashMap<String , String>();
		countword.put("word", word );
		count = ScheduleDao.getScheduleCount(countword);
		System.out.println("count : " + count);
		} else {
			count = ScheduleDao.getScheduleCount();
			System.out.println(count);
		}*/
		
		count = ReplyDao.getReplyCount( memId );
		System.out.println(count);

		pageNum = request.getParameter( "pageNum" );
		if( pageNum == null || pageNum.equals( "" ) ) {
			pageNum = "1";
		}
		currentPage = Integer.parseInt( pageNum );
		pageCount = count / pageSize + ( count % pageSize > 0 ? 1 : 0 );
		if( currentPage > pageCount ) currentPage = pageCount; 
		
		start = ( currentPage -1 ) * pageSize + 1;	// ( 5 - 1 ) * 10 + 1	41
		end = start + pageSize - 1;					// 41 + 10 - 1			50
		if( end > count ) end = count;	
		
		number = count - ( currentPage -1 ) * pageSize;	// 50 - ( 2-1 ) * 10
		
		if( count > 0 ) {		
			startPage = ( currentPage / pageBlock ) * pageBlock + 1; 	
						// ( 15 / 10 ) * 10 + 1		11	
			if( currentPage % pageBlock == 0 ) startPage -= pageBlock;			
			endPage = startPage + pageBlock - 1;
						// 11 + 10 -1 				20
			if( endPage > pageCount ) endPage = pageCount;
		}
		
		request.setAttribute( "count", count );
		request.setAttribute( "pageNum", pageNum );
		
		if (count == 0 ){
			
		} else {
			// 글이 있는 경우
			String a = String.valueOf(start);
			String b = String.valueOf(end);
			System.out.println("a값 : " + a );
			System.out.println("b값 : " + b );
			
			Map<String, String> map 
				= new HashMap< String , String>();
			map.put( "a", a );
			map.put( "b", b );
			map.put("id", memId);
			

			List<ReplyDataBean> list = ReplyDao.getReplyList( map );
			request.setAttribute( "list", list );

			
			request.setAttribute( "number", number );
			request.setAttribute( "currentPage", currentPage );
			request.setAttribute( "pageBlock", pageBlock );
			request.setAttribute( "startPage", startPage );
			request.setAttribute( "endPage", endPage );
			request.setAttribute( "pageCount", pageCount );
		}
			
		return new ModelAndView("final/reply");
	}
}
