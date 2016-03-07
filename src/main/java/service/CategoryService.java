package service;

import java.util.List;

import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import model.Category;

public interface CategoryService {
	public String create(Category category, MultipartFile file, ModelMap model);

	public String create(Category category);
	
	public String update(Category category, MultipartFile file, ModelMap model);

	public void delete(Category category);

	public List<Category> getAllCategories();

	public Category getById(int id);
	
	public Category getByName(String name);
	
	public boolean checkCateAvailable(String name);
	
}
