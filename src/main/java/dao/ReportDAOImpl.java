package dao;

import java.util.List;

import org.hibernate.Query;
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
		//String hql = "FROM Invoice Where category.id =:cateId"
			//	+ " and MONTH(time) between :startMonth AND :endMonth ";
		String hql = "FROM Invoice Where category.id =:cateId";
			//+ " and time between DATE_SUB(current_date(), INTERVAL 7 DAY) AND current_date() ";
		
		Query query = session.createQuery(hql);
		query.setParameter("cateId", cateId);
		//query.setParameter("startMonth",4 );
		//query.setParameter("endMonth", 9);
		
		List<Invoice> invoiceList = query.list();
		return invoiceList;
	}


	

}
