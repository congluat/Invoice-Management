package service;

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

	public ReminderDAO getDao() {
		return dao;
	}

	public void setDao(ReminderDAO dao) {
		this.dao = dao;
	}

	@Override
	public void create(Reminder reminder) {
		dao.create(reminder);
	}

	@Override
	public void udpate(Reminder reminder) {
		dao.udpate(reminder);
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
	public List<Reminder> getByDay(int day) {

		return dao.getByDay(day);
	}

}
