package service;

import java.util.List;

import org.antlr.tool.FASerializer;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import dao.CategoryDAO;
import model.Category;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	@Qualifier("categoryDao")
	private CategoryDAO dao;

	@Override
	public void create(Category category) {
		
		dao.create(category);

	}

	@Override
	public void update(Category category) {
		dao.update(category);
	}

	@Override
	public void delete(Category category) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Category> getAllCategories() {
		return dao.getAllCategories();
	}

	@Override
	public Category getById(int id) {
		return dao.getById(id);
	}

	public Category getByName(String name) {
		return dao.getByName(name);
	}

	@Override
	public boolean checkCateAvailable(String name) {

		boolean result = false;
		try {

			Category cate = null;
			cate = getByName(name);
			if (cate != null) {
				result = true;
			} else {
				result = false;
			}
		} catch (Exception e) {
			result = false;
			e.printStackTrace();
		}

		return result;
	}

}
