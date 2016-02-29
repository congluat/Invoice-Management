package controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import model.Category;
import model.Invoice;
import model.Photo;
import service.CategoryService;

@Controller
@RequestMapping("/Category")
@EnableWebMvc
public class CategoryController {

	@Autowired
	@Qualifier("categoryService")
	CategoryService cateService;

	@Autowired
	ServletContext application;

	@RequestMapping(value = "/getAllCategories", method = RequestMethod.GET)
	public @ResponseBody List<Category> getAllCategories() throws IOException {
		List<Category> list = new ArrayList<Category>();

		list = cateService.getAllCategories();
		for (Category category : list) {
			System.out.println("category: " + category.getName());
			for (Invoice invoice : category.getInvoices()) {
				System.out.println("invoice: " + invoice.getName());
				for (Photo photo : invoice.getPhotos()) {
					System.out.println("photo: " + photo.getPhoto());
				}
			}
		}

		// String json = new Gson().toJson(cateService.getAllCategories());
		return list;
	}

	@RequestMapping(value = "/listCategories", method = RequestMethod.GET)
	public String listCategories(ModelMap model) {
		model.addAttribute("categories", cateService.getAllCategories());
		model.addAttribute("title", "Category");
		return "category";
	}

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public String editCategoryById(@PathVariable Integer id, ModelMap model) {

		Category cate = cateService.getById(id);
		model.addAttribute("category", cate);
		model.addAttribute("title", cate.getName());

		return "save-cate";
	}

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
	public String UpdateCategoryById(@ModelAttribute Category category, @RequestParam("file") MultipartFile file,
			ModelMap model) {
		return cateService.update(category, file, model);
	}

	@RequestMapping(value = "/save", method = RequestMethod.GET)
	public String InsertCate(ModelMap model) {
		Category category = new Category();

		model.addAttribute("category", category);
		return "save-cate";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String Save(@ModelAttribute Category category, @RequestParam("file") MultipartFile file, ModelMap model) {

		return cateService.create(category, file, model);

	}

	@RequestMapping(value = "/checkCate/{name}")
	@ResponseBody
	public boolean checkCateAvailable(@PathVariable String name, HttpServletRequest request) {

		return cateService.checkCateAvailable(name);
	}

}
