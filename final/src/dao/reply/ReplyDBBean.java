package dao.reply;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import db.SqlMapClient;

@Component("ReplyDao")
public class ReplyDBBean implements ReplyDao {

	@Override
	public int AppendReply(ReplyDataBean dto) {
		return SqlMapClient.getSession().insert("Reply.insertReply", dto);
	}
	
	@Override
	public List<ReplyDataBean> getReply(int schedule_num) {
		return SqlMapClient.getSession().selectList("Reply.getReplyList", schedule_num );
	}
	
	@Override
	public int getReplyMaxNum(int schedule_num) {
		return SqlMapClient.getSession().selectOne("Reply.getReplyMaxNum", schedule_num );
	}
	
	@Override
	public int getReplyNum(int schedule_num) {
		return SqlMapClient.getSession().selectOne("Reply.getReplyNum", schedule_num );
	}
	
	@Override
	public int deleteReply(int reply_num ) {
		return SqlMapClient.getSession().delete("Reply.deleteReply", reply_num);
	}
	
	@Override
	public int getMatchingReplyNum(String memId) {
		return SqlMapClient.getSession().selectOne("Reply.getMatchingReplyNum", memId );
	}
	
	@Override
	public int getReplyCount(String memId) {
		return SqlMapClient.getSession().selectOne("Reply.getReplyCount", memId );
	}
	
	@Override
	public List<ReplyDataBean> getReplyList(Map<String, String> map) {
		return SqlMapClient.getSession().selectList("Reply.getReplyAlarmList", map);
	}

	@Override
	public  List<ReplyDataBean> getPImage(String id) {
		return SqlMapClient.getSession().selectList("Reply.getPImage", id );
	}
}
