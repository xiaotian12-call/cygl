package com.me.servlet;

import com.google.gson.Gson;
import com.me.dao.QxglDao;
import com.me.domain.Perm;
import com.me.domain.SjbgPerm;
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
 * @Date: 2021/4/16 21:02
 * @Description:
 */
@WebServlet("/qxgl")
public class QxglServlet extends HttpServlet {
    QxglDao dao = new QxglDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");

        String method = request.getParameter("method");
        System.out.println(method);
        if(method.equals("getPerm")){
            try {
                getPerm(request,response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if(method.equals("deletePerm")){
            deletePerm(request,response);
        }else if (method.equals("getPermxx")){
            try {
                getPermxx(request,response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if (method.equals("xgPerm")){
            try {
                try {
                    xgPerm(request,response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
        }
    }

    private void xgPerm(HttpServletRequest request, HttpServletResponse response) throws InvocationTargetException, IllegalAccessException, IOException, SQLException {
        Map<String, String[]> map = request.getParameterMap();
        Perm perm = new Perm();
        BeanUtils.populate(perm, map);
        boolean f = dao.updatePerm(perm);
        if(f){
            response.getWriter().write("<script>alert(\"修改成功！\");var index = parent. layer.getFrameIndex ( window.name);parent.layer.close(index);window.parent. location.reload();</script>");
        }else {
            response.getWriter().write("<script>alert(\"修改失败！\");var index = parent. layer.getFrameIndex ( window.name);parent.layer.close(index);window.parent. location.reload();</script>");
        }
    }

    private void getPermxx(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String id = request.getParameter("id");
        Perm perm = dao.getPermById(id);
        request.setAttribute("perm",perm);
        request.getRequestDispatcher("gly_xgqx.jsp").forward(request,response);
    }

    private void deletePerm(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        boolean f = dao.deletePerm(id);
        response.getWriter().write("{\"f\":"+f+"}");
    }

    private void getPerm(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String page = request.getParameter("page");
        String limit = request.getParameter("limit");
        List<Perm> userList = dao.getPerm(page,limit);
        SjbgPerm sjbg = new SjbgPerm();
        sjbg.setCount(dao.getPermCount().size());
        sjbg.setMsg("");
        sjbg.setCode(0);
        sjbg.setData(userList);
        Gson gson =new Gson();
        String sjbg_json = gson.toJson(sjbg);
        System.out.println(sjbg_json);
        response.getWriter().write(sjbg_json);
    }
}
