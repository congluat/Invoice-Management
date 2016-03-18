package controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import model.Category;
import model.Invoice;
import model.User;
import service.CategoryService;
import service.InvoiceService;

@Controller
@RequestMapping("/Demo")
@EnableWebMvc
public class DemoController {

	@Autowired
	@Qualifier("categoryService")
	CategoryService cateService;

	@Autowired
	@Qualifier("invoiceService")
	InvoiceService invoiceService;

	@RequestMapping(value = "/genarate")
	@ResponseBody
	public String generateData(HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		List<Category> categories = cateService.getAllCategories();

		for (Category category : categories) {
			switch (category.getId()) {
			case 1: {
				createInvoice(category, "Tiền nước tháng 3", 500000d, 2016, 3, 17, false, user);
				createInvoice(category, "Tiền nước tháng 2", 400000d, 2016, 2, 16, false, user);
				createInvoice(category, "Tiền nước tháng 1", 600000d, 2016, 1, 18, true, user);
				createInvoice(category, "Tiền nước tháng 12", 380000d, 2015, 12, 15, false, user);
				createInvoice(category, "Tiền nước tháng 11", 450000d, 2015, 11, 16, false, user);
				createInvoice(category, "Tiền nước tháng 10", 550000d, 2015, 10, 10, false, user);
				break;
			}
			case 2: {
				createInvoice(category, "Du lịch Hà Nội", 5000000d, 2016, 3, 10, false, user);
				createInvoice(category, "Du lịch Đà Lạt", 2000000d, 2016, 2, 8, false, user);
				createInvoice(category, "Du lịch Nha Trang", 3845000d, 2016, 1, 25, false, user);
				createInvoice(category, "Du lịch Cà Mau", 1500000d, 2015, 10, 12, false, user);
				break;
			}
			case 3: {
				createInvoice(category, "Sắm cái áo đi đám cưới", 200000d, 2016, 3, 14, false, user);
				createInvoice(category, "Sắm cái quần đi đám cưới", 350000d, 2016, 3, 13, false, user);
				createInvoice(category, "Sắm đôi giày đi đám cưới", 2200000d, 2016, 3, 12, true, user);
				createInvoice(category, "Sắm đôi giày mới ra", 470000d, 2016, 3, 11, true, user);
				createInvoice(category, "Mua ÁO MƯA", 5000d, 2016, 3, 12, false, user);
				createInvoice(category, "Mua đôi vớ", 75000d, 2016, 3, 10, false, user);
				createInvoice(category, "Mua nhẫn", 3350000d, 2016, 3, 7, false, user);
				createInvoice(category, "Mua son môi", 200000d, 2016, 3, 6, false, user);
				createInvoice(category, "Mua dây chuyền", 3500000d, 2016, 3, 4, true, user);

				break;
			}
			case 4: {
				createInvoice(category, "Quà sinh nhật gấu thằng bạn", 20000d, 2016, 3, 1, false, user);
				createInvoice(category, "Quà 8/3", 300000d, 2016, 3, 8, false, user);
				createInvoice(category, "Quà valentine", 200000d, 2016, 2, 14, false, user);
				createInvoice(category, "Đám cưới", 500000d, 2016, 3, 14, false, user);
				createInvoice(category, "Sinh nhật thg A", 150000d, 2016, 2, 16, false, user);
				createInvoice(category, "Sinh nhật thg B", 160000d, 2016, 3, 3, false, user);
				
				break;
			}
			case 5:{
				createInvoice(category, "Ăn sáng", 35000d, 2016, 3, 18, false, user);
				createInvoice(category, "Ăn sáng", 30000d, 2016, 3, 17, false, user);
				createInvoice(category, "Ăn sáng", 32000d, 2016, 3, 16, false, user);
				createInvoice(category, "Ăn sáng", 31000d, 2016, 3, 15, false, user);
				createInvoice(category, "Ăn sáng", 25000d, 2016, 3, 14, false, user);
				createInvoice(category, "Ăn sáng", 20000d, 2016, 3, 13, false, user);
				
				break;
			}
			case 6:{
				
				break;
			}
			case 7:{
				
				break;
			}

			}
		}

		return "done";
	}

	public void createInvoice(Category category, String name, Double amount, int year, int month, int day,
			boolean warning, User user) {
		Invoice i1 = new Invoice();
		i1.setCategory(category);
		i1.setName(name);
		i1.setAmount(BigDecimal.valueOf(amount));
		Date date = new Date();
		date.setYear(year);
		date.setMonth(month);
		date.setDate(day);
		i1.setTime(date);
		i1.setIsWarning(warning);
		i1.setUser(user);
		invoiceService.create(i1);
	}

}
