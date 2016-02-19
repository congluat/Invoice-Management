package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import model.Category;

@Repository
public class CategoryDAOImpl implements CategoryDAO {
	
	private SessionFactory sessionFactory;
	
	
	@Override
	public void create(Category category) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(category);
		tx.commit();
		session.close();
	}

	@Override
	public void update(Category category) {		
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.saveOrUpdate(category);
		tx.commit();
		session.close();
	}

	@Override
	public void delete(Category category) {		
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.delete(category);
		tx.commit();
		session.close();
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Category> getAllCategories() {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String hql="from Category";
		
		//fix if has error
		List<Category> categories=session.createQuery(hql).list();
		tx.commit();
		session.close();
		return categories;
	}

	@Override
	public Category getById(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		
		Category cate = (Category) session.get(Category.class, id);
		session.close();
		return cate;
	}

	@Override
	public Category getByName(String name) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		String hql ="from Category where name =: pname";
		Query query = session.createQuery(hql);
		query.setParameter("pname", name);
		Category cate = (Category) query.uniqueResult();
		session.close();
		return cate;
	}
	

}
