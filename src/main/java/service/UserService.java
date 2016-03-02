package service;

import model.User;

public interface UserService {

	public boolean hasUser();

	public boolean create(User user);

	public boolean update(User user);
	
	public User getUser();

}
