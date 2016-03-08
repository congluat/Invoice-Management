package service;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

import model.Invoice;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:/servlet-context.xml"})
@Transactional
public class ReportService2Test {
	
	@Autowired
	private ReportService reportService;

	@Test
	public void getInvoiceTest() {

		List<Object[]> listOfInvoice = 	reportService.getCategoryByMonth(3, 2016);
		
		assertNotNull(listOfInvoice);
		
		List<Object[]> listOfInvoice2 = reportService.getMoneyUsePerDay(3, 2015);
		
		assertNotNull(listOfInvoice2);
		
		List<Invoice> listOfMoney = reportService.getInvoiceD2D(1, "3/2/2015", "3/3/205");
		
		assertNotNull(listOfMoney);
		
	}

}
