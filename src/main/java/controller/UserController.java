package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@RequestMapping(value = "/addUser", method = RequestMethod.GET)
	public String addUser() {

		return "";
	}

}
