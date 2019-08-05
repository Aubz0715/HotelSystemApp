package MYSQLConnection;

import org.junit.Test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static junit.framework.TestCase.assertEquals;

/**
 * @author Aubrey
 */
public class ValidData {

    private final String url = "jdbc:mysql://localhost/hotel reservation_rooms";
    private String dbUsername;
    private String dbPassword;

    public ValidData(String dbUsername, String dbPassword) {
        this.dbUsername = dbUsername;
        this.dbPassword = dbPassword;
    }

    public Connection setupConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, dbUsername, dbPassword);

            return con;
        } catch (SQLException | ClassNotFoundException severe) {
            severe.printStackTrace();

            try {
                assert false;
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return con;
    }

    public ArrayList<UserDetails> getLogin() {
        /*
         * Further code refactoring to be implemented soon!!
         */
        ArrayList<UserDetails> loginDetails = new ArrayList<>();

        try {
            PreparedStatement selectQuery = setupConnection().prepareStatement(
                    "Select * From `login`");

            ResultSet storeResults = selectQuery.executeQuery();

            while (storeResults.next()) {
                loginDetails.add(new UserDetails(storeResults.getString("username"),
                        storeResults.getString("password")));

                System.out.println("User email is " +loginDetails );
                System.out.println("sql command to retrieve login details is " +"Select * From `login`" );
            }
        } catch (SQLException severeEx) {
            severeEx.printStackTrace();
        }
        return loginDetails;
    }

    public int insertNewUser(int id, String email, String name, String p_word) {
        int rowsUpdated = 0;

        try {
            PreparedStatement insertUser = setupConnection().prepareStatement(
                    "Insert Into `customer` VALUES(?, ?, ?, ?))");

            try {

                insertUser.setInt(1, id);
                insertUser.setString(2, email);
                insertUser.setString(3, name);
                insertUser.setString(4, p_word);

                rowsUpdated = insertUser.executeUpdate();
            } finally {
                insertUser.close();
            }

            if (rowsUpdated >= 1) {
                System.out.println("Single Engine 104");
            } else {
                return rowsUpdated;
            }
        } catch (SQLException severe) {
            severe.printStackTrace();
        }
        return rowsUpdated;
    }

    public int insertNewUser(int email) {
        int rowsExecuted = 0;
        String nestedQuery = "Insert Into `login` Values (( Select `customer`.`customer_id` From `customer` Where " +
                "`customer_id` = ? ), ( Select `customer`.`name` From `customer` Where `customer_id` = ? ), ( Select `customer`.`email` From `customer` Where `customer_id` = ? )" +
                "( Select `customer`.`p_word` From `customer` Where `customer_id` = ? ));";
        try {
            try (PreparedStatement nestedInsert = setupConnection().prepareStatement(nestedQuery)) {

                nestedInsert.setInt(1, email);
                nestedInsert.setInt(2, email);
                nestedInsert.setInt(3, email);
                nestedInsert.setInt(4, email);

                rowsExecuted = nestedInsert.executeUpdate();
            }
            return rowsExecuted >= 1 ? rowsExecuted : -1;
        } catch (SQLException severe) {
            severe.printStackTrace();
        }
        return rowsExecuted;
    }


}