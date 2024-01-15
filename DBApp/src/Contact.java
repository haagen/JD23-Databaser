import java.sql.Connection;
import java.sql.*;

public class Contact {

    protected int id = -1; // -1 means a "new" record
    protected String name;
    protected String email;
    protected String phone;

    /*
            C - Create
            R - Read
            U - Update
            D - Delete
     */

    public Contact(int id) throws SQLException {
        Connection conn = Database.getConnection();
        PreparedStatement ps = conn.prepareStatement("SELECT id, name, email, phone FROM Contacts WHERE id = ?");
        ps.setInt(1, id);
        init(ps);
    }

    public Contact(String email) throws SQLException {
        Connection conn = Database.getConnection();
        PreparedStatement ps = conn.prepareStatement("SELECT id, name, email, phone FROM Contacts WHERE email = ?");
        ps.setString(1, email);
        init(ps);
    }

    public Contact() { }

    private void init(PreparedStatement ps) throws SQLException {
        ResultSet rs = ps.executeQuery();
        while(rs.next()) {
            this.id = rs.getInt("id");
            this.name = rs.getString("name");
            this.phone = rs.getString("phone");
            this.email = rs.getString("email");
        }
    }

    /*
            Getters and Setters
     */
    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return this.phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    // --

    public void print() {
        System.out.printf("Contact: id=%d, name=%s, email=%s, phone=%s\n", id, name, email, phone);
    }

    public int save() throws SQLException {

        String sql = "";

        if(id > 0) {
            sql = "UPDATE Contacts SET name = ?, email = ?, phone = ? WHERE id = ?";
        } else {
            sql = "INSERT INTO Contacts SET name = ?, email = ?, phone = ?";
        }

        Connection conn = Database.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, phone);
        if(id > 0) {
            ps.setInt(4, id);
        }

        int numberOfChangedRows = ps.executeUpdate();

        if (id < 0) {
            ResultSet generatedKeys = ps.getGeneratedKeys();
            if (generatedKeys.next()) {
                this.id = generatedKeys.getInt(1);
            }
        }

        return numberOfChangedRows;
    }

    public int delete() throws SQLException {

        if(id < 0) {
            throw new SQLException("No contact loaded!");
        }

        PreparedStatement ps = Database
                                .getConnection()
                                .prepareStatement(
                                        "DELETE FROM Contacts WHERE id = ?"
                                );
        ps.setInt(1, this.id);
        int numberOfChangedRows = ps.executeUpdate();
        if(numberOfChangedRows > 0) {
            this.id = -1;
        }
        return numberOfChangedRows;
    }
}