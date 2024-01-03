import java.sql.Connection;
import java.sql.*;

public class Main {
    public static void main(String[] args) {
        Database.username = "root";
        Database.password = "password";
        Database.port = 13306;
        Database.database = "jd23_pokemon_java";

        Connection connection = Database.getConnection();
        if (connection == null) {
            System.out.println("Kund inte ansluta till databasen");
            System.exit(-1);
            return;
        }

        try {

            String[] queries = {
                    "CREATE TABLE IF NOT EXISTS Pokemons (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(200) UNIQUE NOT NULL, weight DECIMAL(5,2) NOT NULL, height DECIMAL(5,2) NOT NULL, abillities VARCHAR(50) NOT NULL, PRIMARY KEY(id));",
                    "CREATE TABLE IF NOT EXISTS Users (id INT PRIMARY KEY AUTO_INCREMENT NOT NULL, email VARCHAR(255) NOT NULL UNIQUE, name VARCHAR(255) NOT NULL, password VARCHAR(255) NULL, lastLogin DATETIME NULL, createdDate DATE NOT NULL DEFAULT CURRENT_DATE, newsletter ENUM('Yes', 'No') DEFAULT 'No' )",
                    "CREATE TABLE IF NOT EXISTS UserPokemons (id INT PRIMARY KEY AUTO_INCREMENT NOT NULL, usersId INT NOT NULL, pokemonsId INT NOT NULL)"
            };

            Statement statement = connection.createStatement();
            for(int i=0; i< queries.length; i++) {
                int result = statement.executeUpdate(queries[i]);
            }

            /*

            String query = "SELECT id, email, name FROM Contacts WHERE id < 100";
            result = statement.executeQuery(query);
            while(result.next()) {
                System.out.printf(
                        "%d: %s, %s \n",
                        result.getInt("id"),
                        result.getString(2),
                        result.getString("email"));

            }
            */

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