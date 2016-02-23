package service;

import java.util.List;

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
		// TODO Auto-generated method stub

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

}
