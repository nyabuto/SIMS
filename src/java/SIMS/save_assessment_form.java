/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SIMS;

import Db.dbConn;
import com.mysql.jdbc.Connection;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author GNyabuto
 */
public class save_assessment_form extends HttpServlet {
HttpSession session;
String facility,assessor_name,assessment_date,assessor_team_lead;
String assess_id,area_score_id,indicator_score_id,area_value,indicator_value;
String color,area_id,indicator_id,message;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        session = request.getSession();
        dbConn conn = new dbConn();
        
        facility = request.getParameter("facility");
        assessor_name = request.getParameter("assessor_name");
        assessment_date = request.getParameter("assessment_date");
        assessor_team_lead = request.getParameter("assessor_team_lead");
        
        assess_id = facility+"_"+assessment_date.replace("-", "");
        message = "<font color=\"red\"><b>Data not saved</b></font>";
        String assossor_info = "REPLACE INTO assessment SET id=?,facility_id=?,assessor_name=?,assessment_date=?,assessor_team_lead=?";
        conn.pst = conn.conn.prepareStatement(assossor_info);
        conn.pst.setString(1, assess_id);
        conn.pst.setString(2, facility);
        conn.pst.setString(3, assessor_name);
        conn.pst.setString(4, assessment_date);
        conn.pst.setString(5, assessor_team_lead);
        
        conn.pst.executeUpdate();
        
        //update areas/ sections
        
       String getareas = "SELECT id FROM area";
       conn.rs = conn.st.executeQuery(getareas);
       while(conn.rs.next()){
           area_id = conn.rs.getString(1);
         area_score_id = assess_id+"_"+area_id;
         area_value = request.getParameter("area_"+area_score_id);
         color = getcolor(area_value);
        String update_area = "REPLACE INTO area_score SET id=?,area_id=?,assessment_id=?,color_code=?,color=?"; 
        conn.pst = conn.conn.prepareStatement(update_area);
        conn.pst.setString(1, area_score_id);
        conn.pst.setString(2, conn.rs.getString(1));
        conn.pst.setString(3, assess_id);
        conn.pst.setString(4, area_value);
        conn.pst.setString(5, color);
        
        conn.pst.executeUpdate();
        
       //update indicator values
       
       String getindicators = "SELECT id FROM indicator WHERE area_id='"+area_id+"'";
       conn.rs1 = conn.st1.executeQuery(getindicators);
       while(conn.rs1.next()){
        indicator_id = conn.rs1.getString(1);
        indicator_score_id =  assess_id+"_"+indicator_id;
        indicator_value =  request.getParameter(indicator_score_id);
        
        String update_indicator = "REPLACE INTO indicator_score SET id=?,indicator_id=?,area_score_id=?,response=?";
        conn.pst = conn.conn.prepareStatement(update_indicator);
        conn.pst.setString(1, indicator_score_id);
        conn.pst.setString(2, indicator_id);
        conn.pst.setString(3, area_score_id);
        conn.pst.setString(4, indicator_value);
        
        conn.pst.executeUpdate();
        message = "<b>Form Saved successfully</b>";
       }
        
       }
     
        if(conn.pst!=null){conn.pst.close();}
        if(conn.st!=null){conn.st.close();}
        if(conn.st1!=null){conn.st1.close();}
        
       session.setAttribute("save_form", message);
       response.sendRedirect("Assessment.jsp");
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
        Logger.getLogger(save_assessment_form.class.getName()).log(Level.SEVERE, null, ex);
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
        Logger.getLogger(save_assessment_form.class.getName()).log(Level.SEVERE, null, ex);
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

    
    public String getcolor(String code){
        String color_="";
     if(code.equalsIgnoreCase("DG")){
      color_ = "#086508";   
     }
     if(code.equalsIgnoreCase("LG")){
      color_ = "#33d933";   
     }
     if(code.equalsIgnoreCase("Y")){
      color_ = "yellow";   
     }
     if(code.equalsIgnoreCase("R")){
      color_ = "red";   
     }
        
        return color_;
    }
   
}
