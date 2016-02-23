package controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.User;
import service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	@Qualifier("userService")
	UserService userService;

	@RequestMapping(value = "/checkUser", method = RequestMethod.GET)
	@ResponseBody
	public boolean checkUser() {
		return userService.hasUser();
	}

	@RequestMapping(value = "/addUser")
	@ResponseBody
	public String addUser(@RequestParam("name") String name, @RequestParam("age") int age, HttpServletRequest request) {
		User user = new User();
		user.setName(name);
		user.setAge(age);	
		userService.create(user);
		return "";
	}
	
	@RequestMapping(value="/profile", method=RequestMethod.GET)
	public String userProfile(ModelMap model,HttpServletRequest request){
		User user = (User) request.getSession().getAttribute("user");
		model.addAttribute("user",user);
		model.addAttribute("title", "Profile");
		return "user-profile";
	}
	
	@RequestMapping(value="/profile", method=RequestMethod.POST)
	public String userProfile(User user,ModelMap model,HttpServletRequest request){
		
		model.addAttribute("success", userService.update(user));
		
		return "user-profile";
	}
	

}
