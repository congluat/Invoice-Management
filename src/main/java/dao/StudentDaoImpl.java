package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;



@Repository
public class StudentDaoImpl implements StudentDao {
	
	
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public void test() {
		Session session = getSessionFactory().openSession();
		String hql = "From Invoice";
		session.createQuery(hql);
	}
}
