package SortComparator;

import MYSQLConnection.UserDetails;

import java.util.Comparator;

public class UserComparator implements Comparator<UserDetails>
{
    @Override
    public int compare(UserDetails user1, UserDetails user2)
    {
        int usernamePivot = user1.getUsername().compareTo(user2.getUsername());
        return (usernamePivot != 0) ? usernamePivot : user1.getPassword()
                .compareTo(user2.getPassword());
    }
}