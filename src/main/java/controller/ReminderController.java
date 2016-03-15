package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Category;
import model.Reminder;
import service.ReminderService;
import service.CategoryService;

@Controller
@RequestMapping("/Reminder")
public class ReminderController {
	@Autowired
	@Qualifier("reminderService")
	ReminderService reService;

	@Autowired
	@Qualifier("categoryService")
	CategoryService cateService;

	@Autowired
	@Qualifier("reminderService")
	ReminderService reminderService;

	@RequestMapping(value = "/save-reminder", method = RequestMethod.GET)
	public String saveReminder(ModelMap model, HttpServletRequest request) {
		Reminder reminder = new Reminder();
		model.addAttribute("reminder", reminder);
		return "save-reminder";
	}

	@RequestMapping(value = "/save-reminder", method = RequestMethod.POST)
	public String saveReminderS(ModelMap model, @ModelAttribute Reminder reminder) {
		reService.create(reminder);
		model.addAttribute("message", "Insert Successfully!");
		return "save-reminder";
	}

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public String EditReminderGet(ModelMap model, @PathVariable Integer id) {
		Reminder reminder = reService.getById(id);
		model.addAttribute("reminder", reminder);
		return "save-reminder";
	}

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
	public String EditReminderPost(ModelMap model, @ModelAttribute Reminder reminder) {
		reService.update(reminder, model);
		return "save-reminder";
	}

	@RequestMapping("/getReminder-byNow")
	@ResponseBody
	public List<Reminder> listReminder() {
		return reService.getByDay();
	}

	@ModelAttribute("categories")
	public List<Category> getAllCates() {
		return cateService.getAllCategories();
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String deleteReminder(@PathVariable int id, ModelMap model, HttpServletRequest request) {
		reminderService.delete(reminderService.getById(id));
		return "redirect:/reminders";
	}

	@RequestMapping(value = { "/", "reminders" }, method = RequestMethod.GET)
	public String showReminder(ModelMap model, HttpServletRequest request) {

		model.addAttribute("reminders", reminderService.getAll());
		return "reminders";
	}
}
