package dao.timetable;

import java.util.List;

public interface TimetableDao {
	public int insertTimetable(TimetableDataBean dto);
	public List<TimetableDataBean> getTimetable(int schedule_num);
	public int deleteTimetable(int timetable_index, int schedule_num);
	public int modifyTimetable(int timetable_index, int schedule_num);
	public int deleteTimetable(int schedule_num);
}
