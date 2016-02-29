package dao;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import model.Category;
import model.Invoice;
import model.User;

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

	@Override
	public List<Invoice> getAllInvoices(int Uid) {
		Session session = getSessionFactory().openSession();
		List<Invoice> list = session.createQuery("from Invoice where UserId =" + Uid).list();
		session.close();
		return list;
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Boolean create(Invoice invoice) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.save(invoice);
			tx.commit();
			return true;
		} catch (Exception e) {
			tx.rollback();
			return false;
		}
		finally {
			session.close();	
		}		
	}

	@Override
	public void update(Invoice invoice) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.saveOrUpdate(invoice);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		}
		finally {
			session.close();
		}	
	}
	@Override
	public Invoice findById(int id) {
		Session session = sessionFactory.openSession();
		Invoice invoice = (Invoice) session.get(Invoice.class, id);
		session.close();
		return invoice;
	}

	@Override
	public List<Invoice> getAllInvoicesByMonth(Date date) {
		Session session = sessionFactory.openSession();
		String hql = "FROM Invoice WHERE MONTH(Time) = "+date.getMonth();
		return null;
	}

}
