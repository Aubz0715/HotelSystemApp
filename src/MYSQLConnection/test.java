package MYSQLConnection;

import MYSQLConnection.UserDetails;
import org.junit.Test;

import java.util.List;

import static junit.framework.TestCase.assertEquals;

public class test
{
    @Test
    public void testDatabase()
    {
        ValidData ConnectionDb = new ValidData("root", "");
        List<UserDetails> userID = ConnectionDb.getLogin();
        assertEquals("Paul", userID.get(1).getUsername());
    }
}