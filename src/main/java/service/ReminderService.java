package service;

import java.util.List;

import org.springframework.ui.ModelMap;

import model.Reminder;

public interface ReminderService {

	public void create(Reminder reminder);


	public void delete(Reminder reminder);

	public List<Reminder> getAll();


	public List<Reminder> getByDay();
	
	void update(Reminder reminder, ModelMap model);

	public Reminder getById(int id);
}
