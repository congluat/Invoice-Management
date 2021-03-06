package dao;

import java.util.List;

import model.Category;

public interface CategoryDAO {
	public void create(Category category);
	
	public void update(Category category);
	
	public void delete(Category category);
	
	public List<Category> getAllCategories();
	
	public Category getById(int id);
	
	public Category getByName(String name);
}
