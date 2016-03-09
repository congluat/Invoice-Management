package dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import model.Invoice;

public class ReportDAOImpl implements ReportDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Invoice> getInvoiceByCateandMonths(Integer cateId, int nofMonth) {
		Session session = sessionFactory.openSession();
		String sql = "Select * FROM Invoices Where categoryId =:cateId"
				+ " AND Date(time) between DATE_SUB(current_date(), INTERVAL :month MONTH) AND current_date() "
				+ " Order By time ASC";

		SQLQuery query = session.createSQLQuery(sql);
		query.addEntity(Invoice.class);
		query.setParameter("cateId", cateId);
		query.setParameter("month", nofMonth);
		List<Invoice> invoiceList = query.list();
		session.close();
		return invoiceList;
	}

	@Override
	public List<Object[]> getCategoryByMonth(int month, int year) {
		Session session = sessionFactory.openSession();
		String hql = "select  category.name,SUM(amount)  from Invoice  WHERE month(time)= :month AND year(time)= :year GROUP BY(category)";
		Query query = session.createQuery(hql);
		query.setParameter("month", month);
		query.setParameter("year", year);
		List<Object[]> list = query.list();
		session.close();
		return list;
	}

	@Override
	public List<Invoice> getInvoiceD2D(Integer cateId, String startdate, String endate) {
		Session session = sessionFactory.openSession();
		String hql = "FROM Invoice Where category.id =:cateId " 
						+ " AND time BETWEEN :startdate AND :endate"
						+ " Order By time ASC";
		Query query = session.createQuery(hql);
		query.setParameter("cateId", cateId);
		query.setParameter("startdate", new Date(startdate));
		query.setParameter("endate", new Date(endate));
		List<Invoice> invoiceList = query.list();
		session.close();
		return invoiceList;
	}

	@Override
	public List<Object[]> getMoneyUsePerDay(int month, int year) {
		Session session = sessionFactory.openSession();
		String hql = "select Day(time),SUM(amount) from Invoice  WHERE month(time)= :month AND year(time)= :year GROUP BY Day(Time) ORDER BY  Day(Time) ASC";
		Query query = session.createQuery(hql);
		query.setParameter("month", month);
		query.setParameter("year", year);
		List<Object[]> list = query.list();
		session.close();
		return list;

	}

	@Override
	public List<Object[]> getReportDataByMonth() {
		Session session = sessionFactory.openSession();
		String hql = "Select category.name,"
				+ " COUNT(*) as sl, "
				+ " SUM(amount) as tong"
				+ " FROM Invoice"
				+ " GROUP BY category.name";
		Query query = session.createQuery(hql);
		session.close();
		return query.list();
	}

}
