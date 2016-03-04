package dao;

import java.util.List;

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
				+ " AND Date(time) between DATE_SUB(current_date(), INTERVAL :month MONTH) AND current_date() ";
		
		SQLQuery query = session.createSQLQuery(sql);
		query.addEntity(Invoice.class);
		query.setParameter("cateId", cateId);
		query.setParameter("month", nofMonth);
		List<Invoice> invoiceList = query.list();
		return invoiceList;
	}


	

}
