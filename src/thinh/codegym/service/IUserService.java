package thinh.codegym.service;

import thinh.codegym.model.User;
import java.util.List;

public interface IUserService {
    User findUser(int id);

    List<User> findUser(String input);

    User findUserByNameAndEmail(String name, String email);

    List<User> getUserList();

    boolean isExitsUser(String name, String email);

    void newUser(User user);

    boolean updateUser(int id, User user);

    boolean removeUser(int id);

}
