package dao.member;

import java.util.List;
import java.util.Map;

public interface MemberDao {
	
	public MemberDataBean idCheck( String id );
	public int myPImageCheck(String id);
	public int myBImageCheck(String id);
	public int getMaxCount();
	public MemberDataBean getMember(String id);
	
	public int insertMember(MemberDataBean dto);
	public int editPImage(MemberDataBean mdb);

	public int editIntro(String id);
	public int modifyMember(MemberDataBean dto);
	public int deleteMember(String id);
	public int check(String id);
	public int check(String id, String passwd);
	public String echeck(String email);
	public List<MemberDataBean> infocheck(Map<String, String> map);
	public MemberDataBean emailCheck(String email);
}
