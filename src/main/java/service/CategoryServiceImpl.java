package service;

import java.io.File;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import dao.CategoryDAO;
import model.Category;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	@Qualifier("categoryDao")
	private CategoryDAO dao;

	@Autowired
	ServletContext application;

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

	@Override
	public String create(Category category, MultipartFile file, ModelMap model) {
		if (!checkCateAvailable(category.getName())) {
			String logo = file.getOriginalFilename();
			category.setLogo("abc.png");
			if (!file.isEmpty()) {
				try {
					InputStream input = file.getInputStream();
					if (ImageIO.read(input) == null) {
						model.addAttribute("error_image", "File is not image");
						return "save-cate";
					}
				} catch (Exception e) {
					model.addAttribute("error_image", "Not load file");
					return "save-cate";
				}

				try {
					Date now = new Date();
					String name = now.toString().replaceAll(" ", "").replaceAll(":", "");
					logo = name + logo;
					String path = application.getRealPath("/resources/logo/") + logo;

					if (!logo.equals("")) {
						file.transferTo(new File(path));
						category.setLogo(logo);
					}
				} catch (Exception e) {
					category.setLogo("abc.png");
				}
			}

			dao.create(category);

			model.addAttribute("category", new Category());
			model.addAttribute("message", category.getName().toUpperCase() + " category save " + " success!");

			return "save-cate";

		} else {
			model.addAttribute("error", "Name existed!");
			return "save-cate";
		}
	}

	@Override
	public String update(Category category, MultipartFile file, ModelMap model) {
		Category cateFindByName = getByName(category.getName());
		if (checkCateAvailable(category.getName()) && (category.getId() == cateFindByName.getId())) {
			try {
				if (!file.isEmpty()) {
					try (InputStream input = file.getInputStream()) {
						if (ImageIO.read(input) == null) {
							model.addAttribute("error_image", "File is not image");
							return "save-cate";
						}
					} catch (Exception e) {
						model.addAttribute("error_image", "Not load file");
						return "save-cate";
					}
					String logo = file.getOriginalFilename();
					String path = application.getRealPath("/resources/logo/") + logo;
					if (!logo.equals("")) {
						file.transferTo(new File(path));
						category.setLogo(logo);
					}
				}
			} catch (Exception e) {
			}
			dao.update(category);
			return "redirect:/Category/listCategories";
		} else {
			model.addAttribute("error", "Name existed!");
			return "save-cate";
		}

	}

	@Override
	public String create(Category category) {
		String result = "";
		try {
			dao.create(category);
		} catch (Exception e) {
			result = e.getMessage();
		}

		return result;
	}

}
