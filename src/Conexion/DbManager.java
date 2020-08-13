package Conexion;
import java.io.IOException;  
import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.SQLException;  
import java.text.SimpleDateFormat;  
import java.util.Date;  
import java.util.Properties;   

public class DbManager {

 //   public String date = new SimpleDateFormat("dd-MM-yyyy-HH-mm").format(new Date());
    
    private static final int LoginTimeout = 10;  

    public DbManager() {  
    }  

    public Connection createConnection() throws IOException, ClassNotFoundException, SQLException {  
        Properties prop = new Properties();  
      //  System.out.println("\n\n=======================\nJDBC Connector Test " + date);  
      //  System.out.println("User home directory: " + System.getProperty("user.home"));  
        String host;  
        String username;  
        String password;  
        String driver;  
        try {  
        	
            prop.load(new java.io.FileInputStream("C:\\Users/Kayreth/eclipse-workspace/Empresa_Calzados/files/mydb.cfg"));  
            host = prop.getProperty("host").toString();  
            username = prop.getProperty("username").toString();  
            password = prop.getProperty("password").toString();  
            driver = prop.getProperty("driver").toString();  
        } catch (IOException e) {  
            System.out.println("Unable to find mydb.cfg in " + System.getProperty("user.home") + "\n Please make sure that configuration file created in this folder.");  
            
            host = "Unknown HOST";  
            username = "Unknown USER";  
            password = "Unknown PASSWORD";  
            driver = "Unknown DRIVER";  
        }  

      //  System.out.println("host: " + host + "\nusername: " + username + "\npassword: " + password + "\ndriver: " + driver);  

        Class.forName(driver); 
        DriverManager.setLoginTimeout(LoginTimeout);  
        Connection connection = DriverManager.getConnection(host, username, password); 
 

        return connection;  
    }  

}
