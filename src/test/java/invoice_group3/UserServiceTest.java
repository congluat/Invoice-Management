package invoice_group3;

import static org.junit.Assert.assertEquals;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import model.User;
import service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/WEB-INF/servlet-context.xml" })
public class UserServiceTest {
	@Autowired
	@Qualifier("userService")
	private UserService service;

	@Test
	public void addUser() {
		if (!service.hasUser()) {
			User user = new User();
			user.setName("Luat");
			user.setAge(20);
			service.create(user);
			User other = service.getUser();
			assertEquals(user, other);
		}else{
			
		}
	}
}
