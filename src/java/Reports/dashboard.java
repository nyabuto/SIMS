/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Reports;

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
public class dashboard extends HttpServlet {
HttpSession session;
int no_assessments,no_counties,no_facilities;
String average_score,facility,area;
int dg,lg,y,r;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           session = request.getSession();
           dbConn conn = new dbConn();
           
            JSONObject finalobj = new JSONObject();
            JSONObject js_fn_obj = new JSONObject();
           
            
            //number of assessments
            no_assessments=0;
           String count_assessments = "SELECT COUNT(id) FROM assessment";
           conn.rs = conn.st.executeQuery(count_assessments);
           if(conn.rs.next()){
               no_assessments = conn.rs.getInt(1);
           }
           //end to assessments
           
//           average_score
           average_score="";
        String avg_score = "SELECT ((DG+LG)*100)/(DG+LG+Y+R) FROM (" +
                            "SELECT " +
                            "COUNT(CASE WHEN color_code='DG' THEN 1 END ) AS 'DG'," +
                            "COUNT(CASE WHEN color_code='LG' THEN 1 END ) AS 'LG'," +
                            "COUNT(CASE WHEN color_code='Y' THEN 1 END ) AS 'Y'," +
                            "COUNT(CASE WHEN color_code='R' THEN 1 END ) AS 'R'" +
                            "FROM area " +
                            "LEFT JOIN area_score ON area_score.area_id=area.id " +
                            ") AS avgscore";
           conn.rs = conn.st.executeQuery(avg_score);
         if(conn.rs.next()){
               average_score = conn.rs.getString(1);
           }
        //end of average score
        
        
//           average_score
           no_counties=0;
        String counties_assessed = "SELECT COUNT(DISTINCT(county.CountyID)) AS counties_assessed,county.County AS county_name FROM county " +
                            "LEFT JOIN district ON county.CountyID=district.CountyID " +
                            "LEFT JOIN subpartnera ON district.DistrictID=subpartnera.DistrictID " +
                            "LEFT JOIN assessment ON subpartnera.SubPartnerID=assessment.facility_id " +
                            "WHERE assessment.id IS NOT NULL " +
                            "GROUP BY county_name";
           conn.rs = conn.st.executeQuery(counties_assessed);
         if(conn.rs.next()){
               no_counties = conn.rs.getInt(1);
           }
        //end of average score
        
//           average_score
           no_facilities=0;
        String facil_assessed = "SELECT COUNT(DISTINCT(subpartnera.SubPartnerID)) AS facilities_assessed,subpartnera.SubPartnerNom AS facility_name " +
                                "FROM  subpartnera  " +
                                "LEFT JOIN assessment ON subpartnera.SubPartnerID=assessment.facility_id " +
                                "WHERE assessment.id IS NOT NULL " +
                                "GROUP BY facility_name ";
           conn.rs = conn.st.executeQuery(facil_assessed);
         if(conn.rs.next()){
               no_facilities = conn.rs.getInt(1);
           }
        //end of average score
        
//        facility details
                
        String get_ass_facil = "SELECT area.id AS id,IFNULL(code,'') AS code,IFNULL(title,'') AS title, IFNULL(standard,'') AS standard,IFNULL(instructions,'') AS instructions," +
                            "IFNULL(comments,'') AS comments,subpartnera.SubPartnerNom AS facility_name, subpartnera.CentreSanteId AS mfl_code,assessment_date, " +
                            "COUNT(CASE WHEN color_code='DG' THEN 1 END ) AS 'DG'," +
                            "COUNT(CASE WHEN color_code='LG' THEN 1 END ) AS 'LG'," +
                            "COUNT(CASE WHEN color_code='Y' THEN 1 END ) AS 'Y'," +
                            "COUNT(CASE WHEN color_code='R' THEN 1 END ) AS 'R' " +
                            "FROM area " +
                            "LEFT JOIN area_score ON area_score.area_id=area.id " +
                            "LEFT JOIN assessment ON area_score.assessment_id=assessment.id " +
                            "LEFT JOIN subpartnera ON subpartnera.SubPartnerID=assessment.facility_id " +
                            "GROUP by id,mfl_code";
        
        conn.rs = conn.st.executeQuery(get_ass_facil);
        while(conn.rs.next()){
            facility = conn.rs.getString("facility_name")+" "+conn.rs.getString("mfl_code");
            area = conn.rs.getString("code")+" "+conn.rs.getString("title");
            dg = conn.rs.getInt("DG");
            lg = conn.rs.getInt("LG");
            y = conn.rs.getInt("Y");
            r = conn.rs.getInt("R");
            
            JSONObject obj = new JSONObject();
            JSONArray jarr = new JSONArray();
        }
        
        JSONArray jarray_section = new JSONArray();
        
        String section_score = "SELECT area.id AS id,CONCAT(IFNULL(code,''),IFNULL(title,'')) AS title," +
                                "COUNT(CASE WHEN color_code='DG' THEN 1 END ) AS 'DG'," +
                                "COUNT(CASE WHEN color_code='LG' THEN 1 END ) AS 'LG'," +
                                "COUNT(CASE WHEN color_code='Y' THEN 1 END ) AS 'Y'," +
                                "COUNT(CASE WHEN color_code='R' THEN 1 END ) AS 'R' " +
                                "FROM area " +
                                "LEFT JOIN area_score ON area_score.area_id=area.id " +
                                "LEFT JOIN assessment ON area_score.assessment_id=assessment.id " +
                                "LEFT JOIN subpartnera ON subpartnera.SubPartnerID=assessment.facility_id " +
                                "GROUP by id";
        conn.rs = conn.st.executeQuery(section_score);
        while(conn.rs.next()){
            JSONObject obj = new JSONObject();
            obj.put("id", conn.rs.getString(1));
            obj.put("section",  conn.rs.getString(2));
            obj.put("DG",  conn.rs.getString(3));
            obj.put("LG",  conn.rs.getString(4));
            obj.put("Y",  conn.rs.getString(5));
            obj.put("R",  conn.rs.getString(6));
            
           jarray_section.add(obj);
        }
        
           js_fn_obj.put("assessments", no_assessments);
           js_fn_obj.put("average_score", average_score);
           js_fn_obj.put("no_counties", no_counties);
           js_fn_obj.put("no_facilities", no_facilities);
           js_fn_obj.put("section_score", jarray_section);
           
           if(conn.pst!=null){conn.pst.close();}
           finalobj.put("data", js_fn_obj);
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
        Logger.getLogger(dashboard.class.getName()).log(Level.SEVERE, null, ex);
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
        Logger.getLogger(dashboard.class.getName()).log(Level.SEVERE, null, ex);
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
