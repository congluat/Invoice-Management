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
		session.close();
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void deleteFile(Photo photo) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try{
			session.delete(photo);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		}
		finally {
			session.close();
		}			
	}

	@Override
	public Photo getById(Integer id) {
		Session session = sessionFactory.openSession();
		Photo photo = (Photo) session.get(Photo.class, id);
		session.close();
		return photo;	
	}

}
