package dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
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
		} finally {
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
		int month = date.getMonth() + 1;
		int year = date.getYear() + 1900;
		String hql = "FROM Invoice WHERE MONTH(Time) = " + month + " AND YEAR(Time) = " + year;
		List<Invoice> list = session.createQuery(hql).list();
		session.close();
		return list;
	}

	@Override
	public Map<String, List<Invoice>> getInvoicesGroupbyMonth() {
		Session session = sessionFactory.openSession();

		List<Date> months = getAllDayMonth();

		Map<String, List<Invoice>> map = new HashMap<>();

		for (Date month : months) {
			int m = month.getMonth() + 1;
			int y = month.getYear() + 1900;
			System.out.println(m + "/" + y);

			String hql = "FROM Invoice WHERE month(Time)=" + m + " AND year(Time)=" + y + " ORDER BY Time DESC";
			List<Invoice> list = session.createQuery(hql).list();
			map.put(m + "/" + y, list);
		}

		session.close();

		return map;
	}

	@Override
	public List<Date> getAllDayMonth() {
		Session session = sessionFactory.openSession();
		String hql = "from Invoice group by month(Time), year(time) ORDER BY TIME DESC";

		List<Invoice> invoices = session.createQuery(hql).list();
		List<Date> months = new ArrayList<>();
		DateFormat df = new SimpleDateFormat("MM/yyyy");

		for (Invoice invoice : invoices) {
			months.add(invoice.getTime());
		}

		session.close();
		return months;
	}

}
