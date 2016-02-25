package dao;

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
	public void create(Invoice invoice) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		// invoice.getCategory().getInvoices().add(invoice);
		// invoice.getUser().getInvoices().add(invoice);
		session.save(invoice);
		tx.commit();
		session.close();
	}

	@Override
	public void update(Invoice invoice) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		// Iterator<Invoice> it =
		// invoice.getCategory().getInvoices().iterator();
		// Invoice in;
		// while(it.hasNext()){
		// in = it.next();
		// if(in.getId()==invoice.getId()){
		// in.setAmount(invoice.getAmount());
		// in.setComment(invoice.getComment());
		// in.setIsWarning(invoice.getIsWarning());
		// in.setName(invoice.getName());
		// in.setPlace(invoice.getPlace());
		// in.setTime(invoice.getTime());
		// }
		// }
		// Iterator<Invoice> it1 = invoice.getUser().getInvoices().iterator();
		// while(it1.hasNext()){
		// in = it1.next();
		// if(in.getId()==invoice.getId()){
		// in.setAmount(invoice.getAmount());
		// in.setComment(invoice.getComment());
		// in.setIsWarning(invoice.getIsWarning());
		// in.setName(invoice.getName());
		// in.setPlace(invoice.getPlace());
		// in.setTime(invoice.getTime());
		// }
		// }

		session.saveOrUpdate(invoice);
		tx.commit();
		session.close();
	}

	@Override
	public Invoice findById(int id) {
		Session session = sessionFactory.openSession();

		Invoice invoice = (Invoice) session.get(Invoice.class, id);
		session.close();
		return invoice;
	}

}
