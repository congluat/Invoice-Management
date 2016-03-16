package service;

import static org.junit.Assert.*;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

import dao.InvoiceDAO;
import model.Category;
import model.Invoice;
import model.User;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:/servlet-context.xml"})
@Transactional
public class InvoiceService2Test {
	
	@InjectMocks
	@Autowired
	@Qualifier("invoiceService")
	private InvoiceService service;
	
	@InjectMocks
	@Autowired
	@Qualifier("categoryService")
	private CategoryService categoryService;
	
	@InjectMocks
	@Autowired
	@Qualifier("userService")
	private UserService userService;

	@Test
	public void createInvoice2Test() {
		
		Category category = categoryService.getById(2);
		
		User user = userService.getUser();
		
		Invoice invoice = new Invoice();
		invoice.setName("Hoc Phi");
		invoice.setAmount(new BigDecimal("2000"));
		invoice.setCategory(category);
		invoice.setIsWarning(false);
		invoice.setTime(new Date());
		invoice.setUser(user);
		
		assertNotNull(service.create(invoice));
	}
	
	@Test
	public void updateInvoice2Test() {
		List<Invoice> invoices = service.getAllInvoices();
		Invoice invoice = invoices.get(3);
		invoice.setName("Tien Rac");
		service.update(invoice);
		
		assertEquals("Tien Rac", service.getAllInvoices().get(3).getName());
	}
	
	@Test
	public void deleteInvoice2Test() {
		Invoice invoice = service.getById(2);
		service.delete(invoice);
		assertNull(service.getById(2));
	}

	@Test
	public void getAllInvoices(){
		List<Invoice> list = new ArrayList<Invoice>();
		list.add(new Invoice());
		InvoiceDAO dao = Mockito.mock(InvoiceDAO.class);
		Mockito.when(dao.getAllInvoices()).thenReturn(list);
		List<Invoice> test= service.getAllInvoices();
		assertNotNull(test);
	}
	
	@Test
	public void getById(){
		Invoice invoice = new Invoice();
		invoice.setId(1);
		InvoiceDAO dao = Mockito.mock(InvoiceDAO.class);
		Mockito.when(dao.findById(1)).thenReturn(invoice);
		Invoice test = service.getById(1);
		assertNull(test);
	}
	
	@Test
	public void getAllInvoicesByMonth(){
		List<Invoice> list = new ArrayList<Invoice>();
		Invoice invoice = new Invoice();
		invoice.setTime(new Date(2016/1/1));
		list.add(invoice);
		InvoiceDAO dao = Mockito.mock(InvoiceDAO.class);
		Mockito.when(dao.getAllInvoicesByMonth(new Date(2016/1/1))).thenReturn(list);
		List<Invoice> test= service.getAllInvoices();
		assertNotNull(test);		
	}
}
