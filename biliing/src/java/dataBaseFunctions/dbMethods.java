/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dataBaseFunctions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Raghda
 */
public class dbMethods {

    public static Connection conn;
    PreparedStatement stmt;
    Statement stmt2;
    ResultSet rs;
   static ResultSet rs2;

    

    public static void connectToDatabase() {
        conn = null;

        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/billing", "postgres", "123@home");

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(dbMethods.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

//    public static void main(String[] args) throws SQLException {
//        /*
//       connectToDatabase();
//       
//       dbMethods db=new dbMethods();
//       
//      rs2=db.getuserCdrs("1126128999");
//       System.out.println("dataBaseFunction.dbMethods.main()--> 111");
//        while (rs2.next()) {
//                System.out.println("dataBaseFunction.dbMethods.main()-->  " + rs2.getInt("unit") + "  " + rs2.getDouble("cost"));
//            }*/
//    }
    
    
    
    public ResultSet getuserCdrs(String msisdn) {
        ResultSet rs = null;
        try {
            Statement stmt2 = conn.createStatement();
            String queryString = new String("Select * from udr where callingmsisdn='" + msisdn + "' ");
            rs = stmt2.executeQuery(queryString);
        } catch (SQLException ex) {
            Logger.getLogger(dbMethods.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
    
    public void bill(String msisdn) throws SQLException {
         
        double callSum=0.0;
        double smsSum=0.0;
        double dataSum=0.0;
        double finalcost=0.0;
        int mins=0;
        int sms=0;
        int data=0;
        double a[]={callSum,smsSum,dataSum};
       
            Statement stmt2 = conn.createStatement();
            String queryString = new String("Select * from bill_history where msisdn='" + msisdn + "' ");
           ResultSet rs = stmt2.executeQuery(queryString);
            while(rs.next()){
                
               if( rs.getBoolean("iscounted")==false){
                int serviceid=rs.getInt("serviceid");
        switch(serviceid){
            case 1:
                callSum=callSum+rs.getDouble("newcost");
                mins=mins+rs.getInt("units");
                break;
                
            case 2:
                smsSum=smsSum+rs.getDouble("newcost");
                sms=sms+rs.getInt("units");
                break;
            case 3:
                dataSum=dataSum+rs.getDouble("newcost");
                data=data+rs.getInt("units");
                break;
                
        
        }
        
        String query1 = "update bill_history set iscounted=true where id=?";
      
      PreparedStatement stmt = conn.prepareStatement(query1);
      stmt.setInt(1, rs.getInt("id"));
       stmt.execute();
               }
        }
            
       finalcost=callSum+smsSum+dataSum;
       
        String query = " insert into invoicing (msisdn,mins,sms,data,finalcost) values (?,?,?,?,?)";

        PreparedStatement stmt1 = conn.prepareStatement(query);
        stmt1.setString(1, msisdn);
        stmt1.setInt(2, mins);
        stmt1.setInt(3, sms);
        stmt1.setInt(4,data);
        stmt1.setDouble(5,finalcost);
        
        
        stmt1.execute();
        
        
        
    }
    
    
    
    
    
    
    
    
    
    //service id coming from cdr
    //package id according to contract id
    public double getUnitPriceById(int service_id,int package_id) throws SQLException {
        Statement stmt2 = conn.createStatement();
        String queryString = new String("Select * from service_servicepackage where serviceid=" + service_id + " and packageid="+package_id+ "");
        ResultSet rs = stmt2.executeQuery(queryString);
        rs.next();
       double untiPrice= rs.getDouble("service_cost");
        
        return untiPrice;
    }
    
    //contract id cominf from cdr
     public int getPackageId(int contractid) throws SQLException {
        Statement stmt2 = conn.createStatement();
        String queryString = new String("Select * from contract where id=" + contractid + "");
        ResultSet rs = stmt2.executeQuery(queryString);
        rs.next();
      int  packageid = rs.getInt("packageid");
        
        return  packageid;
        
     
    }
    
    
     
     public ResultSet getNumofFreeunits(int contractid) throws SQLException {
        Statement stmt2 = conn.createStatement();
        int packageid=getPackageId(contractid);
         
        String queryString = new String("Select * from servicepackage where id=" + packageid + ";");
        ResultSet rs = stmt2.executeQuery(queryString);
       
        return rs;
    }
     
     
     public void isbilled (int udrid)throws SQLException{
     String query = "update udr set isbilled=true where udrid=?";
      
      PreparedStatement stmt = conn.prepareStatement(query);
      stmt.setInt(1, udrid);
       stmt.execute(); 
     
     }
    
    
     public void addhistory(int serviceid,int udrid,String msisdn,double newcost,boolean iscounted,int units) throws SQLException {

        String query = " insert into bill_history (serviceid,udrid,msisdn,newcost,iscounted,units) values (?,?,?,?,?,?)";

        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setInt(1, serviceid);
        stmt.setInt(2, udrid);
        stmt.setString(3, msisdn);
        stmt.setDouble(4, newcost);
        stmt.setBoolean(5, iscounted);
        stmt.setInt(6, units);
        
        stmt.execute();

    }
     
     
     
     
     
     
     
     
     public double getNumofFreeunits1(int contractid,int serviceid)throws SQLException {
        Statement stmt2 = conn.createStatement();
         double freeunits=0.0;
        int packageid=getPackageId(contractid);
         
        String queryString = new String("Select * from servicepackage where id=" + packageid + ";");
        ResultSet rs3 = stmt2.executeQuery(queryString);
        rs3.next();
       
        switch(serviceid){
            case 1:
                freeunits=rs3.getDouble("numberofminutes");
                break;
            case 2 :
                freeunits=rs3.getDouble("numberofsms");
                break;
            case 3: 
                freeunits=rs3.getDouble("numberofdata");
                break;
                
        }
        
        return freeunits;
    }
     
     
    
}

