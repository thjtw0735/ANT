package dao.story;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import dao.schedule.ScheduleDataBean;
import db.SqlMapClient;

@Component("StoryDao")
public class StoryDBBean implements StoryDao {
	@Override
	public int insertStory(StoryDataBean dto) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSession().insert("Story.insertStory", dto);
	}
	
	@Override
	public List<StoryDataBean> getStoryList(int schedule_num) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSession().selectList("Story.getStory", schedule_num);
	}

	@Override
	public int deleteStory(int schedule_num) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSession().delete("Story.deleteStory", schedule_num);
	}

	@Override
	public int getStoryCount(Map<String, String> countword) {
		return SqlMapClient.getSession().selectOne( "Story.getResultCount", countword );
	}

	@Override
	public int getStoryCount() {
		// TODO Auto-generated method stub
		return SqlMapClient.getSession().selectOne( "Story.getCount" );
	}

	@Override
	public List<StoryDataBean> getStory(Map<String, String> storymap) {
		// TODO Auto-generated method stub
		System.out.println("여기와야해");
		return SqlMapClient.getSession().selectList("Story.getSearchStory", storymap);
	}

	@Override
	public List<StoryDataBean> getStory() {
		return SqlMapClient.getSession().selectList("Story.getDefault" );
	}
	
	@Override
	public List<StoryDataBean> getSearch(Map<String, String> storymap) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSession().selectList("Story.getSearch", storymap);
	}
	
	@Override
	public List<StoryDataBean> getStoryMain(Map<String, String> storymap) {
		return SqlMapClient.getSession().selectList("Story.getStoryMain", storymap);
	}
	
}
