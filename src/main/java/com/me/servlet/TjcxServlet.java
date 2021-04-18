package com.me.servlet;

import com.google.gson.Gson;
import com.me.dao.TjcxDao;
import com.me.domain.Item;
import com.me.domain.Sjbg;
import com.me.domain.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 * @Auther: wzs
 * @Date: 2021/4/17 09:09
 * @Description:
 */
@WebServlet("/tjcx")
public class TjcxServlet extends HttpServlet {
    TjcxDao dao = new TjcxDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");
        String method = request.getParameter("method");
        System.out.println(method);
        if (method.equals("getAllItem")){
            try {
                getAllItem(request,response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if (method.equals("seachItem")){
            try {
                seachItem(request,response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private void seachItem(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String page = request.getParameter("page");
        String limit = request.getParameter("limit");

        String item_level = request.getParameter("item_level");
        String item_type = request.getParameter("item_type");
        String tutor_name = request.getParameter("tutor_name");
        String leader_name = request.getParameter("leader_name");
        String item_name = request.getParameter("item_name");
        System.out.println(leader_name);

        List<Item> xsItem = dao.seachItem(page,limit,item_level,item_type,tutor_name,leader_name,item_name);
        Sjbg sjbg =new Sjbg();
        sjbg.setCount(dao.seachItem2(item_level,item_type,tutor_name,leader_name,item_name).size());
        sjbg.setMsg("");
        sjbg.setCode(0);
        sjbg.setData(xsItem);
        Gson gson =new Gson();
        String sjbg_json = gson.toJson(sjbg);
        response.getWriter().write(sjbg_json);
    }

    private void getAllItem(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        String tutor_name = request.getParameter("tutor_name");
        System.out.println(tutor_name+"111111111111111");
        String page = request.getParameter("page");
        String limit = request.getParameter("limit");
        List<Item> xsItem = dao.getAllItemP(page,limit);
        Sjbg sjbg =new Sjbg();
        sjbg.setCount(dao.getAllItem().size());
        sjbg.setMsg("");
        sjbg.setCode(0);
        sjbg.setData(xsItem);
        Gson gson =new Gson();
        String sjbg_json = gson.toJson(sjbg);
        response.getWriter().write(sjbg_json);
    }
}
