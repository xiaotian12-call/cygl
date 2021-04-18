package com.me.servlet;

import com.google.gson.Gson;
import com.me.dao.Userdao;
import com.me.domain.Perm;
import com.me.domain.Sjbg;
import com.me.domain.SjbgUser;
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
import java.util.List;
import java.util.Map;

/**
 * @Auther: wzs
 * @Date: 2021/4/14 16:44
 * @Description:
 */
@WebServlet("/user")
public class UserServlet extends HttpServlet {

    Userdao dao = new Userdao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");

        String method = request.getParameter("method");
        System.out.println(method);
        if(method.equals("login")){
            try {
                login(request,response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if(method.equals("gatAllUser")){
            try {
                gatAllUser(request,response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if(method.equals("getYhxx")){
            try {
                getYhxx(request,response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if (method.equals("deleteYg")){
            deleteYg(request,response);
        }else if(method.equals("xgYhxx")){
            try {
                xgYhxx(request,response);
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if(method.equals("getYhxx2")){
            try {
                getYhxx2(request,response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if(method.equals("xgYhxx2")){
            try {
                xgYhxx2(request,response);
            } catch (InvocationTargetException | IllegalAccessException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private void getYhxx2(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        User user1 = (User) request.getSession().getAttribute("user");
        List<User> user = dao.getUser(user1.getId()+"");
        request.setAttribute("yhxx",user.get(0));
        request.getRequestDispatcher("userInfo.jsp").forward(request,response);
    }

    private void xgYhxx2(HttpServletRequest request, HttpServletResponse response) throws InvocationTargetException, IllegalAccessException, SQLException, IOException {
        Map<String, String[]> map = request.getParameterMap();
        User user = new User();
        BeanUtils.populate(user, map);
        boolean f = dao.updateUser(user);
        if(f){
            request.getSession().setAttribute("user",user);
            response.getWriter().write("<script>alert(\"修改成功！\");window.parent. location.reload();</script>");
        }else {
            response.getWriter().write("<script>alert(\"修改失败！\");window.parent. location.reload();</script>");
        }
    }

    private void xgYhxx(HttpServletRequest request, HttpServletResponse response) throws InvocationTargetException, IllegalAccessException, SQLException, IOException {
        Map<String, String[]> map = request.getParameterMap();
        User user = new User();
        BeanUtils.populate(user, map);
        boolean f = dao.updateUser(user);
        if(f){
            response.getWriter().write("<script>alert(\"修改成功！\");var index = parent. layer.getFrameIndex ( window.name);parent.layer.close(index);window.parent. location.reload();</script>");
        }else {
            response.getWriter().write("<script>alert(\"修改失败！\");var index = parent. layer.getFrameIndex ( window.name);parent.layer.close(index);window.parent. location.reload();</script>");
        }
    }

    private void deleteYg(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        boolean f = dao.deleteYg(id);
        response.getWriter().write("{\"f\":"+f+"}");
    }

    private void getYhxx(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String id = request.getParameter("id");
        List<User> user = dao.getUser(id);
        request.setAttribute("yhxx",user.get(0));
        request.getRequestDispatcher("gly_bjyhxx.jsp").forward(request,response);
    }

    private void gatAllUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String page = request.getParameter("page");
        String limit = request.getParameter("limit");
        List<User> userList = dao.getAllUser(page,limit);
        SjbgUser sjbg = new SjbgUser();
        sjbg.setCount(dao.getAllUserCount().size());
        sjbg.setMsg("");
        sjbg.setCode(0);
        sjbg.setData(userList);
        Gson gson =new Gson();
        String sjbg_json = gson.toJson(sjbg);
        System.out.println(sjbg_json);
        response.getWriter().write(sjbg_json);
    }

    private void login(HttpServletRequest request,  HttpServletResponse response) throws SQLException, ServletException, IOException {
        String username = request.getParameter("username");
        String pwd = request.getParameter("pwd");
        User login = dao.login(username, pwd);
        if(login!=null){
            List<Perm> premList = dao.getPremList(login.getRole());

            request.getSession().setAttribute("user",login);
            request.getSession().setAttribute("permlist",premList);
            request.getRequestDispatcher("main.jsp").forward(request,response);
        }else {
            response.getWriter().write("<script>alert(\"用户名或密码错误！\")</script>");
        }
    }
}
