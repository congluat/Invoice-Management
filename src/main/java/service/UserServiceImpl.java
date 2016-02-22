package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import dao.UserDAO;
import model.User;

public class UserServiceImpl implements UserService {

	@Autowired
	@Qualifier("userDao")
	private UserDAO dao;

	@Override
	public void create(User user) {

		dao.create(user);
	}

	@Override
	public void update(User user) {
		dao.update(user);
	}

	@Override
	public boolean hasUser() {
		
		boolean result = false;
		List<User> list = dao.getAllUsers();
		if (list.size() == 0) {
			result = false;
		} else {
			result = true;
		}
		return result;
	}

	@Override
	public User getUser() {
		User user;
		List<User> list = dao.getAllUsers();
		user = list.get(0);
		return user;
	}

}
