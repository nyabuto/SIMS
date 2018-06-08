/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Reports;

import Db.dbConn;
import SIMS.Manager;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.FontFamily;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author GNyabuto
 */
public class assessment_reports extends HttpServlet {
    HttpSession session;
    Double score;
    int row_counter;
    String start_date,end_date;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        session = request.getSession();
        dbConn conn = new dbConn();
        
        Manager manager = new Manager();
        row_counter=0;
        
        
        
        start_date = request.getParameter("start_date");
        end_date = request.getParameter("end_date");
                //            ^^^^^^^^^^^^^CREATE STATIC AND WRITE STATIC DATA TO THE EXCELL^^^^^^^^^^^^
    XSSFWorkbook wb=new XSSFWorkbook();
    
    XSSFSheet shet1=wb.createSheet("Indicator Score");
    XSSFSheet shet2=wb.createSheet("Facility Performance");
    XSSFFont font=wb.createFont();
    font.setFontHeightInPoints((short)18);
    font.setFontName("Cambria");
    font.setColor((short)0000);
    
    CellStyle style=wb.createCellStyle();
    style.setFont(font);
    style.setAlignment(HorizontalAlignment.CENTER);
    
    XSSFCellStyle styleHeader = wb.createCellStyle();
    styleHeader.setFillForegroundColor(HSSFColor.PALE_BLUE.index);
    styleHeader.setFillPattern(FillPatternType.SOLID_FOREGROUND);
    styleHeader.setBorderTop(BorderStyle.THIN);
    styleHeader.setBorderBottom(BorderStyle.THIN);
    styleHeader.setBorderLeft(BorderStyle.THIN);
    styleHeader.setBorderRight(BorderStyle.THIN);
    styleHeader.setAlignment(HorizontalAlignment.CENTER);
    
    XSSFFont fontHeader = wb.createFont();
    fontHeader.setColor(HSSFColor.BLACK.index);
    fontHeader.setBold(true);
    fontHeader.setFamily(FontFamily.MODERN);
    fontHeader.setFontName("Cambria");
    fontHeader.setFontHeight(12);
    styleHeader.setFont(fontHeader);
    styleHeader.setWrapText(true);
    
    XSSFCellStyle stylex = wb.createCellStyle();
    stylex.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
    stylex.setFillPattern(FillPatternType.SOLID_FOREGROUND);
    stylex.setBorderTop(BorderStyle.THIN);
    stylex.setBorderBottom(BorderStyle.THIN);
    stylex.setBorderLeft(BorderStyle.THIN);
    stylex.setBorderRight(BorderStyle.THIN);
    stylex.setAlignment(HorizontalAlignment.LEFT);
    
    XSSFFont fontx = wb.createFont();
    fontx.setColor(HSSFColor.BLACK.index);
    fontx.setBold(true);
    fontx.setFamily(FontFamily.MODERN);
    fontx.setFontName("Cambria");
    stylex.setFont(fontx);
    stylex.setWrapText(true);
    
    XSSFCellStyle stborder = wb.createCellStyle();
    stborder.setBorderTop(BorderStyle.THIN);
    stborder.setBorderBottom(BorderStyle.THIN);
    stborder.setBorderLeft(BorderStyle.THIN);
    stborder.setBorderRight(BorderStyle.THIN);
    stborder.setAlignment(HorizontalAlignment.LEFT);
    
    
    XSSFCellStyle stborder_perc = wb.createCellStyle();
    stborder_perc.setBorderTop(BorderStyle.THIN);
    stborder_perc.setBorderBottom(BorderStyle.THIN);
    stborder_perc.setBorderLeft(BorderStyle.THIN);
    stborder_perc.setBorderRight(BorderStyle.THIN);
    stborder_perc.setAlignment(HorizontalAlignment.LEFT);
    stborder_perc.setDataFormat(wb.createDataFormat().getFormat("0.0%"));
    
    XSSFFont font_cell=wb.createFont();
    font_cell.setColor(HSSFColor.BLACK.index);
    font_cell.setFamily(FontFamily.MODERN);
    font_cell.setFontName("Cambria");
    stborder.setFont(font_cell);
    stborder.setWrapText(true);
        
