package dao.member;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import db.SqlMapClient;
import dao.member.MemberDataBean;

@Component("memberDao")
public class MemberDBBean implements MemberDao{
	
	@Override
	public int myPImageCheck(String id) {
		return SqlMapClient.getSession().selectOne( "Member.pimageCheck", id );
	}
	
	@Override
	public int myBImageCheck(String id) {
		return SqlMapClient.getSession().selectOne( "Member.bimageCheck", id );
	}

	@Override
	public int editPImage( MemberDataBean mdb) {
		return SqlMapClient.getSession().update("Member.editPImage", mdb);
	}

	@Override
	public MemberDataBean getMember(String id) {
		return SqlMapClient.getSession().selectOne("Member.getMember", id);
	}
	
	@Override
public int insertMember( MemberDataBean dto ) {
		
		return SqlMapClient.getSession().insert("Member.insertMember", dto);
	}

	public int check( String id ){			// 바로 리턴시킴
		return SqlMapClient.getSession().selectOne("Member.checkId", id );
	}
	
	public int check( String id, String passwd ){
		int result=0;
		if( check(id) == 0 ){
			//아이디가 없다.
			result=0; 
		} else {
			//아이디가 있다.
			MemberDataBean dto = getMember( id );
			if(dto.getPasswd().equals( passwd )){
				result = 1;
			} else {
				result = -1;
			}
		}
		return result;
	}

	public String echeck(String email) {
		return SqlMapClient.getSession().selectOne("Member.idfindMember" , email);
	}
	
	public List<MemberDataBean>infocheck(Map<String, String> map) {
	
		return SqlMapClient.getSession().selectList("Member.passwdfindMember" , map );
			
	}

	
	@Override
	public int editIntro(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyMember(MemberDataBean dto) {
		return SqlMapClient.getSession().update("Member.modifyMember", dto );
	}

	@Override
	public int deleteMember(String id) {
		return SqlMapClient.getSession().delete("Member.deleteMember", id);
	}

	@Override
	public MemberDataBean idCheck(String id) {
		System.out.println("여기까진 오자나" + id );
		return SqlMapClient.getSession().selectOne("Member.getMember", id );
	}
	
	@Override
	public int getMaxCount() {
		return SqlMapClient.getSession().selectOne( "Member.getMaxCount" );
	}
	
	@Override
	public MemberDataBean emailCheck(String email) {
	      return SqlMapClient.getSession().selectOne("Member.getEmail", email );
	   }
	
}
