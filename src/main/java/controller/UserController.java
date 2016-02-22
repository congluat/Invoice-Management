package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.User;
import service.UserService;

@Controller
public class UserController {

	@Autowired
	@Qualifier("userService")
	UserService userService;

	@RequestMapping(value = "/checkUser", method = RequestMethod.GET)
	@ResponseBody
	public boolean checkUser() {
		return userService.hasUser();
	}

	@RequestMapping(value = "addUser")
	@ResponseBody
	public String addUser(@RequestParam("name") String name, @RequestParam("age") int age, HttpServletRequest request) {
		User user = new User();
		user.setName(name);
		user.setAge(age);
		userService.create(user);
		return "";
	}

}
