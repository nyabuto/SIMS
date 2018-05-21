/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Loaders;

import Db.dbConn;
import com.mysql.jdbc.Connection;
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
public class loadform extends HttpServlet {
HttpSession session;
String facility_id,assessment_date;
String area_id,area_score_id;
int has_child;
String mother_id;
String assess_id;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           session = request.getSession();
           dbConn conn = new dbConn();
            JSONObject finalobj = new JSONObject();
            JSONArray jarray = new JSONArray();
           
           
           facility_id = request.getParameter("facility_id");
           assessment_date = request.getParameter("asessment_date");
//           facility_id = "403";
//           assessment_date ="2018-01-01";
           assess_id = facility_id+"_"+assessment_date.replace("-", "");
            System.out.println("Assess id : "+assess_id);
           String getAreas = "SELECT area_id, area_code, area_title, area_standard, area_instruction, area_comments,html_id,color, area_active, " +
                            "area_score_id,color_code,SUM(has_data) AS has_data " +
                            "FROM( " +
                            "SELECT area.id AS area_id, area.code AS area_code,area.title AS area_title,IFNULL(area.standard,'') AS area_standard, " +
                            "IFNULL(area.instructions,'') AS area_instruction,IFNULL(area.comments,'') AS area_comments,area.html_id AS html_id,area_score.color AS color, area.is_active AS area_active," +
                            "area_score.id AS area_score_id,color_code,1 AS has_data  " +
                            "FROM area "+
                            "LEFT JOIN area_score ON area.id = area_score.area_id " +
                            "LEFT JOIN assessment ON assessment.id = area_score.assessment_id " +
                            "WHERE facility_id=? AND assessment_date=? " +
                            "UNION ALL " +
                            "SELECT area.id AS area_id, area.code AS area_code,area.title AS area_title,IFNULL(area.standard,'') AS area_standard, " +
                            "IFNULL(area.instructions,'') AS area_instruction,IFNULL(area.comments,'') AS area_comments,area.html_id AS html_id,'' as color, " +
                            "area.is_active AS area_active,CONCAT('"+assess_id+"','_',area.id) AS area_score_id,'' AS color_code,0 AS has_data  " +
                            "FROM area) AS area_data " +
                            "GROUP BY area_id ";
           
