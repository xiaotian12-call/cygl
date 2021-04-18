package com.me.servlet;

import com.me.dao.dao;
import com.me.domain.PreviousEntries;
import com.me.domain.XysCount;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

/**
 * @Auther: wzs
 * @Date: 2021/4/17 14:19
 * @Description:
 */
@WebServlet("/WelcomeServlet")
public class WelcomeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");
//        String method = request.getParameter("method");
//        System.out.println(method);

        String Yeartb = request.getParameter("Year");//饼状图的年份
        dao dao = new dao();
        try {
            int year[] = dao.SelectYear();//获取数据表里面都有哪几年
            Arrays.sort(year);
            ArrayList<PreviousEntries> list = new ArrayList<PreviousEntries>();
            ArrayList<XysCount> listtb = new ArrayList<XysCount>();
            for(int i = 0;i<year.length;i++) {
                int count = dao.AddCount(year[i]);//根据年算出那一年得项目申报数量
                System.out.println(year[i]+"年上传项目文件的数量是"+count);
                PreviousEntries p = new PreviousEntries(String.valueOf(year[i]),count);
                list.add(p);//第一个表格的数据
            }
            System.out.println("第一个表数据加载完毕！");//柱状图数据获取完毕
            //饼状图数据获取
            listtb = dao.XyCount(Yeartb);

            request.setAttribute("list", list);
            request.setAttribute("Yeartb", Yeartb);
            request.setAttribute("listtb", listtb);
            request.getRequestDispatcher("Welcome.jsp").forward(request, response);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


    }
}
