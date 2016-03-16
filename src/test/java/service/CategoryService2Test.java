package service;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import dao.CategoryDAO;
import model.Category;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:/servlet-context.xml"})
@Transactional
public class CategoryService2Test {
	
	@Autowired
	private CategoryService categoryService;

	@Test
	public void createCategory2Test () {
		
		Category category = Mockito.mock(Category.class);
		
		Mockito.when(category.getName()).thenReturn("Resort");
		
		MultipartFile file = Mockito.mock(MultipartFile.class);
		
		ModelMap model = Mockito.mock(ModelMap.class);
		
		categoryService.create(category, file, model);
		
		Mockito.verify(category).getName();
		
	}
	
	@Test
	public void updateCategory2Test() {
		
		Category category = categoryService.getById(1);
		
		category.setName("Hoc Phi");
		category.setLogo("abc.png");
		
		MultipartFile file = Mockito.mock(MultipartFile.class);
		
		ModelMap model = Mockito.mock(ModelMap.class);
		
		String result = categoryService.update(category, file, model);
		
		assertEquals("save-cate", result);		
		
	}
	
	@Test	
	public void getAllCategories(){
		List<Category> list = new ArrayList<Category>();
		list.add(new Category());
		CategoryDAO dao = Mockito.mock(CategoryDAO.class);
		Mockito.when(dao.getAllCategories()).thenReturn(list);
		List<Category> test= categoryService.getAllCategories();
		assertNotNull(test);
	}
	
	@Test
	public void getById(){
		Category cate = new Category();
		cate.setId(1);
		CategoryDAO dao = Mockito.mock(CategoryDAO.class);
		Mockito.when(dao.getById(1)).thenReturn(cate);
		Category test = categoryService.getById(1);
		assertEquals(cate.getId(), test.getId());
	}
	
	@Test
	public void getByName(){
		Category cate = new Category();
		cate.setName(new String("a"));	
		CategoryDAO dao = Mockito.mock(CategoryDAO.class);
		Mockito.when(dao.getByName(new String("a"))).thenReturn(cate);
		Category test = categoryService.getByName(new String("a"));
		Mockito.verify(dao).getByName(new String("a"));
		assertEquals(cate, test);
	}
	
}
