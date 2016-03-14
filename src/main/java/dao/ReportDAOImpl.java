package dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
				+ " AND Date(time) between DATE_SUB(current_date(), INTERVAL :month MONTH)"
				+ " AND current_date()"
				+ " Order By time ASC";

		SQLQuery query = session.createSQLQuery(sql);
		query.addEntity(Invoice.class);
		query.setParameter("cateId", cateId);
		query.setParameter("month", nofMonth);
		List<Invoice> invoiceList = query.list();
		session.close();
		return invoiceList;
	}

	/**
	 * get category name and total money of that cate used, group by each month
	 * in a year.
	 */
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

	/**
	 * get total money used each day in a month-year
	 */

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
	public List<Invoice> getInvoiceD2D(Integer cateId, String startdate, String endate) {
		Session session = sessionFactory.openSession();
		String hql = "FROM Invoice Where category.id =:cateId " 
				+ " AND time BETWEEN :startdate AND :endate"
				+ " Order By time ASC";
		Query query = session.createQuery(hql);
		query.setParameter("cateId", cateId);
		try {
			query.setParameter("startdate", new SimpleDateFormat("MM/dd/yyyy HH:mm:ss")
											.parse(startdate + " 00:00:00"));
			query.setParameter("endate", new SimpleDateFormat("MM/dd/yyyy HH:mm:ss")
					.parse(endate + " 23:59:59"));
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			session.close();
			e.printStackTrace();
		}
		List<Invoice> invoiceList = query.list();
		session.close();
		return invoiceList;
	}

	@Override
	public List<Object[]> getReportDataEveryMonth() {
		Session session = sessionFactory.openSession();
		int year = Calendar.getInstance().get(Calendar.YEAR);
		String hql = "Select category.name, MONTH(time)," 
				+ " COUNT(id) as count, " 
				+ " SUM(amount) as sum"
				+ " FROM Invoice" 
				+ " WHERE YEAR(time) =:year " 
				+ " GROUP BY category.name, MONTH(time)"
				+ " ORDER BY category.name ASC ,MONTH(time) ASC";
		Query query = session.createQuery(hql);
		query.setParameter("year", year);
		List<Object[]> reportList = query.list();
		session.close();
		return reportList;
	}

	@Override
	public List<Object[]> getReportDataByMonth(int month, int year) {
		Session session = sessionFactory.openSession();

		String hql = "Select category.name," 
				+ " COUNT(id) as count," 
				+ " SUM(amount) as sum," 
				+ " AVG(amount) as avg"
				+ " FROM Invoice" 
				+ " WHERE MONTH(time) =:month" 
				+ " AND YEAR(time) =:year" 
				+ " GROUP BY category.name"
				+ " ORDER BY category.name ASC";

		Query query = session.createQuery(hql);
		query.setParameter("month", month);
		query.setParameter("year", year);
		List<Object[]> reportList = query.list();
		session.close();
		return reportList;
	}

	@Override
	public List<Object[]> getReportDataByYear(int year) {
		Session session = sessionFactory.openSession();
		String hql = "Select category.name," 
				+ " COUNT(id) as count," 
				+ " SUM(amount) as sum," 
				+ " AVG(amount) as avg"
				+ " FROM Invoice" 
				+ " WHERE YEAR(time) =:year" 
				+ " GROUP BY category.name"
				+ " ORDER BY category.name ASC";
		Query query = session.createQuery(hql);
		query.setParameter("year", year);
		List<Object[]> reportList = query.list();
		session.close();
		return reportList;
	}

	@Override
	public List<Invoice> getReportDetail(String cateName, int month, int year) {
		Session session = sessionFactory.openSession();
		String hql = "FROM Invoice Where category.name =:cateName " 
						+ " AND MONTH(time) =:month "
						+ " AND YEAR(time) =:year "
						+ " Order By time ASC";
		Query query = session.createQuery(hql);
		query.setParameter("cateName", cateName);
		query.setParameter("month", month);
		query.setParameter("year", year);
		List<Invoice> invoiceList = query.list();
		session.close();
		return invoiceList;
	}

	@Override
	public List<Object[]> getMoneyUseInCategoryByYear(int year) {
		Session session = sessionFactory.openSession();
		String hql = "select  category.name, SUM(amount)  from Invoice  WHERE year(time)= :year GROUP BY(category)";
		Query query = session.createQuery(hql);
		query.setParameter("year", year);
		List<Object[]> list = query.list();
		session.close();
		return list;
	}

	@Override
	public List<Object[]> getMoneyUseEachMonthInYear(int year) {
		Session session = sessionFactory.openSession();
		String hql = "select Month(time),SUM(amount) from Invoice  WHERE year(time)= :year GROUP BY Month(Time) ORDER BY  Month(Time) ASC";
		Query query = session.createQuery(hql);
		query.setParameter("year", year);
		List<Object[]> list = query.list();
		session.close();
		return list;
	}

	@Override
	public List<Object[]> getReportDataByDate(String selectdate) {
		// TODO Auto-generated method stub
		int month = Integer.parseInt(selectdate.substring( 0, 2));
		int day = Integer.parseInt(selectdate.substring( 3, 5));
		int year = Integer.parseInt(selectdate.substring(6));
		Session session = sessionFactory.openSession();
		String hql = "Select category.name," 
				+ " COUNT(id) as count," 
				+ " SUM(amount) as sum," 
				+ " AVG(amount) as avg"
				+ " FROM Invoice" 
				+ " WHERE DAY(time) =:day"
				+ " AND MONTH(time) =:month"
				+ " AND YEAR(time) =:year"
				+ " GROUP BY category.name"
				+ " ORDER BY category.name ASC";
		Query query = session.createQuery(hql);
		query.setParameter("day", day);
		query.setParameter("month", month);
		query.setParameter("year", year);
		List<Object[]> listReport = query.list();
		session.close();
		return listReport;
	}

	@Override
	public List<Invoice> getReportDetailByDate(String cateName, int day, int month, int year) {
		Session session = sessionFactory.openSession();
		String hql = "FROM Invoice "
				+ " Where category.name =:cateName "
				+ "	AND DAY(time) =:day " 
				+ " AND MONTH(time) =:month "
				+ " AND YEAR(time) =:year "
				+ " Order By time ASC";
		Query query = session.createQuery(hql);
		query.setParameter("cateName", cateName);
		query.setParameter("day", day);
		query.setParameter("month", month);
		query.setParameter("year", year);
		List<Invoice> invoiceList = query.list();
		session.close();
		return invoiceList;
	}

	@Override
	public List<Object[]> getReportDataByd2d(String fromdate, String todate) {
		Session session = sessionFactory.openSession();
		String hql = "Select category.name," 
				+ " COUNT(id) as count," 
				+ " SUM(amount) as sum," 
				+ " AVG(amount) as avg"
				+ " FROM Invoice "
				+ " Where time BETWEEN :fromdate "
				+ " AND :todate"
				+ "	GROUP BY category.name "
				+ " Order By category.name ASC";
		Query query = session.createQuery(hql);
		try {
			query.setParameter("fromdate", new SimpleDateFormat("MM/dd/yyyy HH:mm:ss")
											.parse(fromdate + " 00:00:00"));
			query.setParameter("todate", new SimpleDateFormat("MM/dd/yyyy HH:mm:ss")
					.parse(todate + " 23:59:59"));
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			session.close();
			e.printStackTrace();
		}
		List<Object[]> list = query.list();
		session.close();
		return list;
	}

	@Override
	public List<Invoice> getReportDetaild2d(String cateName, String fromdate, String todate) {
		Session session = sessionFactory.openSession();
		String hql = "FROM Invoice "
				+ " Where category.name =:cateName "
				+ "	AND time BETWEEN :fromdate " 
				+ " AND :todate "
				+ " Order By time ASC";
		Query query = session.createQuery(hql);
		query.setParameter("cateName", cateName);
		try {
			query.setParameter("fromdate", new SimpleDateFormat("MM/dd/yyyy HH:mm:ss")
											.parse(fromdate + " 00:00:00"));
			query.setParameter("todate", new SimpleDateFormat("MM/dd/yyyy HH:mm:ss")
					.parse(todate + " 23:59:59"));
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			session.close();
			e.printStackTrace();
		}
		List<Invoice> invoiceList = query.list();
		session.close();
		return invoiceList;
	}

}
