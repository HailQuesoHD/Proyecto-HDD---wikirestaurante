import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    // Configura estos valores según tu entorno
    private static final String URL = "jdbc:mysql://localhost:3306/cheeseshop"; 
    private static final String USER = "root"; 
    private static final String PASSWORD = "1234"; 

    // Método para obtener conexión
    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("✅ Conexión exitosa a la base de datos de quesos.");
        } catch (ClassNotFoundException e) {
            System.out.println("❌ No se encontró el driver JDBC.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("❌ Error al conectar con la base de datos.");
            e.printStackTrace();
        }
        return conn;
    }

    // Ejemplo rápido de prueba
    public static void main(String[] args) {
        Connection conn = getConnection();
        if (conn != null) {
            try {
                conn.close();
                System.out.println("🔒 Conexión cerrada correctamente.");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
