package service;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import dao.InvoiceDAO;
import model.Category;
import model.Invoice;
import model.User;

public class InvoiceServoceLTest {

	private InvoiceDAO invoiceDao;

	private InvoiceService invoiceService;

	private List<Invoice> list;

	@Before
	public void init() {
		invoiceDao = mock(InvoiceDAO.class);
		invoiceService = new InvoiceServiceImpl(invoiceDao);

		User user = new User();
		user.setName("Luat");
		user.setAge(22);
		
		Category water = new Category();
		water.setName("Nước");
		water.setDescription("Tiền nước");
		water.setLogo("water.png");

		Category travel = new Category();
		travel.setName("Du lịch");
		travel.setDescription("Chi phí du lịch");
		travel.setLogo("travel.png");

		Category shopping = new Category();
		shopping.setName("Mua sắm");
		shopping.setDescription("Chi phí mua sắm");
		shopping.setLogo("shopping.png");

		Invoice i1 = new Invoice();
		i1.setName("i1");
		i1.setAmount(BigDecimal.valueOf(50000d));
		i1.setCategory(water);
		i1.setComment("comment 1");
		i1.setIsWarning(false);
		i1.setTime(new Date());
		i1.setUser(user);
		
		Invoice i2 = new Invoice();
		i2.setName("i2");
		i2.setAmount(BigDecimal.valueOf(500500d));
		i2.setCategory(water);
		i2.setComment("comment 2");
		i2.setIsWarning(false);
		i2.setTime(new Date());
		i2.setUser(user);
		
		Invoice i3 = new Invoice();
		i3.setName("i3");
		i3.setAmount(BigDecimal.valueOf(50480d));
		i3.setCategory(water);
		i3.setComment("comment 3");
		i3.setIsWarning(false);
		i3.setTime(new Date());
		i3.setUser(user);
		
		
	}

	@Test
	public void getAllInvoices() {

	}

}
