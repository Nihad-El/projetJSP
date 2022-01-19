package controller;

import beans.Client;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import beans.Crenon;
import beans.Occ;
import beans.Occupation;
import beans.Salle;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ClientService;
import service.CrenonService;
import service.OccupationService;
import service.SalleService;
import service.OccupationService;


/**
 *
 * @author Lachgar
 */
@WebServlet(urlPatterns = {"/OccupationController"})
public class OccupationController extends HttpServlet {

    private ClientService ms = new ClientService();
    private OccupationService os = new OccupationService();
    private SalleService ss = new SalleService();
    private CrenonService cs = new CrenonService();
    

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
                List<Occ> machines = os.findAlll();
                Gson json = new Gson();
                response.getWriter().write(json.toJson(machines));
            }else if(request.getParameter("op").equals("delete")){
                int id = Integer.parseInt(request.getParameter("id"));
                os.delete(os.findById(id));
                response.setContentType("application/json");
                List<Occ> machines = os.findAlll();
                Gson json = new Gson();
                response.getWriter().write(json.toJson(machines));
                
            }else if(request.getParameter("op").equals("update")){            	
                int id = Integer.parseInt(request.getParameter("id"));
                String statut=request.getParameter("statut");
                System.out.println("---------------------------");
                System.out.println(id);
                System.out.println(statut);
                
                Occupation s=os.findById(id);
                System.out.println(s);
                s.setStatut(statut);
                System.out.println(s);
                os.update(s);
                response.setContentType("application/json");
                List<Occ> machines = os.findAlll();
                System.out.println("****************");
                Gson json = new Gson();
                response.getWriter().write(json.toJson(machines));
                
            

            }
        } else {
        	Date date = new Date(request.getParameter("date").replace("-", "/"));
        	int code = Integer.parseInt(request.getParameter("code"));
        	int heureDebut = Integer.parseInt(request.getParameter("heureDebut"));
        	int matricule = Integer.parseInt(request.getParameter("matricule"));
        	System.out.println("*****************************");
        	System.out.println(date);
        	System.out.println(code);
        	System.out.println(heureDebut);
        	System.out.println(matricule);
        	String statut="en attente";
            os.create(new Occupation(date,code, heureDebut, matricule,statut));
            response.setContentType("application/json");
            List<Occ> machines = os.findAlll();
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
