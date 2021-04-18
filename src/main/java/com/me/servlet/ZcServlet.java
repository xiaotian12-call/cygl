package com.me.servlet;

import com.me.dao.dao;
import com.me.domain.User;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.Map;

/**
 * @Auther: wzs
 * @Date: 2021/4/17 14:46
 * @Description:
 */
@WebServlet(name = "ZcServlet")
public class ZcServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");


        Map<String, String[]> map = request.getParameterMap();
        User user = new User();
        try {
            BeanUtils.populate(user, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        dao dao = new dao();
        try {
            int f = dao.ZhuCe(user);
            if(f!=0) {
                response.getWriter().write("<script>alert('注册成功，请进行登录！');window.location.href='"+request.getContextPath()+"/index.jsp'</script>");
            }else {
                response.getWriter().write("<script>alert('请求超时！');window.location.href='"+request.getContextPath()+"/index.jsp'</script>");
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }
}
