package dao.matching;

import org.springframework.stereotype.Component;

import dao.member.MemberDataBean;
import db.SqlMapClient;

@Component("MatchingDao")
public class MatchingDBBean implements MatchingDao {

	@Override
	public int setMathcingId(MatchingDataBean dto) {
		return SqlMapClient.getSession().insert( "Matching.setMatchingId", dto );
	}

	@Override
	public int getSchedule_Num(String id) {
		return SqlMapClient.getSession().selectOne("Matching.getSchedule_Num", id);
	}

	@Override
	public MemberDataBean getId(int schedule_num) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSession().selectOne("Matching.getId", schedule_num);
	}

	@Override
	public String getSchedule_Num_Id(int schedule_num) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSession().selectOne("Matching.getSchedule_Num_Id", schedule_num);
	}


}
