package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Invoice;
import service.ReportService;

@Controller
@RequestMapping("/Revenue")
public class RevenueController {

	@Autowired
	@Qualifier("reportService")
	ReportService reportService;

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	@ResponseBody
	public List<Object[]> chart(ModelMap model) {
		model.addAttribute("data", reportService.getCategoryByMonth(3, 2016));
		return reportService.getCategoryByMonth(3, 2016);
	}

	@RequestMapping(value = "/monthly-statistic", method = RequestMethod.GET)
	public String InvoiceCatebyMonths(HttpServletRequest request) {
	
		return "monthly-statistic";
	}
}
