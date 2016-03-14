package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.Category;
import model.Reminder;
import model.User;
import service.CategoryService;

@Controller
@RequestMapping("/Reminder")
public class ReminderController {
	
	@Autowired
	@Qualifier("categoryService")
	CategoryService cateService;
	
	@RequestMapping(value = "/save-reminder", method = RequestMethod.GET)
	public String saveReminder(ModelMap model, HttpServletRequest request) {
		Reminder reminder = new Reminder();
		model.addAttribute("reminder", reminder);
		return "save-reminder";
	}
	
	@ModelAttribute("categories")
	public List<Category> getAllCates() {
		return cateService.getAllCategories();
	}
}
