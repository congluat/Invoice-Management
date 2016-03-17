package service;

import java.util.List;

import model.Reminder;

public interface ReminderService {

	public boolean create(Reminder reminder);

	public void delete(Reminder reminder);

	public List<Reminder> getAll();

	public List<Reminder> getByDay();
	
	public boolean update(Reminder reminder);

	public Reminder getById(int id);
}
