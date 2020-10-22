package Model;

public class User {
    private String firstName;
    private String secondName;
    private String userName;
    private String password;

    public User() {

    }

    public User(String firstName, String secondName, String userName) {
        setFirstName(firstName);
        setSecondName(secondName);
        setUsername(userName);
    }

    public String hashPassword(String password){
        return Integer.toString(password.hashCode());
    }

    public String getUsername(){
        return userName;
    }

    public String getPassword(){
        return password;
    }

    public String getFirstName(){
        return firstName;
    }

    public String getSecondName(){
        return secondName;
    }

    public void setUsername(String userName) {
        this.userName = userName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setSecondName(String secondName){
        this.secondName = secondName;
    }

    public void setPassword(String password){
        this.password = hashPassword(password);
    }
}
