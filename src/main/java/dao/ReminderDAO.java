package dao;

import java.util.List;

import model.Reminder;

public interface ReminderDAO {
	public void create(Reminder reminder);

	public void udpate(Reminder reminder);

	public void delete(Reminder reminder);

	public List<Reminder> getAll();

	public List<Reminder> getByDay(int day);

	public Reminder getById(int id);
	
}
