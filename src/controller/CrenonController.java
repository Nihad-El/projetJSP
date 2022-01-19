package controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.google.gson.Gson;

import beans.Client;
import beans.Crenon;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Timer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CrenonService;

/**
 *
 * @author Lachgar
 */
@WebServlet(urlPatterns = {"/CrenonController"})
public class CrenonController extends HttpServlet {

    private CrenonService ms = new CrenonService();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("op") != null) {
            if (request.getParameter("op").equals("load")) {
                response.setContentType("application/json");
                List<Crenon> machines = ms.findAll();
                Gson json = new Gson();
                response.getWriter().write(json.toJson(machines));
            }else if(request.getParameter("op").equals("delete")){
                int id = Integer.parseInt(request.getParameter("id"));
                ms.delete(ms.findById(id));
                response.setContentType("application/json");
                List<Crenon> machines = ms.findAll();
                Gson json = new Gson();
                response.getWriter().write(json.toJson(machines));
                
            }else if(request.getParameter("op").equals("update")){
           	 int id = Integer.parseInt(request.getParameter("id"));
         	Time heureDebut=Time.valueOf(request.getParameter("heureDebut")+":00");
         	Time heureFin=Time.valueOf(request.getParameter("heureFin")+":00");
              
             Crenon m = ms.findById(id);
             System.out.println(id);
             m.setHeureDebut(heureDebut);
             m.setHeureFin(heureFin);
            ms.update(m);
            response.setContentType("application/json");
            List<Crenon> salles = ms.findAll();
            Gson json = new Gson();
            response.getWriter().write(json.toJson(salles));
            }
        } else {
        	Time heureDebut=Time.valueOf(request.getParameter("heureDebut")+":00");
        	Time heureFin=Time.valueOf(request.getParameter("heureFin")+":00");

            ms.create(new Crenon(heureDebut, heureFin));
            response.setContentType("application/json");
            List<Crenon> machines = ms.findAll();
            Gson json = new Gson();
            response.getWriter().write(json.toJson(machines));
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
