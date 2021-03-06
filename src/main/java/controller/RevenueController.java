package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import service.ReportService;

@Controller
@RequestMapping("/Revenue")
public class RevenueController {

	@Autowired
	@Qualifier("reportService")
	ReportService reportService;

	@RequestMapping(value = "/category-in-month/{month}-{year}", method = RequestMethod.GET)
	@ResponseBody
	public List<Object[]> chart(ModelMap model, @PathVariable int month, @PathVariable int year) {
		model.addAttribute("data", reportService.getCategoryByMonth(month, year));
		List<Object[]> list = reportService.getCategoryByMonth(month, year);
		return list;
	}

	@RequestMapping(value = "/monthly-statistic", method = RequestMethod.GET)
	public String InvoiceCatebyMonths(HttpServletRequest request, ModelMap model) {
		model.addAttribute("title", "Revenue");
		return "monthly-statistic";
	}

	@RequestMapping(value = { "/getdialyuse/{month}-{year}" }, method = RequestMethod.GET)
	@ResponseBody
	public List<Object[]> dialyUse(@PathVariable int month, @PathVariable int year, ModelMap model) {
		return reportService.getMoneyUsePerDay(month, year);
	}

	@RequestMapping(value = "/yearly-statistics", method = RequestMethod.GET)
	public String InvoiceYearStatistic(HttpServletRequest request, ModelMap model) {
		model.addAttribute("title", "Revenue");
		return "yearly-statistics";
	}

	@RequestMapping(value = "/category-in-year/{year}", method = RequestMethod.GET)
	@ResponseBody
	public List<Object[]> yearChart(ModelMap model, @PathVariable int year) {
		model.addAttribute("data", reportService.getMoneyUseInCategoryByYear(year));
		List<Object[]> list = reportService.getMoneyUseInCategoryByYear(year);
		return list;
	}

	@RequestMapping(value = "/get-monthly-use/{year}", method = RequestMethod.GET)
	@ResponseBody
	public List<Object[]> monthlyUseYearChart(ModelMap model, @PathVariable int year) {
		model.addAttribute("data", reportService.getMoneyUseEachMonthInYear(year));
		List<Object[]> list = reportService.getMoneyUseEachMonthInYear(year);
		return list;
	}

}