           conn.pst = conn.conn.prepareStatement(getAreas);
           conn.pst.setString(1, facility_id);
           conn.pst.setString(2, assessment_date);
           conn.rs = conn.pst.executeQuery();
            System.out.println("query: "+conn.pst);
           while(conn.rs.next()){
            JSONObject obj_areas = new JSONObject();
            
            obj_areas.put("area_id", conn.rs.getString("area_id"));
            obj_areas.put("area_code", conn.rs.getString("area_code"));
            obj_areas.put("area_standard", conn.rs.getString("area_standard"));
            obj_areas.put("area_title", conn.rs.getString("area_title"));
            obj_areas.put("area_instruction", conn.rs.getString("area_instruction"));
            obj_areas.put("area_comments", conn.rs.getString("area_comments"));
            obj_areas.put("area_active", conn.rs.getString("area_active"));
            obj_areas.put("area_score_id", conn.rs.getString("area_score_id"));
            obj_areas.put("color_code", conn.rs.getString("color_code"));
            obj_areas.put("color", conn.rs.getString("color"));
            obj_areas.put("has_data", conn.rs.getString("has_data"));
            
            
            area_id = conn.rs.getString("area_id");
            area_score_id = conn.rs.getString("area_score_id");
            
            
            String getIndicators = "SELECT * FROM(" +
                                "SELECT indicator.id AS id,indicator.code AS code,indicator.question AS question,indicator.has_child AS has_child, "
                                + "indicator.is_child AS is_child, indicator.mother_id AS mother_id,indicator.is_active AS is_active,1 AS has_data,"
                                + "response,CONCAT('"+assess_id+"','_',indicator.id)  AS indicator_score_id " +
                                "FROM indicator LEFT JOIN indicator_score on indicator.id=indicator_score.indicator_id WHERE area_score_id=? AND is_child=? " +
                                "UNION ALL " +
                                "SELECT indicator.id AS id,indicator.code AS code,indicator.question AS question,indicator.has_child AS has_child, "
                                + "indicator.is_child AS is_child, indicator.mother_id AS mother_id,indicator.is_active AS is_active, 0 AS has_data,"
                                + " '' AS response,CONCAT('"+assess_id+"','_',indicator.id)  AS indicator_score_id  " +
                                "FROM indicator WHERE area_id=? AND is_child=? " +
                                ") AS indicator_data GROUP BY id";
            conn.pst1 = conn.conn.prepareStatement(getIndicators);
            conn.pst1.setString(1, area_score_id);
            conn.pst1.setInt(2, 0);
            conn.pst1.setString(3, area_id);
            conn.pst1.setInt(4, 0);
            conn.rs1 = conn.pst1.executeQuery();
            JSONArray array_indicator = new JSONArray();
            while(conn.rs1.next()){
            JSONObject obj_indicator = new JSONObject();
            obj_indicator.put("id", conn.rs1.getString("id"));
            obj_indicator.put("code", conn.rs1.getString("code"));
            obj_indicator.put("question", conn.rs1.getString("question"));
            obj_indicator.put("has_child", conn.rs1.getString("has_child"));
            obj_indicator.put("is_child", conn.rs1.getString("is_child"));
            obj_indicator.put("mother_id", conn.rs1.getString("mother_id"));
            obj_indicator.put("is_active", conn.rs1.getString("is_active"));
            obj_indicator.put("has_data", conn.rs1.getString("has_data"));
            obj_indicator.put("response", conn.rs1.getString("response"));
            obj_indicator.put("indicator_score_id", conn.rs1.getString("indicator_score_id"));
            
            has_child = conn.rs1.getInt("has_child");
            mother_id = conn.rs1.getString("id");
            JSONArray array_child_indicator = new JSONArray();
             
            if(has_child>0){
            String getChildIndicators = "SELECT * FROM(" +
                                "SELECT indicator.id AS id,indicator.code AS code,indicator.question AS question,indicator.has_child AS has_child, "
                                + "indicator.is_child AS is_child, indicator.mother_id AS mother_id,indicator.is_active AS is_active,1 AS has_data,"
                                + "response,CONCAT('"+assess_id+"','_',indicator.id)  AS indicator_score_id  " +
                                "FROM indicator LEFT JOIN indicator_score on indicator.id=indicator_score.indicator_id WHERE area_score_id=? AND mother_id=? AND is_child=? " +
                                "UNION ALL " +
                                "SELECT indicator.id AS id,indicator.code AS code,indicator.question AS question,indicator.has_child AS has_child, "
                                + "indicator.is_child AS is_child, indicator.mother_id AS mother_id,indicator.is_active AS is_active, 0 AS has_data,"
                                + "'' AS response,CONCAT('"+assess_id+"','_',indicator.id)  AS indicator_score_id  " +
                                "FROM indicator WHERE area_id=? AND mother_id=? AND is_child=? " +
                                ") AS indicator_data GROUP BY id";
            
            conn.pst2 = conn.conn.prepareStatement(getChildIndicators);
            conn.pst2.setString(1, area_score_id);
            conn.pst2.setString(2, mother_id);
            conn.pst2.setString(3, "1");
            conn.pst2.setString(4, area_id);
            conn.pst2.setString(5, mother_id);
            conn.pst2.setString(6, "1");
            
            conn.rs2 = conn.pst2.executeQuery();
           
            while(conn.rs2.next()){
            JSONObject obj_child_indicator = new JSONObject();
            obj_child_indicator.put("id", conn.rs2.getString("id"));
            obj_child_indicator.put("code", conn.rs2.getString("code"));
            obj_child_indicator.put("question", conn.rs2.getString("question"));
            obj_child_indicator.put("has_child", conn.rs2.getString("has_child"));
            obj_child_indicator.put("is_child", conn.rs2.getString("is_child"));
            obj_child_indicator.put("mother_id", conn.rs2.getString("mother_id"));
            obj_child_indicator.put("is_active", conn.rs2.getString("is_active"));
            obj_child_indicator.put("has_data", conn.rs2.getString("has_data"));
            obj_child_indicator.put("response", conn.rs2.getString("response"));
            obj_child_indicator.put("indicator_score_id", conn.rs2.getString("indicator_score_id"));
            
            array_child_indicator.add(obj_child_indicator);
            }
            
            }
            obj_indicator.put("child_data", array_child_indicator);
            array_indicator.add(obj_indicator);
           }
           
            obj_areas.put("indicator", array_indicator);
            
            jarray.add(obj_areas);
           } 
           
           if(conn.pst!=null){conn.pst.close();}
           if(conn.pst1!=null){conn.pst1.close();}
           if(conn.pst2!=null){conn.pst2.close();}
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
        Logger.getLogger(loadform.class.getName()).log(Level.SEVERE, null, ex);
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
        Logger.getLogger(loadform.class.getName()).log(Level.SEVERE, null, ex);
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
