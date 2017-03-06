package dao.schedule;

import java.util.List;
import java.util.Map;

public interface ScheduleDao {
	public List<ScheduleDataBean> getSchedule();
	public List<ScheduleDataBean> getSchedule( String id );
	public List<ScheduleDataBean> getSchedule( Map<String, String> map);
	public int getScheduleCount(Map<String, String> countword );
	public int getScheduleCount();
	public int getMaxCount();
	public List<ScheduleDataBean> getSearchMain(Map<String, String> map);
	public List<ScheduleDataBean> getSearch( Map<String, String> map);
	/*public int getScheduleCount(String word);*/
	public int insertSchedule(ScheduleDataBean dto);
	public ScheduleDataBean getIdSchedule(int schedule_num);
	public int deleteSchedule(int schedule_num);
	public int modifySchedule(ScheduleDataBean dto);
	public List<ScheduleDataBean> getMouseOverSchedule(String title);
}
