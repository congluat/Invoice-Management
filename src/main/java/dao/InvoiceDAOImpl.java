package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import model.Invoice;

@Repository
public class InvoiceDAOImpl implements InvoiceDAO {
	
	private SessionFactory sessionFactory;

	@Override
	public List<Invoice> getAllInvoices() {
		Session session = getSessionFactory().openSession();
		List<Invoice> list = session.createQuery("from Invoice").list();
		session.close();
		return list;
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
}
