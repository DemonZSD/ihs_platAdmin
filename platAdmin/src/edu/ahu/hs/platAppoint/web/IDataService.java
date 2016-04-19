package edu.ahu.hs.platAppoint.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
public interface IDataService {
	public Object handler(String action,HttpServletRequest request) throws Exception;
}
