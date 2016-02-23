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
	public boolean create(User user) {
		boolean result = false;
		try {
			if (!hasUser()) {
				dao.create(user);
				result = true;
			} else {
				result = false;
			}
		} catch (Exception e) {
			result = false;
			e.printStackTrace();
		}

		return result;

	}

	@Override
	public boolean update(User user) {
		boolean result = false;
		try {
			dao.update(user);
			result = true;
		} catch (Exception e) {
			result = false;
			e.printStackTrace();
		}
		return result;
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
		User user = null;
		List<User> list = dao.getAllUsers();
		if (hasUser()) {
			user = list.get(0);
		} else {
			user = null;
		}

		return user;
	}

}
