package dao.matching;

import dao.member.MemberDataBean;

public interface MatchingDao {
	public int setMathcingId(MatchingDataBean dto);
	public int getSchedule_Num(String id);
	public MemberDataBean getId(int schedule_num);
	public String getSchedule_Num_Id(int schedule_num);
}
