package com.me.servlet;

import com.google.gson.Gson;
import com.me.dao.TzggDao;
import com.me.domain.*;

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
 * @Date: 2021/4/17 15:54
 * @Description:
 */
@WebServlet("/tzgg")
public class TzggServlet extends HttpServlet {
    TzggDao dao = new TzggDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");
        String method = request.getParameter("method");
        System.out.println(method);
        if(method.equals("getTzgg")){
            try {
                getTzgg(request,response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if(method.equals("cktz")){
            try {
                cktz(request,response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if(method.equals("tz")){
            try {
                tz(request,response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if(method.equals("xm")){
            try {
                xm(request,response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if(method.equals("cXm")){
            try {
                cXm(request,response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if(method.equals("cTz")){
            try {
                cTz(request,response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if(method.equals("inform")){
            try {
                inform(request,response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if(method.equals("getData")){
            try {
                getData(request,response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private void getData(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        String page = request.getParameter("page");

        String limit = request.getParameter("limit");
        List<Inform> list = dao.getInform(page,limit);

        System.out.println(list.size());
        SjbgInform sjbg = new SjbgInform();
        sjbg.setCount(dao.getTz().size());
        sjbg.setMsg("");
        sjbg.setCode(0);
        sjbg.setData(list);
        Gson gson =new Gson();
        String sjbg_json = gson.toJson(sjbg);
        System.out.println(sjbg_json);
        System.out.println(sjbg_json);
        response.getWriter().write(sjbg_json);

    }

    private void inform(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {


    }

    private void cXm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String leader_name = request.getParameter("leader_name");
        String item_name = request.getParameter("item_name");

        List<Item> lnItem = dao.cXm(leader_name,item_name);
        request.setAttribute("itemlist",lnItem);
        request.getRequestDispatcher("ljxm.jsp").forward(request,response);
    }


    private void cTz(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String create_time = request.getParameter("create_time");
        String head = request.getParameter("head");
        List<Inform> tz = dao.cTz(create_time,head);
        request.setAttribute("tzlist",tz);
        request.getRequestDispatcher("tzgg.jsp").forward(request,response);
    }


    private void xm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Item> lnItem = dao.getLnItem();
        List<Inform> tz = dao.getTz();
        request.setAttribute("itemlist",lnItem);
        request.setAttribute("tzlist",tz);
        request.getRequestDispatcher("ljxm.jsp").forward(request,response);
    }

    private void tz(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Item> lnItem = dao.getLnItem();
        List<Inform> tz = dao.getTz();
        request.setAttribute("itemlist",lnItem);
        request.setAttribute("tzlist",tz);
        request.getRequestDispatcher("tzgg.jsp").forward(request,response);
    }

    private void cktz(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String id = request.getParameter("id");
        List<Inform> tz = dao.getTz(id);
        request.setAttribute("tzgg",tz.get(0));
        request.getRequestDispatcher("cktzgg.jsp").forward(request,response);
    }

    private void getTzgg(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Item> lnItem = dao.getLnItem();
        List<Inform> tz = dao.getTz();
        request.setAttribute("itemlist",lnItem);
        request.setAttribute("tzlist",tz);
        request.getRequestDispatcher("sy.jsp").forward(request,response);
    }
}
