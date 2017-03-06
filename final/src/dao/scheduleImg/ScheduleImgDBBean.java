package dao.scheduleImg;

import org.springframework.stereotype.Component;

import db.SqlMapClient;

@Component("ScheduleImgDao")
public class ScheduleImgDBBean implements ScheduleImgDao{

	@Override
	public int insertScheduleImg(ScheduleImgDataBean dto) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSession().insert("ScheduleImg.insertScheduleImg", dto);
	}

	@Override
	public ScheduleImgDataBean getScheduleImg(int schedule_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateScheduleImg(ScheduleImgDataBean dto) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSession().update("ScheduleImg.updateScheduleImg", dto);
	}

}
