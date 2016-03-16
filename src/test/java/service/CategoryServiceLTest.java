package service;

import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import dao.CategoryDAO;
import model.Category;
import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

import java.util.ArrayList;
import java.util.List;

public class CategoryServiceLTest {
	private Category category;

	@Autowired
	@Qualifier("categoryDao")
	private CategoryDAO categoryDAO;
	
	@Autowired
	private CategoryService categoryService;

	@Before
	public void setUp() {
		category = mock(Category.class);
		categoryDAO = mock(CategoryDAO.class);
		categoryService = new CategoryServiceImpl();
	}

	@Test
	public void testMockCreation() {
		assertNull(category);
		assertNull(categoryDAO);
	}

	@Test
	public void testGetAll() {
		Category water = new Category();
		water.setName("Nước");
		water.setDescription("Tiền nước");
		water.setLogo("water.png");

		Category travel = new Category();
		travel.setName("Du lịch");
		travel.setDescription("Chi phí du lịch");
		travel.setLogo("travel.png");

		List<Category> list = new ArrayList<>();
		list.add(water);
		list.add(travel);

		when(categoryDAO.getAllCategories()).thenReturn(list);
		
		
		assertEquals(list, categoryDAO.getAllCategories());
	}
}
