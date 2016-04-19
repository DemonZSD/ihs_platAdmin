package edu.ahu.hs.platAppoint.IDAO;

import java.util.ArrayList;

import edu.ahu.hs.platAppoint.beans.*;

public interface INewsInfoDAO {
	
	//获取所有新闻列表
	public ArrayList<NewsBean> getAllNews();
	//获取新闻信息
	public NewsBean getNewsById(String newsId);
	//删除新闻信息
	public boolean delNewsById(String newsId);
	//修改新闻信息
	public boolean updateNewsById(NewsBean newsbean);
	//添加新闻信息
	public boolean addNews(NewsBean newsbean);
}
