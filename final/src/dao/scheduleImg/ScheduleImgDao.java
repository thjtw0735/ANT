package dao.scheduleImg;

public interface ScheduleImgDao {
	public int insertScheduleImg(ScheduleImgDataBean dto);
	public ScheduleImgDataBean getScheduleImg(int schedule_num);
	public int updateScheduleImg(ScheduleImgDataBean dto);
}
