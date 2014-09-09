package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.UserBean.UserBean;

public class UserServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		String method = (String) request.getParameter("method");
		if (method == null) {
			PrintWriter out = response.getWriter();
			out.println("invalid request!");
		} else if (method.equals("login")) {
			Login(request, response);
		} else if (method.equals("logout")) {
			Logout(request, response);
		} else if (method.equals("register")) {
			Register(request, response);
		} else if (method.equals("reset")) {
			try {
				Reset(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (method.equals("gouwuche")) {
			try {
				gouwuche(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(method.equals("receiveinfo")){
			try {
				receiveinfo(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	protected void receiveinfo(HttpServletRequest request,
			HttpServletResponse response) throws SQLException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String receivename = request.getParameter("receivename");
		String receiveadds = request.getParameter("receiveadds");
		String receivetel = request.getParameter("receivetel");
		String username = (String)session.getAttribute("username");
		receivename = new String(receivename.getBytes("8859_1"), "GBK");
		receiveadds = new String(receiveadds.getBytes("8859_1"), "GBK");
		receivetel = new String(receivetel.getBytes("8859_1"), "GBK");
		UserBean userbean = new UserBean();
		userbean.addOrderInfo(username, receivename, receiveadds, receivetel);
		response.sendRedirect("myorder.jsp");
	}

	protected void gouwuche(HttpServletRequest request,
			HttpServletResponse response) throws SQLException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		System.out.println(request.getParameter("id"));//null
		int id1 = Integer.parseInt(request.getParameter("id"));
		String username = (String) session.getAttribute("username");
		UserBean userbean = new UserBean();
		if(username!=null){
			userbean.addOrder(username,id1);
		}else{
			System.out.println("请先登录！");
			response.sendRedirect("login.jsp");
		}
		

	}

	protected void Reset(HttpServletRequest request,
			HttpServletResponse response) throws SQLException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String newPassword1 = request.getParameter("newPassword1");
		String newPassword2 = request.getParameter("newPassword2");
		System.out.println("--username:--" + username + "password:" + password
				+ "newPassword1:" + newPassword1 + "newPassword2:"
				+ newPassword2);
		UserBean userbean = new UserBean();
		if (userbean.isMatch(username, password)) {
			if (newPassword2.equals(newPassword1)) {
				if (userbean.update(username, password, newPassword1)) {
					response.sendRedirect("login.jsp");
					System.out.println("更新成功！");
				} else {
					System.out.println("更新失败！");
				}
			} else {
				System.out.println("两次输入密码不一致");
				response.sendRedirect("resetpwd.jsp");
			}
		} else {
			System.out.println("用户名和原密码不一致");
			response.sendRedirect("resetpwd.jsp");
		}
	}

	protected void Login(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String msg;
		if ((username == null) || (password == null)) {
			response.sendRedirect("login.jsp");
		}
		UserBean userbean = new UserBean();
		boolean isValid = userbean.valid(username, password);
		System.out.println(isValid);
		if (isValid) {
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			response.sendRedirect("book.jsp");
			return;
		} else {
			response.sendRedirect("login.jsp");
			return;
		}
	}

	protected void Logout(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("username");
		response.sendRedirect("main.jsp");
	}

	protected void Register(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String username = request.getParameter("username");
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		String email = request.getParameter("email");

		if ((username == null) || (password1 == null) || (password2 == null)
				|| !password1.equals(password2)) {
			response.sendRedirect("register.jsp");
			System.out.println("用户名或密码为空");
		}
		UserBean userbean = new UserBean();
		boolean isExist = false;
		isExist = userbean.isExist(username);
		if (isExist) {
			userbean.add(username, password1, email);
			response.sendRedirect("login.jsp");
		} else {
			response.sendRedirect("register.jsp");
			System.out.println("该用户名已存在");
		}
	}
}
