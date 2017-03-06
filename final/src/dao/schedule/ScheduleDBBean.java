package dao.schedule;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import db.SqlMapClient;

@Component("ScheduleDao")
public class ScheduleDBBean implements ScheduleDao {

	public int getScheduleCount() {
		return SqlMapClient.getSession().selectOne( "Schedule.getCount" );
	}
	
	@Override
	public List<ScheduleDataBean> getSchedule() {
		return SqlMapClient.getSession().selectList("Schedule.getDefault" );
	}
	
	@Override
	public List<ScheduleDataBean> getSchedule(String id) {
		return SqlMapClient.getSession().selectList("Schedule.getScheduleMP", id );
	}
	
	@Override
	public List<ScheduleDataBean> getSchedule(Map<String, String> map) {
		return SqlMapClient.getSession().selectList("Schedule.getSchedule", map);
	}
	
	@Override
	public List<ScheduleDataBean> getSearch(Map<String, String> map) {
		return SqlMapClient.getSession().selectList("Schedule.getSearch", map);
	}

	@Override
	public List<ScheduleDataBean> getSearchMain(Map<String, String> map) {
		return SqlMapClient.getSession().selectList("Schedule.getSearchMain", map);
	}
	
	/*public int getScheduleCount(String word) {
		System.out.println("디비빈에서 word 값 : " + word);
		return SqlMapClient.getSession().selectOne( "Schedule.getResultCount" );
	}*/
	
	@Override
	public int getScheduleCount(Map<String, String> countword) {
		return SqlMapClient.getSession().selectOne( "Schedule.getResultCount", countword );
	}
	
	@Override
	public int getMaxCount() {
		return SqlMapClient.getSession().selectOne( "Schedule.getMaxCount" );
	}

	
	@Override
	public int insertSchedule(ScheduleDataBean dto) {
		System.out.println("단계별로 확인해보자" + dto.getSchedule_subject());
		return SqlMapClient.getSession().insert( "Schedule.insertSchedule", dto );
		
	}
	
	@Override
	public ScheduleDataBean getIdSchedule(int schedule_num) {
		return SqlMapClient.getSession().selectOne( "Schedule.getIdSchedule", schedule_num );
	}
	
	
	@Override
	public int deleteSchedule(int schedule_num) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public int modifySchedule(ScheduleDataBean dto) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSession().update("Schedule.modifySchedule", dto);
	}

	@Override
	public List<ScheduleDataBean> getMouseOverSchedule(String title) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSession().selectList("Schedule.getMouseOverSchedule", title);
	}
	
}
