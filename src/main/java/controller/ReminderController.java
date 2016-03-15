package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.Reminder;
import service.ReminderService;

@Controller
@RequestMapping("/Reminder")
public class ReminderController {

	@Autowired
	@Qualifier("reminderService")
	ReminderService reminderService;

	@RequestMapping(value = "/save-reminder", method = RequestMethod.GET)
	public String saveReminder(ModelMap model, HttpServletRequest request) {
		Reminder reminder = new Reminder();
		model.addAttribute("reminder", reminder);
		return "save-reminder";
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String deleteReminder(@PathVariable int id, ModelMap model, HttpServletRequest request) {
		reminderService.delete(reminderService.getById(id));
		return "reminders";
	}

	@RequestMapping(value = { "/", "reminders" }, method = RequestMethod.GET)
	public String showReminder(ModelMap model, HttpServletRequest request) {

		model.addAttribute("reminders", reminderService.getAll());
		return "reminders";
	}
}
