package service;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import dao.ReminderDAO;
import model.Reminder;

@Service
public class ReminderServiceImpl implements ReminderService {

	@Autowired
	@Qualifier("reminderDao")
	private ReminderDAO dao;
	
	public ReminderServiceImpl() {}
	public ReminderServiceImpl(ReminderDAO dao) {
		this.dao = dao;
	}
	

	public ReminderDAO getDao() {
		return dao;
	}

	public void setDao(ReminderDAO dao) {
		this.dao = dao;
	}

	@Override
	public boolean create(Reminder reminder) {
		Reminder remind = dao.getByCategory(reminder.getCategory().getId());
		if (remind == null) {
			dao.create(reminder);
			//model.addAttribute("message", "Insert Success!");
			return true;
		}
		//model.addAttribute("message", "Reminder has Exist!");
		return false;
	}

	@Override
	public boolean update(Reminder reminder) {
		return dao.update(reminder);
	}

	@Override
	public void delete(Reminder reminder) {
		dao.delete(reminder);
	}

	@Override
	public List<Reminder> getAll() {

		return dao.getAll();
	}

	@Override
	public List<Reminder> getByDay() {
		int day = Calendar.getInstance().get(Calendar.DATE);
		return dao.getByDay(day);
	}

	@Override
	public Reminder getById(int id) {
		return dao.getById(id);
	}

	

}
