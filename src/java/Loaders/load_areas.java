/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Loaders;

import Db.dbConn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author GNyabuto
 */
public class load_areas extends HttpServlet {
    HttpSession session;
    String id,code,title,standard,instructions,comments,is_active;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            session = request.getSession();
            dbConn conn = new dbConn();
            
            JSONObject finalobj = new JSONObject();
            JSONArray jarray = new JSONArray();
            
            String get_data = "SELECT id,IFNULL(code,'') AS code,IFNULL(title,'') AS title, "
                    + "IFNULL(standard,'') AS standard,IFNULL(instructions,'') AS instructions,"
                    + "IFNULL(comments,'') AS comments,is_active FROM area";
            conn.rs = conn.st.executeQuery(get_data);
            while(conn.rs.next()){
             id = conn.rs.getString("id");
             code = conn.rs.getString("code");
             title = conn.rs.getString("title");
             standard = conn.rs.getString("standard");
             instructions = conn.rs.getString("instructions");
             comments = conn.rs.getString("comments");
             is_active = conn.rs.getString("is_active"); 
             
             JSONObject obj = new JSONObject();
             obj.put("id", id);
             obj.put("code", code);
             obj.put("title", title);
             obj.put("standard", standard);
             obj.put("instructions", instructions);
             obj.put("comments", comments);
             obj.put("is_active", is_active);
             
             jarray.add(obj);
            }
            
            
            finalobj.put("data", jarray);
            out.println(finalobj);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(load_areas.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(load_areas.class.getName()).log(Level.SEVERE, null, ex);
        }
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
