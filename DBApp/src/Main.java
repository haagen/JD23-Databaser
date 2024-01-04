import java.sql.Connection;
import java.sql.*;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        //demoFromTheLessons();

        pokemonExcercise();

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

        try {

            String sql = "SELECT * FROM Pokemons WHERE height > 1.0";
            System.out.println(sql);
            Statement statement = connection.createStatement();
            ResultSet result = statement.executeQuery(sql);
            System.out.println("Pokemons > 1.0");
            while(result.next()) {
                System.out.println(result.getString("name"));
            }
            System.out.println("\nSenast skapade användare");
            sql = "SELECT name, createdDate FROM Users ORDER BY createdDate DESC";
            result = statement.executeQuery(sql);
            while(result.next()) {
                System.out.print(result.getString("name"));
                System.out.println(" " + result.getDate("createdDate"));
            }

            sql = "SELECT * FROM Users ORDER BY lastLogin DESC LIMIT 1";
            result = statement.executeQuery(sql);
            if(!result.next()) {
                return;
            }
            int usersId = result.getInt("id");

            sql = "SELECT * FROM UserPokemons WHERE usersId = " + usersId;
            result = statement.executeQuery(sql);
            String in = "";
            while(result.next()) {
                if(in.length() != 0) {
                    in += ", ";
                }
                in += result.getInt("pokemonsId");
            }
            if (in.isEmpty()) return;
            sql = "SELECT * FROM Pokemons WHERE Id IN (" + in + ")";
            System.out.println(sql);
            result = statement.executeQuery(sql);
            while(result.next()) {
                System.out.println(result.getString("name"));
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
}