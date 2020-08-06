package thinh.codegym.service;

import thinh.codegym.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserService implements IUserService{
    private static final String ADD_NEW_USER = "insert into userList (name, email, password, role) value (?,?,?,?);";
    private static final String SELECT_ALL_USERS = "select * from userList";
    private static final String SELECT_USER_BY_ID = "select * from userList where id = ?";
    private static final String UPDATE_USER_INFO =  "update userList set name = ?, email = ?, password = ? where id = ?;";
    private static final String REMOVE_USER =  "delete from userList where id = ?;";
    private static final String FIND_USER = "select * from userList where id like ? or name like ?";
    private static final String FIND_USER_BY_NAME_AND_EMAIL = "select * from userList where name = ? or email = ?";
    private static final String FIND_USER_EXACTLY = "select * from userList where email = ? or name = ? and password = ?";

    public static User findUserExactly(String nameOrEmail, String password) {
        User user = null;

        try (Connection connection = MySQLConnUtils.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(FIND_USER_EXACTLY)) {
            preparedStatement.setString(1, nameOrEmail);
            preparedStatement.setString(2, nameOrEmail);
            preparedStatement.setString(3, password);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                user = getUserInfo(resultSet, id);
            }
        }
        catch (SQLException e) {
            MySQLException.printSQLException(e);
        }
        return user;
    }

    @Override
    public User findUser(int id) {
        User user = null;
        try (Connection connection = MySQLConnUtils.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                user = getUserInfo(resultSet, id);
            }
        }
        catch (SQLException e) {
            MySQLException.printSQLException(e);
        }
        return user;
    }

    @Override
    public List<User> findUser(String input) {
        String findingValue = "%" + input + "%";
        List<User> userList = new ArrayList<>();

        try (Connection connection = MySQLConnUtils.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(FIND_USER)) {
            preparedStatement.setString(1, findingValue);
            preparedStatement.setString(2, findingValue);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                userList.add(getUserInfo(resultSet, id));
            }
        }
        catch (SQLException e) {
            MySQLException.printSQLException(e);
        }
        return userList;
    }

    @Override
    public User findUserByNameAndEmail(String name, String email) {
        User user = null;
        try (Connection connection = MySQLConnUtils.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(FIND_USER_BY_NAME_AND_EMAIL)) {
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, email);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                user = getUserInfo(resultSet, id);
            }
        }
        catch (SQLException e) {
            MySQLException.printSQLException(e);
        }
        return user;
    }

    @Override
    public List<User> getUserList() {
        List<User> userList = new ArrayList<>();

        try (Connection connection = MySQLConnUtils.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS)) {
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                userList.add(getUserInfo(resultSet, id));
            }
        }
        catch (SQLException e) {
            MySQLException.printSQLException(e);
        }
        return userList;
    }

    @Override
    public boolean isExitsUser(String name, String email) {
        User user = findUserByNameAndEmail(name, email);
        return user != null;
    }

    @Override
    public void newUser(User user) {
        try (Connection connection = MySQLConnUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(ADD_NEW_USER)) {
            setUserInfo(statement, user);
            statement.executeUpdate();
        } catch (SQLException e) {
            MySQLException.printSQLException(e);
        }
    }

    @Override
    public boolean updateUser(int id, User user) {
        boolean userUpdated = false;
        try (Connection connection = MySQLConnUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_USER_INFO)) {
            setUserInfo(statement, user);
            statement.setInt(4, id);
            userUpdated = statement.executeUpdate() > 0;
        } catch (SQLException exception) {
            MySQLException.printSQLException(exception);
        }
        return userUpdated;
    }

    @Override
    public boolean removeUser(int id) {
        boolean userRemoved = false;
        try (Connection connection = MySQLConnUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(REMOVE_USER)) {
            statement.setInt(1, id);
            userRemoved = statement.executeUpdate() > 0;
        } catch (SQLException exception) {
            MySQLException.printSQLException(exception);
        }
        return userRemoved;
    }

    private static User getUserInfo(ResultSet resultSet, int id) throws SQLException {
        String name = resultSet.getString("name");
        String email = resultSet.getString("email");
        String password = resultSet.getString("password");
        String role = resultSet.getString("role");
        return new User(id, name, email, password, role);
    }

    private static void setUserInfo(PreparedStatement statement, User user) throws SQLException {
        statement.setString(1, user.getName());
        statement.setString(2, user.getEmail());
        statement.setString(3, user.getPassword());
        statement.setString(4, user.getRole());
    }
}