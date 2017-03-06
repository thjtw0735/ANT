package dao.story;

import java.util.List;
import java.util.Map;

import dao.schedule.ScheduleDataBean;

public interface StoryDao {
	public int insertStory(StoryDataBean dto);
	public List<StoryDataBean> getStoryList(int schedule_num);
	public int deleteStory(int schedule_num);
	
	public int getStoryCount(Map<String, String> countword);
	public int getStoryCount();
	public List<StoryDataBean> getStory();
	public List<StoryDataBean> getStory(Map<String, String> storymap);
	public List<StoryDataBean> getSearch(Map<String, String> storymap);
	public List<StoryDataBean> getStoryMain(Map<String, String> storymap);
}
