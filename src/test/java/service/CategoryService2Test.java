package service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;
import static org.mockito.Mock.*;

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

}
