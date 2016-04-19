package edu.ahu.hs.platAppoint.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import edu.ahu.hs.platAppoint.business.*;
import edu.ahu.hs.platAppoint.web.IDataService;


public class JsonServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
//	private Logger logger = Logger.getLogger(JsonServiceServlet.class);
	private Map<String, IDataService> dataSerices = new HashMap<String, IDataService>();

	public JsonServiceServlet() {
		super();
		dataSerices.put("room", new RoomBusinessService());
		dataSerices.put("admin", new AdminBussinessService());
		dataSerices.put("user", new UserBussinessService());
		dataSerices.put("device", new DeviceBusinessService());
		dataSerices.put("rmReservation", new RoomOrBusinessService());
		dataSerices.put("deReservation", new DeviceOrBusinessService() );
		dataSerices.put("news", new NewsBusinessService());

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		dataService(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		dataService(request, response);
	}

	public void dataService(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String tmp = request.getParameter("service");
		IDataService ids = dataSerices.get(tmp);
		
		if (ids == null) {
			return;
		}

		String action = request.getParameter("action");
		try {
			Object obj = ids.handler(action, request);
			if (obj instanceof JSONObject) {
				JSONObject jobj = (JSONObject) obj;
				response.getWriter().println(jobj.toString());
				return;
			}
			String json = JSON.toJSONString(obj);
			System.out.println(json+"!!!!!!!!!!!!!");
			response.getWriter().println(json);
		} catch (Exception e){
			//TODO
			e.printStackTrace();
			throw new IOException(e);
		}
		
	

	}

}