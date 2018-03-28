/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataBase;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author root
 */
public class dbMethods {

    public static Connection conn;
    PreparedStatement stmp;
    Statement stmt2;
    ResultSet rs;
    static ResultSet rs2;

    public dbMethods() {

    }

    public void connectToDatabase() {

        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection("jdbc:postgresql://localhost:5932/billing", "postgres", "147596382");

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }

    }

    public static void main(String[] args) throws SQLException {
        dbMethods db = new dbMethods();
        db.connectToDatabase();
        
//        System.out.println("DataBase.dbMethods.main()" + db.getCost(1, "00201022591400"));
//        System.out.println("DataBase.dbMethods.main()" + db.getcontractid("00201022591400"));
//        System.out.println("DataBase.dbMethods.main()" + db.getInvoice("00201022591400"));
        ResultSet resultSet=db.getInvoice("00201022591400");
        while (resultSet.next()) { 
            System.out.println("DataBase.dbMethods.main()--> "+resultSet.getString(3));
            
        }
//        db.rating("00201022591400", "00201022591400", 50.50, 1, 55555555, "10:10:10");
//        select();
    }

    int getcontractid(String msisdn) {
        int id = -1;
        try {
            String queryString = "select id from contract where msisdn=?";

            PreparedStatement stmt = conn.prepareStatement(queryString);
            stmt.setString(1, msisdn);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            id = Integer.parseInt(rs.getString(1));

        } catch (SQLException ex) {
            Logger.getLogger(dbMethods.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;

    }

public double getCost(int serviceid, String msisdn) {
        Double cost = -1.0;
        try {
            String queryString = "select service_cost from service_servicepackage where serviceid =?"
                    + " and packageid =(select packageid from contract where msisdn=?)";

            PreparedStatement stmt = conn.prepareStatement(queryString);
            stmt.setInt(1, serviceid);
            stmt.setString(2, msisdn);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            cost = Double.parseDouble(rs.getString(1));

        } catch (SQLException ex) {
            Logger.getLogger(dbMethods.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cost;
    }

    public void rating(String callingmsisdn, String calledmsisdn, Double cost, int serviceid, long unit, String startTime) {
        System.out.println("DataBase.dbMethods.rating()  "+ callingmsisdn);

        try {
            String queryString = "insert into udr (contractid,callingmsisdn,calledmsisdn,cost,timezone,serviceid,unit,isbilled,startdate) "
                    + "values (?,?,?,?,now(),?,?,'f',?);";
            PreparedStatement stmt = conn.prepareStatement(queryString);
            stmt.setInt(1, getcontractid(callingmsisdn));
            stmt.setString(2, callingmsisdn);
            stmt.setString(3, calledmsisdn);
            stmt.setDouble(4, cost);
            stmt.setInt(5, serviceid);
            stmt.setLong(6, unit);
            stmt.setString(7, startTime);

            stmt.execute();

        } catch (SQLException ex) {
            Logger.getLogger(dbMethods.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
     public ResultSet getInvoice(String msisdn) throws SQLException {
        String queryString = "select * from invoicing where msisdn=?";
        PreparedStatement stmt = conn.prepareStatement(queryString);
        stmt.setString(1, msisdn);
        ResultSet rs = stmt.executeQuery();
        return  rs;
    }

    static void select() throws SQLException {
        String queryString = "select now();";
        PreparedStatement stmt = conn.prepareStatement(queryString);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            System.out.println("DataBase.dbMethods.select()" + rs.getString(1));

        }

    }
}
