/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIMS;

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
public class load_facility extends HttpServlet {
HttpSession session;
String county_id,sub_county_id,query;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            session = request.getSession();
           dbConn conn = new dbConn();
           
            JSONObject finalobj = new JSONObject();
            JSONArray jarray = new JSONArray();
            if(request.getParameter("sub_county")!=null && !request.getParameter("sub_county").equals("") && !request.getParameter("sub_county").equals("null")){
             sub_county_id = request.getParameter("sub_county");
            
            query = "SELECT SubPartnerID,SubpartnerNom,CentreSanteId FROM subpartnera WHERE DistrictID='"+sub_county_id+"' AND subpartnera.active=1  ORDER BY SubpartnerNom";
            }
            else if(request.getParameter("county")!=null && !request.getParameter("county").equals("") && !request.getParameter("county").equals("null")){
             county_id = request.getParameter("county");
            
            query = "SELECT SubPartnerID,SubpartnerNom,CentreSanteId FROM subpartnera "
                    + "LEFT JOIN district ON subpartnera.DistrictID=district.DistrictID  "
                    + "LEFT JOIN county ON district.CountyID = County.CountyID "
                    + "WHERE County.CountyID='"+county_id+"' AND subpartnera.active=1 ORDER BY SubpartnerNom ";
            }
            else{
            query = "SELECT SubPartnerID,SubpartnerNom,CentreSanteId FROM subpartnera WHERE subpartnera.active=1  ORDER BY SubpartnerNom";
            }
            
            conn.rs = conn.st.executeQuery(query);
            while(conn.rs.next()){
                JSONObject obj = new JSONObject();
                obj.put("id", conn.rs.getString(1));
                obj.put("name", conn.rs.getString(2));
                obj.put("mfl_code", conn.rs.getString(3));
                
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
        Logger.getLogger(load_facility.class.getName()).log(Level.SEVERE, null, ex);
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
        Logger.getLogger(load_facility.class.getName()).log(Level.SEVERE, null, ex);
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
