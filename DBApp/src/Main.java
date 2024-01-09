import javax.xml.crypto.Data;
import java.sql.Connection;
import java.sql.*;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        //demoFromTheLessons();

        pokemonExcercise();

    }

    private static void updateUserLastLogin(Connection conn, Scanner scanner) {

        System.out.print("Ange användarens epost: ");
        String email = scanner.nextLine();

        String sql = "UPDATE Users SET lastLogin = CURRENT_TIMESTAMP WHERE email = '" + email + "'";

        try {

            Statement statement = conn.createStatement();
            if(statement.executeUpdate(sql) > 0) {
                System.out.println("Användaren uppdaterades!");
                log(conn, null, "Användaren " + email + " loggade in");
            } else {
                System.out.println("Ingen användare uppdaterades!");
            }

        } catch(SQLException ex) {
            Database.PrintSQLException(ex);
        }

    }

    private static void deleteUser(Connection conn, Scanner scanner) {

        System.out.print("Skriv användarens epost-adress: ");
        String email = scanner.nextLine();

        try {
            String sql = "SELECT id FROM Users WHERE email = '" + email + "'";
            Statement statement = conn.createStatement();

            ResultSet rs = statement.executeQuery(sql);
            if(!rs.next()) {
                System.out.println("Användaren kunde inte hittas!");
                return;
            }
            int id = rs.getInt("id");

            sql = "DELETE FROM UserPokemons WHERE usersId = " + id;
            statement.executeUpdate(sql);

            sql = "DELETE FROM Users WHERE id = " + id;
            statement.executeUpdate(sql);
            log(conn, ""+id, "Användaren " + email + " raderades!");
            System.out.println("Användaren raderades!");

        } catch (SQLException ex) {
            Database.PrintSQLException(ex);
        }



    }

    private static void pokemonExcercise() {

        Database.username = "root";
        Database.password = "password";
        Database.port = 13306;
        Database.database = "jd23_pokemon";

        Connection connection = Database.getConnection();
        if (connection == null) {
            System.out.println("Kund inte ansluta till databasen");
            System.exit(-1);
            return;
        }

        Scanner scanner = new Scanner(System.in);
        String input = "";

        do {
            System.out.println("1. Uppdatera användarens inloggningstid");
            System.out.println("2. Radera en användare");
            System.out.println("99. Avsluta");
            System.out.println("Välj vad du vill göra:");
            input = scanner.nextLine();
            switch (input) {
                case "1":
                    updateUserLastLogin(connection, scanner);
                    break;
                case "2":
                    deleteUser(connection, scanner);
                    break;
            }
        } while(!input.equals("99"));

        try {
            connection.close();
        } catch (SQLException ex) {
            Database.PrintSQLException(ex);
        }

    }

    private static void demoFromTheLessons(){

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

        Scanner scanner = new Scanner(System.in);
/*
        System.out.print("Ange namnet på kontakten: ");
        String namn = scanner.nextLine();
        System.out.print("Ange epost-adressen för användaren som skall ändras: ");
        String email = scanner.nextLine();
*/
        try {
            Statement statement = connection.createStatement();
/*
            String sql = "UPDATE Contacts SET name = '" + namn + "' WHERE email = '" + email + "'";
            System.out.println(sql);
            int numberOfChangedRows = statement.executeUpdate(sql);

            if (numberOfChangedRows > 0) {
                System.out.println("Användaren är uppdaterad");
            } else {
                System.out.println("Kunde inte hitta en användare med " + email);
            }
*/
            System.out.print("Skriv epost-adressen på användaren du vill radera: ");
            String email = scanner.nextLine();

            String sql = "DELETE FROM Contacts WHERE email = '" + email + "'";
            System.out.println(sql);
            int numberOfChangedRows = statement.executeUpdate(sql);
            if (numberOfChangedRows > 0) {
                System.out.println("Kontakten raderades");
            } else {
                System.out.println("Kunde inte hitta en kontakt med " + email);
            }

        } catch(SQLException ex) {
            Database.PrintSQLException(ex);
        }


        try {
            connection.close();
        } catch (SQLException ex) {
            Database.PrintSQLException(ex);
        }

    }

    private static void log(Connection conn, String userId, String message) {
        try {
            String user = (userId == null || userId.isEmpty()) ? "NULL" : userId;
            Statement statement = conn.createStatement();
            String sql = "INSERT INTO Log SET usersId = " + user + ", message = '" + message + "'";
            //System.out.println(sql);
            statement.executeUpdate(sql);
        } catch(SQLException ex) {
            Database.PrintSQLException(ex);
        }
    }

}