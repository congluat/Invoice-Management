package controller;

import java.io.File;
import java.io.InputStream;
import java.util.Date;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

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
import com.google.gson.Gson;

import model.Category;
import service.CategoryService;

@Controller
@RequestMapping("/Category")
public class CategoryController {

	@Autowired
	@Qualifier("categoryService")
	CategoryService cateService;

	@Autowired
	ServletContext application;

	@RequestMapping(value = "/getAllCategories", method = RequestMethod.GET)
	@ResponseBody
	public String getAllCategories() {

		String json = new Gson().toJson(cateService.getAllCategories());
		return json;
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
		
		try(InputStream input = file.getInputStream()){			
			if(ImageIO.read(input)==null){
				model.addAttribute("error_image", "file image invalid");
				return "save-cate";
			}
		}catch(Exception e){
			model.addAttribute("error_image", "file image invalid");
			return "save-cate";
		}
		
		
		if (cateService.checkCateAvailable(category.getName())
				&& (category.getId()==cateService.getByName(category.getName()).getId())) {
		try {
			String logo = file.getOriginalFilename();
			String path = application.getRealPath("/resources/logo/") + logo;
			if (!logo.equals("")) {
				file.transferTo(new File(path));
				category.setLogo(logo);
			}
		} catch (Exception e) {
		}
		cateService.update(category);
		return "redirect:/Category/listCategories";
		}
		else {
			model.addAttribute("error", "Name existed!");
			return "save-cate";
		}
	}

	@RequestMapping(value = "/save", method = RequestMethod.GET)
	public String InsertCate(ModelMap model) {
		Category category = new Category();
		
		model.addAttribute("category", category);
		return "save-cate";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String Save(@ModelAttribute Category category, @RequestParam("file") MultipartFile file, ModelMap model) {
		String logo = file.getOriginalFilename();
		
		try(InputStream input = file.getInputStream()){			
			if(ImageIO.read(input)==null){
				model.addAttribute("error_image", "file image invalid");
				return "save-cate";
			}
		}catch(Exception e){
			model.addAttribute("error_image", "file image invalid");
			return "save-cate";
		}
				
		category.setLogo("abc.png");
		if (!cateService.checkCateAvailable(category.getName())) {
			try {
				Date now = new Date();
				String name = now.toString().replaceAll(" ", "").replaceAll(":", "");
				System.out.println("name" + name);
				logo = name + logo;

				String path = application.getRealPath("/resources/logo/") + logo;

				if (!logo.equals("")) {
					file.transferTo(new File(path));
					category.setLogo(logo);
				}
			} catch (Exception e) {
				category.setLogo("abc.png");
			}

			cateService.create(category);

			model.addAttribute("category", new Category());
			model.addAttribute("message", category.getName().toUpperCase() + " category save " + " success!");

			return "save-cate";

		}
		else {
			model.addAttribute("error", "Name existed!");
			return "save-cate";
		}

	}

	@RequestMapping(value = "/checkCate/{name}")
	@ResponseBody
	public boolean checkCateAvailable(@PathVariable String name, HttpServletRequest request) {

		return cateService.checkCateAvailable(name);
	}
	

}
