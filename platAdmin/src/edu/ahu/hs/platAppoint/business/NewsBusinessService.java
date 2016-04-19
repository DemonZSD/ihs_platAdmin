package edu.ahu.hs.platAppoint.business;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSONObject;

import edu.ahu.hs.platAppoint.DAO.*;
import edu.ahu.hs.platAppoint.beans.*;
import edu.ahu.hs.platAppoint.web.IDataService;

public class NewsBusinessService implements IDataService{
	NewsInfoDAO nid = new NewsInfoDAO();
	@Override
	public Object handler(String action, HttpServletRequest request)
			throws Exception {
		//获取所有新闻信息
		if("getAllNews".equals(action)){
			List<NewsBean> beans = nid.getAllNews();
			if (beans != null && beans.size() > 0) {
				JSONObject json = new JSONObject();
				json.put("Rows", beans);
				json.put("Total", beans.size());
				return json;
			} else {
				return null;
			}
		}//获取新闻信息
		if("getNewsInfo".equals(action)){
			return nid.getAllNews();
		}//添加新闻
		if("addNewsInfo".equals(action)){
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int order = Integer.parseInt(request.getParameter("order"));
			String time = request.getParameter("time");
			String owner =  request.getParameter("owner");
			NewsBean newsbean = new NewsBean(title, content, order, time, owner);
			return nid.addNews(newsbean);
		}
		//删除新闻信息
		if("delNewsInfo".equals(action)){
			String newsId = request.getParameter("newsId");
			return nid.delNewsById(newsId);
		}
		//修改新闻信息
		if("updateNewsInfo".equals(action)){
			int newsId= Integer.parseInt(request.getParameter("newsId"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String owner = request.getParameter("owner");
			int order = Integer.parseInt(request.getParameter("order"));
			String time = request.getParameter("time");
			
			NewsBean newsbean = new NewsBean();
     	    newsbean.setNewsId(newsId);
     	    newsbean.setTitle(title);
     	    newsbean.setOwner(owner);
     	    newsbean.setContent(content);
     	    newsbean.setOrder(order);
     	    newsbean.setTime(time);
     	    
     	    return nid.updateNewsById(newsbean);
		}
		return null;
	}

}
