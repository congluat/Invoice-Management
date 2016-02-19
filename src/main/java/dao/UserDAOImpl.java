package dao;

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
		session.save(user);
		tx.commit();
		session.close();

	}

	@Override
	public void update(User user) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.saveOrUpdate(user);
		tx.commit();
		session.close();
		
	}

}
