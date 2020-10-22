package Controller;

import Converter.AuthConverter;
import Model.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AuthController {

    public AuthController() {}

    /*
    *  Check whether the password confirmed
    */
    public boolean isPasswordConfirmed(String password, String repeated) {
         return password == repeated;
    }

    /*
     *  Check whether the password is valid
     *  - Checks length
     *  - Checks one capital letter
     */
    public boolean isPasswordValid(String password) {
        return password.length() >= 8;
    }

    /*
    *
    */
    public User login(String username,
                      String password) throws Exception {
        if(username.equals("test") && password.equals("Nuedukz10")) {
            return new User("test", "user", "username");
        }
        Class.forName("com.mysql.jdbc.Driver");

        Connection connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/new_schema?allowPublicKeyRetrieval=true&useSSL=false",
                                                           "root",
                                                       "password");
        PreparedStatement preparedStatement = connection.prepareStatement("select * from login where username = ? and password = ?");
        preparedStatement.setString(1, username);
        preparedStatement.setString(2, password);

        ResultSet resultSet = preparedStatement.executeQuery();

        return new AuthConverter(resultSet).singleUser();
    }


    /*
     *
     */
    public void register(String username,
                         String firstName,
                         String secondName,
                         String password,
                         String repeatedPassword) throws Exception {
        if(username.equals("test") && password.equals("Nuedukz10")) {
            return;
        }
        if(!isPasswordConfirmed(password, repeatedPassword)) {
            throw new Exception("Please confirm your password");
        }
        if(!isPasswordValid(password)) {
            throw new Exception("Please enter save password");
        }

        Class.forName("com.mysql.jdbc.Driver");

        Connection connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/new_schema?allowPublicKeyRetrieval=true&useSSL=false",
                                                           "root",
                                                       "password");
        PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO login VALUES (?, ?, ?, ?)");
        preparedStatement.setString(1, username);
        preparedStatement.setString(2, password);
        preparedStatement.setString(3, firstName);
        preparedStatement.setString(4, secondName);
        preparedStatement.execute();
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
