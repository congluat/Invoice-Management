package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import dao.UserDAO;
import model.Category;
import model.User;

public class UserServiceImpl implements UserService {

	@Autowired
	@Qualifier("userDao")
	private UserDAO dao;

	
	@Autowired
	@Qualifier("categoryService")
	CategoryService cateService;
	
	@Override
	public boolean create(User user) {
		boolean result = false;
		try {
			if (!hasUser()) {
				dao.create(user);
				
				Category water = new Category();
				water.setName("Nước");
				water.setDescription("Tiền nước");
				water.setLogo("water.png");
				cateService.create(water);
				
				Category travel = new Category();
				travel.setName("Du lịch");
				travel.setDescription("Chi phí du lịch");
				travel.setLogo("travel.png");
				cateService.create(water);
				
				Category shopping = new Category();
				shopping.setName("Mua sắm");
				shopping.setDescription("Chi phí mua sắm");
				shopping.setLogo("shopping.png");
				cateService.create(shopping);
				
				
				Category gift = new Category();
				gift.setName("Quà tặng");
				gift.setDescription("Chi phí mua quà");
				gift.setLogo("gift.png");
				cateService.create(gift);
				
				Category food = new Category();
				food.setName("Ăn uống");
				food.setDescription("Chi phí ăn uống");
				food.setLogo("food.png");
				cateService.create(food);
				
				Category electric = new Category();
				electric.setName("Điện");
				electric.setDescription("Tiền điện");
				electric.setLogo("electric.png");
				cateService.create(electric);
				
				Category calling = new Category();
				calling.setName("Điện thoại");
				calling.setDescription("Chi phí nạp thẻ điện thoại");
				calling.setLogo("calling.png");
				cateService.create(calling);
				
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
	public boolean update(User user) {
		boolean result = false;
		try {
			dao.update(user);
			result = true;
		} catch (Exception e) {
			result = false;
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean hasUser() {
		boolean result = false;
		List<User> list = dao.getAllUsers();
		if (list.size() == 0) {
			result = false;
		} else {
			result = true;
		}
		return result;
	}

	@Override
	public User getUser() {
		User user = null;
		List<User> list = dao.getAllUsers();
		if (hasUser()) {
			user = list.get(0);
		} else {
			user = null;
		}

		return user;
	}

}
