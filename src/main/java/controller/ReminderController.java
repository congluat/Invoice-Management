package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	@ResponseBody
	public boolean saveReminder(@RequestParam("id") Integer id ,@RequestParam("time")Integer time , @RequestParam("comment")String comment ,@RequestParam("ID")Integer ID) {
		if(ID==-1){
			Reminder reminder = new Reminder();
			Category category = cateService.getById(id);
			reminder.setCategory(category);
			reminder.setComment(comment);
			reminder.setTime(time);
			return reminderService.create(reminder);
		}
		else{
			Reminder reminder = reminderService.getById(ID);
			Category category = cateService.getById(id);
			reminder.setCategory(category);
			reminder.setComment(comment);
			reminder.setTime(time);
			return reminderService.update(reminder);
		}
	}

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Reminder EditReminderGet(@PathVariable Integer id) {
		Reminder reminder = reService.getById(id);
		return reminder;
	}

	/*@RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
	public String EditReminderPost(ModelMap model, @ModelAttribute Reminder reminder) {
		reService.update(reminder);
		model.addAttribute("message", "Update Success!");
		return "save-reminder";
	}*/

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
		return "redirect:/Reminder/";
	}

	@RequestMapping(value = { "/", "reminders" }, method = RequestMethod.GET)
	public String showReminder(ModelMap model, HttpServletRequest request) {
		Reminder reminder = new Reminder();
		model.addAttribute("reminders", reminderService.getAll());
		model.addAttribute("reminder",reminder);
		model.addAttribute("title", "Reminders");
		return "reminders";
	}
}
