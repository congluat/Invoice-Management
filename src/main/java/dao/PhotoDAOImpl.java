package dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.Photo;

public class PhotoDAOImpl implements PhotoDAO {

	private SessionFactory sessionFactory;
	
	@Override
	public void saveFile(Photo photo) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(photo);
		tx.commit();
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

}
