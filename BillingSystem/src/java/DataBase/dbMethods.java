/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataBase;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import links.linkto;

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

    public void connectToDatabase() {

        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection(linkto.DB, linkto.databaseUser, linkto.dbPasswd);

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }

    }

    public static void main(String[] args) throws SQLException {
        dbMethods db = new dbMethods();
        db.connectToDatabase();
//        db.select();
//        db.invoice_record("000000", "455", 55.0);
//        db.invoiced("00201221234567");
//        System.out.println("DataBase.dbMethods.main()" + db.getCost(1, "00201022591400"));
//        System.out.println("DataBase.dbMethods.main()" + db.getcontractid("00201022591400"));
//        System.out.println("DataBase.dbMethods.main()" + db.getInvoice("00201022591400"));
        ResultSet resultSet = db.getRatePlaneInfo("00201022591400");
        while (resultSet.next()) {
            System.out.println("DataBase.dbMethods.main()--> " + resultSet.getString(1));

        }
//        db.rating("00201022591400", "00201022591400", 50.50, 1, 55555555, "10:10:10");
//        select();
    }

    public ResultSet getPackageInfo(String msisdn) {
        ResultSet rs = null;
        try {
            String queryString = "select * from servicepackage where id =(select packageid from contract where msisdn=?)";

            PreparedStatement stmt = conn.prepareStatement(queryString);
            stmt.setString(1, msisdn);
            rs = stmt.executeQuery();

        } catch (SQLException ex) {
            Logger.getLogger(dbMethods.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;

    }

    public ResultSet getRatePlaneInfo(String msisdn) {
        ResultSet rs = null;
        try {
            String queryString = " select * from rateplane where id =(select rateplaneid from servicepackage where id =(select packageid from contract where msisdn=?))";

            PreparedStatement stmt = conn.prepareStatement(queryString);
            stmt.setString(1, msisdn);
            rs = stmt.executeQuery();

        } catch (SQLException ex) {
            Logger.getLogger(dbMethods.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;

    }

    public ResultSet getContractHistory(String msisdn, int serviceid) {
        ResultSet rs = null;
        try {
            String queryString = "select * from udr where callingmsisdn=? and serviceid=?";

            PreparedStatement stmt = conn.prepareStatement(queryString);
            stmt.setString(1, msisdn);
            stmt.setInt(2, serviceid);
            rs = stmt.executeQuery();

        } catch (SQLException ex) {
            Logger.getLogger(dbMethods.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;

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
        System.out.println("DataBase.dbMethods.rating()  " + callingmsisdn);

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
        String queryString = "select * from invoicing where msisdn=? and invoice='t'";
        PreparedStatement stmt = conn.prepareStatement(queryString);
        stmt.setString(1, msisdn);
        ResultSet rs = stmt.executeQuery();

        return rs;
    }

    public void invoiced(String msisdn) {
        try {
            String queryString2 = "update invoicing set invoice='f' where msisdn=? ";
            PreparedStatement stmt = conn.prepareStatement(queryString2);
            stmt.setString(1, msisdn);
            stmt.execute();
        } catch (SQLException ex) {
            Logger.getLogger(dbMethods.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet getInvoiceRecord(String msisdn) throws SQLException {
        String queryString = " SELECT * FROM invoice_record where msisdn_number=?";
        PreparedStatement stmt = conn.prepareStatement(queryString);
        stmt.setString(1, msisdn);
        ResultSet rs = stmt.executeQuery();
        return rs;
    }

    public void invoice_record(String msisdn, String path, Double cost) {
        System.out.println("DataBase.dbMethods.rating()  " + msisdn);

        try {
            String queryString = "insert into invoice_record (msisdn_number,date,path_of_file,cost) "
                    + "values(?,now(),?,?)";

            PreparedStatement stmt = conn.prepareStatement(queryString);
            stmt.setString(1, msisdn);
            stmt.setString(2, path);
            stmt.setDouble(3, cost);

            stmt.execute();

        } catch (SQLException ex) {
            Logger.getLogger(dbMethods.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    void select() throws SQLException {
        String queryString = "select now();";
        PreparedStatement stmt = conn.prepareStatement(queryString);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            System.out.println("DataBase.dbMethods.select()" + rs.getString(1));

        }

    }

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

        double callSum = 0.0;
        double smsSum = 0.0;
        double dataSum = 0.0;
        double finalcost = 0.0;
        int mins = 0;
        int sms = 0;
        int data = 0;

        Statement stmt2 = conn.createStatement();
        String queryString = new String("Select * from bill_history where msisdn='" + msisdn + "' ");
        ResultSet rs = stmt2.executeQuery(queryString);
        while (rs.next()) {

            if (rs.getBoolean("iscounted") == false) {
                int serviceid = rs.getInt("serviceid");
                switch (serviceid) {
                    case 1:
                        callSum = callSum + rs.getDouble("newcost");
                        mins = mins + rs.getInt("units");
                        break;

                    case 2:
                        smsSum = smsSum + rs.getDouble("newcost");
                        sms = sms + rs.getInt("units");
                        break;
                    case 3:
                        dataSum = dataSum + rs.getDouble("newcost");
                        data = data + rs.getInt("units");
                        break;

                }

                String query1 = "update bill_history set iscounted=true where id=?";

                PreparedStatement stmt = conn.prepareStatement(query1);
                stmt.setInt(1, rs.getInt("id"));
                stmt.execute();
            }
        }

        ResultSet PackageResultSet = getPackageInfo(msisdn);
        PackageResultSet.next();
        double fee = Double.parseDouble(PackageResultSet.getString("cost"));
        callSum /= 100;
        smsSum /= 100;
        dataSum /= 100;
        finalcost = callSum + smsSum + dataSum + fee;
        finalcost *= 1.1;

        String query = "insert into invoicing (msisdn,mins,sms,data,finalcost,date,callSum,smsSum,dataSum,fee,invoice) values (?,?,?,?,?,now(),?,?,?,?,'t')";

        PreparedStatement stmt1 = conn.prepareStatement(query);
        stmt1.setString(1, msisdn);
        stmt1.setInt(2, mins);
        stmt1.setInt(3, sms);
        stmt1.setInt(4, data);
        stmt1.setDouble(5, finalcost);
        stmt1.setDouble(6, callSum);
        stmt1.setDouble(7, smsSum);
        stmt1.setDouble(8, dataSum);
        stmt1.setDouble(9, fee);

        stmt1.execute();

    }

    //service id coming from cdr
    //package id according to contract id
    public double getUnitPriceById(int service_id, int package_id) throws SQLException {
        Statement stmt2 = conn.createStatement();
        String queryString = new String("Select * from service_servicepackage where serviceid=" + service_id + " and packageid=" + package_id + "");
        ResultSet rs = stmt2.executeQuery(queryString);
        rs.next();
        double untiPrice = rs.getDouble("service_cost");

        return untiPrice;
    }

    //contract id cominf from cdr
    public int getPackageId(int contractid) throws SQLException {
        Statement stmt2 = conn.createStatement();
        String queryString = new String("Select * from contract where id=" + contractid + "");
        ResultSet rs = stmt2.executeQuery(queryString);
        rs.next();
        int packageid = rs.getInt("packageid");

        return packageid;

    }

    public ResultSet getNumofFreeunits(int contractid) throws SQLException {
        Statement stmt2 = conn.createStatement();
        int packageid = getPackageId(contractid);

        String queryString = new String("Select * from servicepackage where id=" + packageid + ";");
        ResultSet rs = stmt2.executeQuery(queryString);

        return rs;
    }

    public void isbilled(int udrid) throws SQLException {
        String query = "update udr set isbilled=true where udrid=?";

        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setInt(1, udrid);
        stmt.execute();

    }

    public void addhistory(int serviceid, int udrid, String msisdn, double newcost, boolean iscounted, int units) throws SQLException {

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

    public double getNumofFreeunits1(int contractid, int serviceid) throws SQLException {
        Statement stmt2 = conn.createStatement();
        double freeunits = 0.0;
        int packageid = getPackageId(contractid);

        String queryString = new String("Select * from servicepackage where id=" + packageid + ";");
        ResultSet rs3 = stmt2.executeQuery(queryString);
        rs3.next();

        switch (serviceid) {
            case 1:
                freeunits = rs3.getDouble("numberofminutes");
                break;
            case 2:
                freeunits = rs3.getDouble("numberofsms");
                break;
            case 3:
                freeunits = rs3.getDouble("numberofdata");
                break;

        }

        return freeunits;
    }

}
