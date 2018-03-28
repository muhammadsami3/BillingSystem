///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package DataBase;
//
//import java.beans.Statement;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.logging.Level;
//
///**
// *
// * @author root
// */
//public class dbMethods {
//
//
//    public dbMethods() {
//
//    }
//
//    public static void connectToDatabase() {
//
//        try {
//            Class.forName("org.postgresql.Driver");
//            conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/billing", "postgres", "");
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            System.out.println(e.getMessage());
//        }
//
//    }
//
//    public static void main(String[] args) throws SQLException {
//        connectToDatabase();
//        select();
//}
//    protected void rating (String callingmsisdn,String calledmsisdn,String cost,String timezone,String serviceid,String unit,String isbilled,String startTime){
////       insert into  
//  
//    }
//    
//  static  void select() throws SQLException{
//          String queryString = "select now();";
//        PreparedStatement stmt = conn.prepareStatement(queryString);
//        ResultSet rs = stmt.executeQuery();
//        while (rs.next()){
//            System.out.println("DataBase.dbMethods.select()"+rs.getString(1));            
//            
//        }
//        
//    }
//}
