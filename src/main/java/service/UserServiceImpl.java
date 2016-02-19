package service;

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

}
