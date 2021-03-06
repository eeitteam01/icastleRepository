package com.icastle.hotels.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/hote/Logout.do")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LogoutServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String contextPath = request.getContextPath();
		HttpSession session = request.getSession();
		
//		取出所有的Attr名，清除session
		Enumeration e = session.getAttributeNames();
		while(e.hasMoreElements()){
			String name = (String)e.nextElement();
			session.removeAttribute(name);
		}
//		session.removeAttribute("HotelLoginOK");
//		session.removeAttribute("MemberLoginOK");
//		session.removeAttribute("ManagerLoginOK");
		
		//轉交到index.jsp
		response.sendRedirect(contextPath + "/index.jsp");
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
