package service;

import org.junit.Before;

import org.junit.Test;

import org.springframework.beans.factory.annotation.Autowired;

import dao.UserDAO;

import model.User;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

import java.util.ArrayList;
import java.util.List;

public class UserServiceLTest {

	private UserDAO userDao;

	@Autowired
	private UserService userService;

	@Before
	public void setUp() {
		/* user = mock(User.class); */
		userDao = mock(UserDAO.class);
		userService = new UserServiceImpl(userDao);
	}

	@Test
	public void test1() {
		User user = new User();
		user.setName("Cong Luat");
		user.setAge(23);

		User user2 = new User();
		user2.setName("Dog");
		user2.setAge(24);

		User user3 = new User();
		user3.setName("llll");
		user3.setAge(10);

		List<User> list = new ArrayList<>();
		list.add(user);
		list.add(user2);
		list.add(user3);

		when(userDao.getAllUsers()).thenReturn(list);

		assertEquals(userService.getUser(), user);
	}
	
	@Test
	public void createUser() {
		User user = new User();
		user.setName("Cong Luat");
		user.setAge(-1);
		assertEquals(userService.getUser(), user);
	}

	
}