        String query_indic="SELECT county.County AS 'County Name', district.DistrictNom AS 'Sub County', subpartnera.SubPartnerNom AS 'Health Facility', " +
"subpartnera.CentreSanteId AS mfl_code,CONCAT(IFNULL(code,''),IFNULL(title,'')) AS Section,assessor_name 'Assessor Name',assessor_team_lead AS 'Assessor Team Lead' ,assessment_date, " +
"COUNT(CASE WHEN color_code='DG' THEN 1 END ) AS 'DG'," +
"COUNT(CASE WHEN color_code='LG' THEN 1 END ) AS 'LG'," +
"COUNT(CASE WHEN color_code='Y' THEN 1 END ) AS 'Y', " +
"COUNT(CASE WHEN color_code='R' THEN 1 END ) AS 'R' " +
"FROM area " +
"LEFT JOIN area_score ON area_score.area_id=area.id " +
"LEFT JOIN assessment ON area_score.assessment_id=assessment.id " +
"LEFT JOIN subpartnera ON subpartnera.SubPartnerID=assessment.facility_id " +
"LEFT JOIN district ON subpartnera.DistrictID=district.DistrictID " +
"LEFT JOIN county ON district.CountyID=county.CountyID "+
"WHERE assessment_date BETWEEN '"+start_date+"' AND '"+end_date+"' " +
"GROUP by Section,mfl_code,assessment_date";
        
         
        
        conn.pst = conn.conn.prepareStatement(query_indic);
        conn.rs = conn.pst.executeQuery();
        
                
        ResultSetMetaData metaD = conn.rs.getMetaData();
        int count = metaD.getColumnCount(); //number of column
        
         for (int i=0;i<count;i++){
             if(i==0 || i==3 || i>7){
               shet1.setColumnWidth(i, 3000);  
             }
             else if(i==4){
                shet1.setColumnWidth(i, 10000);
             }
             else{
                shet1.setColumnWidth(i, 6000);
             }
         }
        
        XSSFRow rw0=shet1.createRow(row_counter); 
        rw0.setHeightInPoints(45);
        int j=1;
           while(j<=count){
               XSSFCell  S1cell=rw0.createCell(j-1);
               S1cell.setCellValue(metaD.getColumnLabel(j));
               S1cell.setCellStyle(styleHeader);
//                   System.out.println("columns : "+metaData.getColumnLabel(j));   
               j++;
           }
            
        while(conn.rs.next()){
            row_counter++;
          XSSFRow rw=shet1.createRow(row_counter);   
            
          int i=1;
           while(i<=count){
               String value = conn.rs.getString(i);
               XSSFCell  cell=rw.createCell(i-1);
               if(isNumeric(value)){
                cell.setCellValue(Double.parseDouble(value));
            }
            else{
                cell.setCellValue(value);
            }
               cell.setCellStyle(stborder);
//               System.out.println(metaData.getColumnLabel(i)+"Value : "+conn.rs.getString(i));                 
               i++;
           }
         
        }
        
        row_counter=0;
        String query = "SELECT county.County AS 'County', district.DistrictNom AS 'Sub County', " +
            "subpartnera.SubPartnerNom AS 'Health Facility', subpartnera.CentreSanteId AS MFLCode,assessor_name AS 'Assessor Name',assessor_team_lead AS 'Assessor team Lead',assessment_date As AssessmentDate," +
            "group_concat(ifnull(CASE WHEN area_id=1 AND color_code IS NOT NULL THEN  color_code END,'') separator '') AS 'CEE#: F_1.01 [001] HIV Quality Management/Quality Improvement (QM/QI) System [ALL FACILITIES]'," +
            "group_concat(ifnull(CASE WHEN area_id=2 AND color_code IS NOT NULL THEN  color_code END,'') separator '')  AS 'CEE#: F_1.03 [003] Risk Reduction Counseling and Condom Availability [ALL FACILITIES]'," +
            "group_concat(ifnull(CASE WHEN area_id=3 AND color_code IS NOT NULL THEN  color_code END,'') separator '')  AS 'CEE#: F_1.09 [009] Data Quality Assurance [ALL FACILITIES]'," +
            "group_concat(ifnull(CASE WHEN area_id=4 AND color_code IS NOT NULL THEN  color_code END,'') separator '')  AS 'CEE#: F_2.11 [031] ART Monitoring [C&T GEN POP]'" +
            "FROM area " +
            "LEFT JOIN area_score ON area_score.area_id=area.id " +
            "LEFT JOIN assessment ON area_score.assessment_id=assessment.id " +
            "LEFT JOIN subpartnera ON subpartnera.SubPartnerID=assessment.facility_id " +
            "LEFT JOIN district ON subpartnera.DistrictID=district.DistrictID " +
            "LEFT JOIN county ON district.CountyID=county.CountyID " +
            "WHERE assessment_date BETWEEN '"+start_date+"' AND '"+end_date+"' " +
            "GROUP BY MFLCode,AssessmentDate " +
            "";
       
