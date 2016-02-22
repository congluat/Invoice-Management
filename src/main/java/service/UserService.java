package service;

import java.util.List;

import model.User;

public interface UserService {

	public boolean hasUser();

	public void create(User user);

	public void update(User user);

}
