package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import model.Invoice;
import service.ReportService;

@Controller
public class ReportController {
	@Autowired
	@Qualifier("reportService")
	ReportService reportService;
	
	@RequestMapping("/cateM")
	public String InvoiceCatebyMonths() {
		List<Invoice> list = reportService.getInoiveByCateMonths(1, 1);
		for (Invoice i : list) {
			System.out.println(i.getTime());
		}
		return "home";
	}
	
}
