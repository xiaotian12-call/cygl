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
 * @Date: 2021/4/17 14:57
 * @Description:
 */
@WebServlet("/WjmmServlet")
public class WjmmServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");

        String method = request.getParameter("method");
        String username = request.getParameter("username");
        String name = request.getParameter("xm");
        String email = request.getParameter("email");
        HttpSession session = request.getSession(true);
        String rand =(String)session.getAttribute("rand");//获取session中正确的验证码值
        String yzm = request.getParameter("yzm");
        if(!yzm.equals(rand)) {
            response.getWriter().write("<script>alert('验证码错误！');window.location.href='"+request.getContextPath()+"/Wjmm_sfyz.jsp'</script>");
        }else {
            dao dao = new dao();
            try {
                int id  = dao.Wjmm_sfyz(username,name,email);
                session.setAttribute("id", id);


                if(id!=0) {
                    response.getWriter().write("<script>alert('身份验证成功！');window.location.href='"+request.getContextPath()+"/Wjmm_xgmm.jsp'</script>");
                }else {
                    response.getWriter().write("<script>alert('身份验证失败！');window.location.href='"+request.getContextPath()+"/Wjmm_sfyz.jsp'</script>");
                }
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }
}
