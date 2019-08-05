package MYSQLConnection;

import java.text.MessageFormat;

public class UserDetails
{
    private String username;
    private String password;
    private String email;
    private int id;

    public UserDetails(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public UserDetails(int id, String email, String username, String password){
        this.email = email;
        this.username = username;
        this.password = password;
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getEmail() { return email; }

    public int getId(){ return id; }

    public String toString() {
        return MessageFormat.format("{0}\n{1}", username, password);
    }
}
