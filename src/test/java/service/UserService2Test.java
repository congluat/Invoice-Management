package service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

import model.User;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:/servlet-context.xml"})
@Transactional
public class UserService2Test {
	
	@Autowired
	UserService service;

	@Test
	public void addUser2Test() {
		User user = new User();
		user.setName("Ngo");
		user.setId(1);
		user.setAge(25);
		service.create(user);
		assertEquals("Ngo Lam", service.getUser().getName());
	}
	
	@Test
	public void updateUser2Test() {
		User user = service.getUser();
		
		user.setName("Ngo Lam");
		
		service.update(user);
		
		assertEquals("Ngo Lam", service.getUser().getName());
	}
	
	
	
}