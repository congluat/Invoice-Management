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
		try {
			session.save(category);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		}
		finally {
			session.close();
		}
	}		
	@Override
	public void update(Category category) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.saveOrUpdate(category);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		}
		finally {
			session.close();
		}
		
	}

	@Override
	public void delete(Category category) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.delete(category);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
		}
		finally {
			session.close();
		}	
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
		String hql = "from Category";
		List<Category> categories = session.createQuery(hql).list();
		session.close();
		return categories;
	}

	@Override
	public Category getById(int id) {
		Session session = sessionFactory.openSession();

		Category cate = (Category) session.get(Category.class, id);
		session.close();
		return cate;
	}

	@Override
	public Category getByName(String name) {
		Session session = sessionFactory.openSession();
		String hql = "FROM Category where name = :pname";
		Query query = session.createQuery(hql);
		query.setParameter("pname", name);
		//get category 
		Category cate = (Category) query.uniqueResult();
		session.close();
		return cate;
	}

}
