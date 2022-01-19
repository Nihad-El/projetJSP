package controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.google.gson.Gson;

import beans.Client;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ClientService;


/**
 *
 * @author Lachgar
 */
@WebServlet(urlPatterns = {"/ClientController"})
public class ClientController extends HttpServlet {

    private ClientService ms = new ClientService();

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
                List<Client> machines = ms.findAll();
                Gson json = new Gson();
                response.getWriter().write(json.toJson(machines));
            }else if(request.getParameter("op").equals("delete")){
                int id = Integer.parseInt(request.getParameter("id"));
                System.out.println("---------------d"+id);
                ms.delete(ms.findById(id));
                response.setContentType("application/json");
                List<Client> machines = ms.findAll();
                Gson json = new Gson();
                response.getWriter().write(json.toJson(machines));
                
            }else if(request.getParameter("op").equals("update")){
            	 int id = Integer.parseInt(request.getParameter("id"));
            	 System.out.println("---------------"+id);
                 String maricule = request.getParameter("matricule");
                 System.out.println("---------------"+maricule);
                 String nom = request.getParameter("nom");
                 String prenom = request.getParameter("prenom");
                  
                 Client m = ms.findById(id);
                 
                 System.out.println("---------------"+m);
                 System.out.println(id);
                 m.setMatricule(maricule);
                 m.setNom(nom);
                 m.setPrenom(prenom);
                ms.update(m);
                response.setContentType("application/json");
                List<Client> salles = ms.findAll();
                Gson json = new Gson();
                response.getWriter().write(json.toJson(salles));
            }
        } else {
            String matricule = request.getParameter("matricule");
            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            ms.create(new Client(matricule, nom, prenom));
            response.setContentType("application/json");
            List<Client> machines = ms.findAll();
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
