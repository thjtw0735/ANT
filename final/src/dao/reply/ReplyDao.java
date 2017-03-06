package dao.reply;

import java.util.List;
import java.util.Map;


public interface ReplyDao {
	public int AppendReply(ReplyDataBean dto);
	public List<ReplyDataBean> getReply(int schedule_num);
	public int deleteReply(int reply_num);
	public int getReplyMaxNum(int schedule_num);
	public int getReplyNum(int schedule_num);
	public int getMatchingReplyNum( String memId );
	public int getReplyCount( String memId );
	public List<ReplyDataBean> getReplyList(Map<String, String> map);
	public List<ReplyDataBean> getPImage( String id );
}
