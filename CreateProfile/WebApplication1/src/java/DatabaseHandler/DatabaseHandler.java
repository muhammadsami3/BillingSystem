
/*
 * To change this license heer, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DatabaseHandler;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseHandler {

    private Connection conn;
    private PreparedStatement preparedStmt;
    private ResultSet rs;

    public DatabaseHandler() {
        conn = null;
        preparedStmt = null;
        rs = null;
        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection("jdbc:postgresql://localhost:5932/billing", "postgres", "147596382");
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }

     public int addRatePlan(String name) {
        int id = 0;
        String query = "insert into rateplane(name) values(?)";
        try {
            preparedStmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStmt.setString(1, name);
            preparedStmt.execute();
            rs = preparedStmt.getGeneratedKeys();
            rs.next();
            id = rs.getInt(1);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return id;
    }
     
    public int getRatePlanId(String ratePlanName) {
        int id = 0;
        try {
            String queryString = new String("select id from rateplane where name=? ");
            preparedStmt = conn.prepareStatement(queryString);
            preparedStmt.setString(1, ratePlanName);
            ResultSet rs1 = preparedStmt.executeQuery();
            rs1.next();
            id = rs1.getInt(1);
            return id;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return id;
    }

    public int addServicePackage(String ratePlane,String SeviceName,double numVoice,double numSMS,double numData,double cost) {
        int id = 0;
        int ratePlaneName=getRatePlanId(ratePlane);
        String query = "insert into servicepackage(name,rateplaneid,numberofminutes,numberofsms,numberofdata,cost) values(?,?,?,?,?,?)";
        try {
            preparedStmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStmt.setString(1, SeviceName);                        
            preparedStmt.setInt(2, ratePlaneName);
            preparedStmt.setDouble(3, numVoice);
            preparedStmt.setDouble(4, numSMS);
            preparedStmt.setDouble(5, numData);
            preparedStmt.setDouble(6, cost);

            ResultSet rs1 = preparedStmt.executeQuery();
            rs1.next();
            id = rs.getInt(1);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return id;
    }
    
    public int getServicePackageId(String servicePackageNmae) {
        int id = 0;
        try {
            String queryString = new String("select id from servicepackage where name=? ");
            preparedStmt = conn.prepareStatement(queryString);
            preparedStmt.setString(1, servicePackageNmae);
            ResultSet rs1 = preparedStmt.executeQuery();
            rs1.next();
            id = rs1.getInt(1);
            return id;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return id;
    }
    
     public int addService(String SeviceName,double cost,String servicePackageID) {
        int id = 0;
        int servicePackageName=getServicePackageId(servicePackageID);
        String query = "insert into service(name,service_cost ,packageid) values(?,?,?)";
        try {
            preparedStmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStmt.setString(1, SeviceName);                        
            preparedStmt.setDouble(2, cost);
            preparedStmt.setInt(3, servicePackageName);

            ResultSet rs1 = preparedStmt.executeQuery();
            rs1.next();
            id = rs.getInt(1);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return id;
    }
    
    public int getServiceId(String serviceNmae) {
        int id = 0;
        try {
            String queryString = new String("select id from service where name=? ");
            preparedStmt = conn.prepareStatement(queryString);
            preparedStmt.setString(1, serviceNmae);
            ResultSet rs1 = preparedStmt.executeQuery();
            rs1.next();
            id = rs1.getInt(1);
            return id;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return id;
    } 
    
    public int addService_Servicepackage(String servicePackageName,String SeviceName ,double cost ) {
        int id = 0;
        int servicePackage=getServicePackageId(servicePackageName);
        int servicName=getServiceId(SeviceName);
        String query = "insert into service_servicepackage( serviceid , packageid,service_cost) values(?,?,?)";
        try {
            preparedStmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStmt.setInt(1, servicName);
            preparedStmt.setInt(2, servicePackage);
            preparedStmt.setDouble(3, cost);
            ResultSet rs1 = preparedStmt.executeQuery();
            rs1.next();
            id = rs.getInt(1);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return id;
    }
    
    public int getService_ServicepackageId(String serviceNmae,String servicePakage) {
        int id = 0;
        try {
            String queryString = new String("select id from service_servicepackage where  serviceid =? and packageid=? ");
            preparedStmt = conn.prepareStatement(queryString);
            preparedStmt.setString(1, serviceNmae);
            preparedStmt.setString(2, servicePakage);
            ResultSet rs1 = preparedStmt.executeQuery();
            rs1.next();
            id = rs1.getInt(1);
            return id;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return id;
    } 
    
    public int addAdded_service(String SeviceName,double cost,String description) {
        int id = 0;
        
        String query = "insert into added_service(name , description ,cost) values(?,?,?)";
        try {
            preparedStmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStmt.setString(1, SeviceName);                        
            preparedStmt.setString(2, description);
            preparedStmt.setDouble(3, cost);
            ResultSet rs1 = preparedStmt.executeQuery();
            rs1.next();
            id = rs.getInt(1);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return id;
    }
    
    public int getAdded_serviceId(String serviceNmae) {
        int id = 0;
        try {
            String queryString = new String("select id from added_service where name=? ");
            preparedStmt = conn.prepareStatement(queryString);
            preparedStmt.setString(1, serviceNmae);
            ResultSet rs1 = preparedStmt.executeQuery();
            rs1.next();
            id = rs1.getInt(1);
            return id;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return id;
    } 
    
    public int getCustomerId(long customerNumber) {
        int id = 0;
        try {
            String queryString = new String("select customerid from contract where msisdn=? ");
            preparedStmt = conn.prepareStatement(queryString);
            preparedStmt.setLong(1, customerNumber);
            ResultSet rs1 = preparedStmt.executeQuery();
            rs1.next();
            id = rs1.getInt(1);
            return id;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return id;
    } 
    
    public int getContractId(long customerNumber) {
        int id = 0;
        try {
            String queryString = new String("select id from contract where msisdn=? ");
            preparedStmt = conn.prepareStatement(queryString);
            preparedStmt.setLong(1, customerNumber);
            ResultSet rs1 = preparedStmt.executeQuery();
            rs1.next();
            id = rs1.getInt(1);
            return id;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return id;
    } 
    
    public int addRecuring_service(long msisdn,String addService) {
        int id = 0;
        int addServiceID=getAdded_serviceId(addService);
        int contractID=getContractId(msisdn);
        String query = "insert into recuring_service( contract_id, added_service_id) values(?,?)";
        try {
            preparedStmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStmt.setInt(1, contractID);                        
            preparedStmt.setInt(2, addServiceID);
            ResultSet rs1 = preparedStmt.executeQuery();
            rs1.next();
            id = rs.getInt(1);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return id;
    }
    
    public int addOneTime(long msisdn,String addService) {
        int id = 0;
        int addServiceID=getAdded_serviceId(addService);
        int contract=getContractId(msisdn);
        String query = "insert into onetime_fee_service( contractid , added_serviceid) values(?,?)";
        try {
            preparedStmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStmt.setInt(1, contract);                        
            preparedStmt.setInt(2, addServiceID);
            ResultSet rs1 = preparedStmt.executeQuery();
            rs1.next();
            id = rs.getInt(1);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return id;
    }
    
     //insrtcustomer
    public static void main(String[] args) {
        DatabaseHandler d =new DatabaseHandler();
//        d.addRatePlan("coonetc");

//d.addServicePackage("conect","con2",30,40,50, 10);
    }
   
}