package service;

import static org.mockito.Mockito.mock;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import dao.CategoryDAO;

import model.Category;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

public class CategoryServiceLTest {

	private CategoryDAO cateDao;
	
	private CategoryService categoryService;

	List<Category> list;

	@Before
	public void setUp() {
		/* user = mock(User.class); */
		cateDao = mock(CategoryDAO.class);
		list = new ArrayList<>();

		categoryService = new CategoryServiceImpl(cateDao);
	}

	@Test
	public void getByName() {
		Category cate = new Category();
		cate.setName("Dien");
		cate.setDescription("Dien");
		cate.setLogo("dien.png");

		when(cateDao.getByName("Dien")).thenReturn(cate);

		assertEquals(cate, categoryService.getByName("Dien"));
	}
	
	@Test
	public void getByName2() {
		Category cate = new Category();
		cate.setName("Dien");
		cate.setDescription("Dien");
		cate.setLogo("dien.png");

		when(cateDao.getByName("Dien")).thenReturn(cate);

		assertNull(categoryService.getByName("Nuoc"));
	}

}
