package dao;

import java.util.List;

import model.User;

public interface UserDAO {

	public void create(User user);

	public void update(User user);

	public List<User> getAllUsers();

}
