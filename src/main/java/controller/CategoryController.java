package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import model.Category;
import service.CategoryService;

@Controller
public class CategoryController {

	@Autowired
	@Qualifier("categoryService")
	CategoryService cateService;

	@RequestMapping(value = "/getAllCategories", method = RequestMethod.GET)
	@ResponseBody
	public String getAllCategories() {
		String json = new Gson().toJson(cateService.getAllCategories());
		return json;
	}

}
