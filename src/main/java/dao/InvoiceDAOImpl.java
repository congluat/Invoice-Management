package dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import model.Category;
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
			e.printStackTrace();
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
	public void delete(Invoice invoice) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.delete(invoice);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}finally {
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
		String hql = "FROM Invoice WHERE MONTH(Time) = " + month + " AND YEAR(Time) = " + year
				+ " Order by DAY(Time) DESC";
		List<Invoice> list = session.createQuery(hql).list();
		session.close();
		return list;
	}

	@Override
	public Map<String, List<Invoice>> getInvoicesGroupbyMonth() {
		Session session = sessionFactory.openSession();

		List<String> months = getAllDayMonth();

		Map<String, List<Invoice>> map = new HashMap<>();

		for (String month : months) {

			String[] date = month.split("-");

			int m = Integer.valueOf(date[0]);
			int y = Integer.valueOf(date[1]);
			System.out.println(m + "/" + y);

			String hql = "FROM Invoice WHERE month(Time)=" + m + " AND year(Time)=" + y
					+ " ORDER BY YEAR(Time), MONTH(Time) DESC";
			List<Invoice> list = session.createQuery(hql).list();
			map.put(m + "/" + y, list);
		}

		session.close();

		return map;
	}

	@Override
	public List<String> getAllDayMonth() {
		Session session = sessionFactory.openSession();
		String hql = "select Month(Time) as month, Year(Time) as year from Invoice group by month(Time), year(time) ORDER BY Year(Time) DESC";

		List<String> months = new ArrayList<>();
		// DateFormat df = new SimpleDateFormat("MM/yyyy");
		List<Object[]> objects = session.createQuery(hql).list();

		for (Object[] result : objects) {
			String month = result[0].toString();
			String year = result[1].toString();
			System.out.println(month);
			System.out.println(year);
			months.add(month + "-" + year);
		}

		session.close();
		return months;
	}

	@Override
	public List<Invoice> getTop10(Category category) {
		Session session = sessionFactory.openSession();
		List<Invoice> list;
		String hql =" from Invoice where CategoryId = :id order by(Time) DESC ";
		Query query = session.createQuery(hql);
		query.setMaxResults(10);
		list = query.setParameter("id", category.getId()).list();
		session.close();
		return list;		
	}
	
	@Override
	public List<Invoice> getInvoiceAttribute(String attribute) {
		Session session = sessionFactory.openSession();	
		String hql = "FROM Invoice where name LIKE '%"+attribute+"%'";		
		List<Invoice> invoices = session.createQuery(hql).list();		
		session.close();
		return invoices;
	}

}
