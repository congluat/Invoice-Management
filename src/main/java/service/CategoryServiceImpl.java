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
	
	public CategoryServiceImpl() {}
	
	
	public CategoryServiceImpl(CategoryDAO CateDao) {
		this.dao = CateDao;
		// TODO Auto-generated constructor stub
	}
	@Override
	public void delete(Category category) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Category> getAllCategories() {
		return dao.getAllCategories();
	}

	public CategoryDAO getDao() {
		return dao;
	}

	public void setDao(CategoryDAO dao) {
		this.dao = dao;
	}

	@Override
	public Category getById(int id) {
		return dao.getById(id);
	}

	@Override
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
						model.addAttribute("edit", false);
						return "save-cate";
					}
				} catch (Exception e) {
					model.addAttribute("error_image", "Not load file");
					model.addAttribute("edit", false);
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

			return "redirect:/Category/";

		} else {
			model.addAttribute("error", "Name existed!");
			model.addAttribute("edit", false);
			return "save-cate";
		}
	}

	@Override
	public String update(Category category, MultipartFile file, ModelMap model) {
		Category cateFindByName = getByName(category.getName());
		if (cateFindByName == null || category.getId() == cateFindByName.getId()) {
			try {
				if (!file.isEmpty()) {
					try (InputStream input = file.getInputStream()) {
						if (ImageIO.read(input) == null) {
							model.addAttribute("error_image", "File is not image");
							model.addAttribute("edit", true);
							return "save-cate";
						}
					} catch (Exception e) {
						model.addAttribute("error_image", "Not load file");
						model.addAttribute("edit", true);
						return "save-cate";
					}
					String logo = file.getOriginalFilename();
					Date now = new Date();
					String name = now.toString().replaceAll(" ", "").replaceAll(":", "");
					logo = name + logo;
					String path = application.getRealPath("/resources/logo/") + logo;
					if (!logo.equals("")) {
						file.transferTo(new File(path));
						category.setLogo(logo);
					}
				}
			} catch (Exception e) {
				model.addAttribute("edit", true);
				return "save-cate";
			}
			dao.update(category);
			return "redirect:/Category/";
		} else {
			model.addAttribute("error", "Name existed!");
			model.addAttribute("edit", true);
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

	@Override
	public boolean checkCateAndIdAvailable(String name, Integer id) {
		Category cate  = getByName(name);
		if (cate.getId() == id) {
			return true;
		} else
			return false;
	}
}
