package dao.timetable;

import java.util.List;

import org.springframework.stereotype.Component;

import dao.schedule.ScheduleDataBean;
import db.SqlMapClient;

@Component("TimetableDao")
public class TimetableDBBean implements TimetableDao{

	@Override
	public int insertTimetable(TimetableDataBean dto) {
		return SqlMapClient.getSession().insert( "Timetable.insertTimetable", dto );
	}
	@Override
	public int deleteTimetable(int timetable_index, int schedule_num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyTimetable(int timetable_index, int schedule_num) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public List<TimetableDataBean> getTimetable(int schedule_num) {
		return SqlMapClient.getSession().selectList("Timetable.getTimetable", schedule_num);
	}
	@Override
	public int deleteTimetable(int schedule_num) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSession().delete("Timetable.deleteTimetable", schedule_num);
	}
}
