package edu.ahu.hs.platAppoint.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.ahu.hs.platAppoint.DAO.NewsInfoDAO;
import edu.ahu.hs.platAppoint.beans.NewsBean;

/**
 * Servlet implementation class NewsServlet
 */
public class NewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String type = request.getParameter("type");
//		if(type.equals("getNewsInfo")){
			String newsId = request.getParameter("newsId");
			NewsInfoDAO nid = new NewsInfoDAO();
			NewsBean newBean = nid.getNewsById(newsId);
			request.setAttribute("newsinfo",newBean);
			request.getRequestDispatcher("updateNews.jsp").forward(request, response);
//		}
		
	}

}
