package service;

import java.util.List;

import org.springframework.ui.ModelMap;

import model.Reminder;

public interface ReminderService {

	public String create(Reminder reminder, ModelMap model);

	public void delete(Reminder reminder);

	public List<Reminder> getAll();

	public List<Reminder> getByDay();
	
	public void update(Reminder reminder);

	public Reminder getById(int id);
}