        conn.pst = conn.conn.prepareStatement(query);
        conn.rs = conn.pst.executeQuery();
        
                
        ResultSetMetaData metaData = conn.rs.getMetaData();
        count = metaData.getColumnCount(); //number of column
        
         for (int i=0;i<=count;i++){
                shet2.setColumnWidth(i, 6000);
         }
        
        rw0=shet2.createRow(row_counter); 
        rw0.setHeightInPoints(45);
        j=1;
           while(j<=count){
               XSSFCell  S1cell=rw0.createCell(j-1);
               S1cell.setCellValue(metaData.getColumnLabel(j));
               S1cell.setCellStyle(styleHeader);
//                   System.out.println("columns : "+metaData.getColumnLabel(j));   
               j++;
           }
           //score
          XSSFCell  S1cell=rw0.createCell(j-1);
          S1cell.setCellValue("Score");
          S1cell.setCellStyle(styleHeader);  
           
        while(conn.rs.next()){
            row_counter++;
          XSSFRow rw=shet2.createRow(row_counter);   
            
          int i=1;
           while(i<=count){
               String value = conn.rs.getString(i);
               XSSFCell  cell=rw.createCell(i-1);
               if(isNumeric(value)){
                cell.setCellValue(Double.parseDouble(value));
            }
            else{
                cell.setCellValue(value);
            }
               cell.setCellStyle(stborder);
//               System.out.println(metaData.getColumnLabel(i)+"Value : "+conn.rs.getString(i));                 
               i++;
           }
         score = get_score(conn.rs.getString(8),conn.rs.getString(9),conn.rs.getString(10),conn.rs.getString(11));
          XSSFCell  cell=rw.createCell(i-1);
          cell.setCellValue(score);
          cell.setCellStyle(stborder_perc);
         
        }
        
        
        
      ByteArrayOutputStream outByteStream = new ByteArrayOutputStream();
        wb.write(outByteStream);
        byte [] outArray = outByteStream.toByteArray();
        response.setContentType("application/ms-excel");
        response.setContentLength(outArray.length);
        response.setHeader("Expires:", "0"); // eliminates browser caching
        response.setHeader("Content-Disposition", "attachment; filename=SIMS_Facility_Assessment_Raw_Data_"+manager.getdatekey()+".xlsx");
        OutputStream outStream = response.getOutputStream();
        outStream.write(outArray);
        outStream.flush();      
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
            Logger.getLogger(assessment_reports.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(assessment_reports.class.getName()).log(Level.SEVERE, null, ex);
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

    public Double get_score(String a1,String a2,String a3,String a4){
     Double _score; 
     int num = 0;
     double total_score=4.0;
     if(a1.equals("DG") || a1.equals("LG")){num++;}
     if(a2.equals("DG") || a2.equals("LG")){num++;}
     if(a3.equals("DG") || a3.equals("LG")){num++;}
     if(a4.equals("DG") || a4.equals("LG")){num++;}
     
     if(a1.equals("")){total_score-=1;}
     if(a2.equals("")){total_score-=1;}
     if(a3.equals("")){total_score-=1;}
     if(a4.equals("")){total_score-=1;}
     
     _score =num/total_score;
             System.out.println("a1 : "+a1+" a2 : "+a2+" a3 : "+a3+" a4 : "+a4+" score is : "+num+" and % score is " +_score);
     return _score;
    }
    
        public boolean isNumeric(String s) {  
        return s != null && s.matches("[-+]?\\d*\\.?\\d+");  
}
}
