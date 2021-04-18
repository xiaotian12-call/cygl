package com.me.servlet;

import com.me.dao.XmshDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Auther: wzs
 * @Date: 2021/4/16 16:29
 * @Description:
 */
@WebServlet("/xmsh")
public class XmshServlet extends HttpServlet {
    XmshDao dao =new XmshDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");
        String method = request.getParameter("method");
        if(method.equals("zdjsHtsh")){
            zdjsHtsh(request,response);
        }else if(method.equals("zjsp")){
            zjsp(request,response);
        }else if(method.equals("zjJtps")){
            zjJtps(request,response);
        }else if(method.equals("zqjc")){
            zqjc(request,response);
        }else if(method.equals("jtsh")){
            jtsh(request,response);
        }
    }

    private void jtsh(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String sftg = request.getParameter("sftg");
        String num = request.getParameter("num");
        boolean b = true;
        if(sftg.equals("1")){
            b = dao.changeStatus(num, 7);
        }else {
            b = dao.changeStatus(num, 9);
        }
        if(b){
            response.getWriter().write("<script>alert(\"审核成功！\");var index = parent. layer.getFrameIndex ( window.name);parent.layer.close(index);window.parent. location.reload();</script>");
        }else {
            response.getWriter().write("<script>alert(\"审核失败！\");var index = parent. layer.getFrameIndex ( window.name);parent.layer.close(index);window.parent. location.reload();</script>");
        }
    }

    private void zqjc(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String sftg = request.getParameter("sftg");
        String num = request.getParameter("num");
        boolean b = true;
        if(sftg.equals("1")){
            b = dao.changeStatus(num, 6);
        }else {
            b = dao.changeStatus(num, 9);
        }
        if(b){
            response.getWriter().write("<script>alert(\"审核成功！\");var index = parent. layer.getFrameIndex ( window.name);parent.layer.close(index);window.parent. location.reload();</script>");
        }else {
            response.getWriter().write("<script>alert(\"审核失败！\");var index = parent. layer.getFrameIndex ( window.name);parent.layer.close(index);window.parent. location.reload();</script>");
        }
    }

    private void zjJtps(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String sftg = request.getParameter("sftg");
        String num = request.getParameter("num");
        boolean b = true;
        if(sftg.equals("1")){
            b = dao.changeStatus(num, 8);
        }else {
            b = dao.changeStatus(num, 9);
        }
        if(b){
            response.getWriter().write("<script>alert(\"审核成功！\");var index = parent. layer.getFrameIndex ( window.name);parent.layer.close(index);window.parent. location.reload();</script>");
        }else {
            response.getWriter().write("<script>alert(\"审核失败！\");var index = parent. layer.getFrameIndex ( window.name);parent.layer.close(index);window.parent. location.reload();</script>");
        }
    }

    private void zjsp(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String sftg = request.getParameter("sftg");
        String num = request.getParameter("num");
        boolean b = true;
        if(sftg.equals("1")){
            b = dao.changeStatus(num, 3);
        }else {
            b = dao.changeStatus(num, 4);
        }
        if(b){
            response.getWriter().write("<script>alert(\"审核成功！\");var index = parent. layer.getFrameIndex ( window.name);parent.layer.close(index);window.parent. location.reload();</script>");
        }else {
            response.getWriter().write("<script>alert(\"审核失败！\");var index = parent. layer.getFrameIndex ( window.name);parent.layer.close(index);window.parent. location.reload();</script>");
        }
    }

    private void zdjsHtsh(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String sftg = request.getParameter("sftg");
        String psyj = request.getParameter("psyj");
        String num = request.getParameter("num");
        boolean b = true;
        if(sftg.equals("1")){
            boolean f  = dao.zdjsHtsh(sftg,psyj,num);
            b = dao.changeStatus(num, 2);
        }else {
            b = dao.changeStatus(num, 4);
        }

        if(b){
            response.getWriter().write("<script>alert(\"审核成功！\");var index = parent. layer.getFrameIndex ( window.name);parent.layer.close(index);window.parent. location.reload();</script>");
        }else {
            response.getWriter().write("<script>alert(\"审核失败！\");var index = parent. layer.getFrameIndex ( window.name);parent.layer.close(index);window.parent. location.reload();</script>");
        }

    }
}
