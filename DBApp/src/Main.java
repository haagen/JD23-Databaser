import java.sql.Connection;
import java.sql.*;

public class Main {
    public static void main(String[] args) {
        Database.username = "root";
        Database.password = "password";
        Database.port = 13306;
        Database.database = "java23";

        Connection connection = Database.getConnection();
        if (connection == null) {
            System.out.println("Kund inte ansluta till databasen");
            System.exit(-1);
            return;
        }

        try {
            Statement statement = connection.createStatement();

            // executeQuery används när man kör frågor som ger ett svar
            // t.ex. SHOW DATABASES; DESCRIBE <table>; SELECT mf
            ResultSet result = statement.executeQuery("SHOW DATABASES");
            while(result.next()) {
                System.out.println(result.getString("Database"));
            }

            // executeUpdate används när man ändrar data eller schema
            // t.ex. CREATE TABLE ..., INSERT INTO... mf
            int numberOfChangedRows = statement.executeUpdate("INSERT INTO \n" +
                    "\tContacts\n" +
                    "(\n" +
                    "\tname, \n" +
                    "\temail\n" +
                    ")\n" +
                    "VALUES\n" +
                    "(\n" +
                    "\t\"Martin\",\n" +
                    "\t\"martin.haagen@gritacademy.se\"\n" +
                    ")");

        } catch(SQLException ex) {
            Database.PrintSQLException(ex);
        }

        try {
            connection.close();
        } catch (SQLException ex) {
            Database.PrintSQLException(ex);
        }

    }
}