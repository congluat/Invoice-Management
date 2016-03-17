package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import org.springframework.stereotype.Repository;

import model.Reminder;

@Repository
public class ReminderDAOImpl implements ReminderDAO {

	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void create(Reminder reminder) {

		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.save(reminder);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}

	}

	@Override

	public boolean update(Reminder reminder) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.saveOrUpdate(reminder);
			tx.commit();
			return true;
		} catch (Exception e) {
			tx.rollback();
			return false;
		} finally {
			session.close();
		}
	}

	@Override
	public void delete(Reminder reminder) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.delete(reminder);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		} finally {
			session.close();
		}
	}

	@Override
	public List<Reminder> getAll() {
		Session session = sessionFactory.openSession();
		List<Reminder> list = session.createQuery("FROM Reminder").list();
		session.close();
		return list;
	}

	@Override
	public List<Reminder> getByDay(int day) {
		Session session = sessionFactory.openSession();
		List<Reminder> list = session.createQuery("FROM Reminder WHERE TIME =" + day).list();
		session.close();
		return list;
	}

	@Override
	public Reminder getById(int id) {
		Session session = sessionFactory.openSession();
		Reminder reminder = (Reminder) session.get(Reminder.class, id);
		session.close();
		return reminder;
	}

	@Override
	public Reminder getByCategory(int CatId) {
		Session session = sessionFactory.openSession();
		String hql = "From Reminder where category.id =:cateId";
		Query query = session.createQuery(hql);
		query.setParameter("cateId", CatId);
		Reminder reminder = (Reminder) query.uniqueResult();
		session.close();
		return reminder;
	}

}

