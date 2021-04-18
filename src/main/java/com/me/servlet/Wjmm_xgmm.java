package com.me.servlet;

import com.me.dao.dao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

/**
 * @Auther: wzs
 * @Date: 2021/4/17 14:55
 * @Description:
 */
@WebServlet("/Wjmm_xgmm")
public class Wjmm_xgmm extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");

        HttpSession session = request.getSession(true);
        int id=(int) session.getAttribute("id");//获取session中正确的验证码值
        String password = request.getParameter("mm");
        dao dao = new dao();
        try {
            int f = dao.Wjmm_xgmm(id,password);
            if(f!=0) {
                response.getWriter().write("<script>alert('密码修改成功，请进行登录！');window.location.href='"+request.getContextPath()+"/index.jsp'</script>");
            }else {
                response.getWriter().write("<script>alert('操作超时！');window.location.href='"+request.getContextPath()+"/Wjmm_xgmm.jsp'</script>");
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
