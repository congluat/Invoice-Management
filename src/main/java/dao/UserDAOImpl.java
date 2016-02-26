package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.User;

public class UserDAOImpl implements UserDAO {

	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void create(User user) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.save(user);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		}
		finally {
			session.close();
		}
	}

	@Override
	public void update(User user) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.saveOrUpdate(user);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		}
		finally {
			session.close();
		}		
	}

	@Override
	public List<User> getAllUsers() {
		Session session = sessionFactory.openSession();
		List<User> list = session.createQuery("FROM User").list();
		session.close();
		return list;
	}

}
