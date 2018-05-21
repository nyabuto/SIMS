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
public class load_indicators extends HttpServlet {
HttpSession session;
String area;
String indicator_id,area_code,area_title,indicator_code,indicator_question;
int has_child,is_active;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            session = request.getSession();
            dbConn conn = new dbConn();
            
            JSONObject finalobj = new JSONObject();
            JSONArray jarray = new JSONArray();
            
            
            String get_data = "SELECT indicator.id AS indicator_id,area.code AS area_code, area.title AS area_title,"+
                    "indicator.code AS indicator_code,indicator.question AS indicator_question,indicator.has_child AS has_child,indicator.is_active AS is_active " +
                    "FROM indicator LEFT JOIN area on indicator.area_id=area.id " +
                    "WHERE is_child=?";
            
            conn.pst = conn.conn.prepareStatement(get_data);
            conn.pst.setInt(1, 0);
            conn.rs = conn.pst.executeQuery();
            while(conn.rs.next()){
               JSONObject obj = new JSONObject();
               indicator_id = conn.rs.getString("indicator_id");
               area_code = conn.rs.getString("area_code");
               area_title = conn.rs.getString("area_title");
               indicator_code = conn.rs.getString("indicator_code");
               indicator_question = conn.rs.getString("indicator_question");
               has_child = conn.rs.getInt("has_child");
               is_active = conn.rs.getInt("is_active");
               if(has_child>0){
               String getchild = "SELECT indicator.id AS indicator_id,indicator.question AS indicator_question FROM indicator WHERE mother_id=?";
               conn.pst1 = conn.conn.prepareStatement(getchild);
               conn.pst1.setString(1, indicator_id);
               conn.rs1 = conn.pst1.executeQuery();
               while(conn.rs1.next()){
//                   indicator_id = conn.rs1.getString("indicator_id");
                   indicator_question = indicator_question+"<br>"+conn.rs1.getString("indicator_question");
               }
               }
              //output
              
              obj.put("indicator_id", indicator_id);
              obj.put("area_code", area_code);
              obj.put("area_title", area_title);
              obj.put("indicator_code", indicator_code);
              obj.put("indicator_question", indicator_question);
              obj.put("has_child", has_child);
              obj.put("is_active", is_active);
              
              jarray.add(obj);
              
            }
            
            if(conn.pst!=null){conn.pst.close();}
            if(conn.pst1!=null){conn.pst1.close();}
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
        Logger.getLogger(load_indicators.class.getName()).log(Level.SEVERE, null, ex);
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
        Logger.getLogger(load_indicators.class.getName()).log(Level.SEVERE, null, ex);
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
