package controller;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Category;
import model.Invoice;
import service.CategoryService;
import service.ReportService;

@Controller
@RequestMapping("/Report")
public class ReportController {
	@Autowired
	@Qualifier("reportService")
	ReportService reportService;
	
	@Autowired
	@Qualifier("categoryService")
	CategoryService cateService;
	
	@Autowired
	SessionFactory sessionFactory;
	
	@RequestMapping("/")
	public String pageGetCateMonths(ModelMap model) {
		List<Object[]> list = reportService.getReportDataEveryMonth();
		model.addAttribute("datalist", list);
		return "rCate-Months-ng";
	}
	
	
	@RequestMapping(value="/cateM", method= RequestMethod.GET)
	@ResponseBody
	public List<Invoice> InvoiceCatebyMonths(HttpServletRequest request) {
		Integer cateId = Integer.parseInt(request.getParameter("category"));
		Integer month = Integer.parseInt(request.getParameter("month"));
		List<Invoice> list = reportService.getInoiveByCateMonths(cateId, month);
		return list;
	}
	
	@RequestMapping(value="/cateMd2d", method= RequestMethod.GET)
	@ResponseBody
	public List<Invoice> getInvoiced2d(HttpServletRequest request,
							@RequestParam String startdate,
							@RequestParam String endate) throws ParseException {
		Integer cateId = Integer.parseInt(request.getParameter("cateId"));
		List<Invoice> list = reportService.getInvoiceD2D(cateId, startdate, endate);
		return list;
	}
	
	@RequestMapping(value="/getReportByDate", method= RequestMethod.GET)
	@ResponseBody
	public List<Object[]> getReportByDate(@RequestParam String selectdate) {
		return reportService.getReportDataByDate(selectdate);
	}
	
	@RequestMapping(value="/getReportByMonth", method= RequestMethod.GET)
	@ResponseBody
	public List<Object[]> getReportByMonth(@RequestParam String selectmonth) {
		return reportService.getReportDataByMonth(selectmonth);
	}
	
	@RequestMapping(value="/getReportByYear", method= RequestMethod.GET)
	@ResponseBody
	public List<Object[]> getReportByYear(@RequestParam String selectyear) {
		int year = Integer.parseInt(selectyear);
		return reportService.getReportDataByYear(year);
	}
	
	@RequestMapping(value="/getReportd2d", method= RequestMethod.GET)
	@ResponseBody
	public List<Object[]> getInvoiced2d(
							@RequestParam String fromdate,
							@RequestParam String todate) {
		return reportService.getReportDataByd2d(fromdate, todate);
	}
	
	@RequestMapping(value="/getInvoiceDetailByDate", method= RequestMethod.GET)
	@ResponseBody
	public List<Invoice> getReportDetailByDate(@RequestParam String cateName,
										@RequestParam String selectdate) {
		return reportService.getReportDetailByDate(cateName, selectdate);
	}
	
	@RequestMapping(value="/getInvoiceDetail", method= RequestMethod.GET)
	@ResponseBody
	public List<Invoice> getReportDetail(@RequestParam String cateName,
										@RequestParam String time) {
		return reportService.getReportDetail(cateName, time);
	}
	
	@RequestMapping(value="/getInvoiceDetaild2d", method= RequestMethod.GET)
	@ResponseBody
	public List<Invoice> getReportDetaild2d(@RequestParam String cateName,
										@RequestParam String fromdate,
										@RequestParam String todate) {
		return reportService.getReportDetaild2d(cateName, fromdate, todate);
	}
	
	@RequestMapping(value="/getInfo", method= RequestMethod.GET)
	@ResponseBody
	public List<Invoice> getReportInfo(@RequestParam String cateName,
										@RequestParam String month) {
		return reportService.getReportInfo(cateName, month);
	}
	
	@ModelAttribute("categories")
	public List<Category> listcates(){
		List<Category> cateList = cateService.getAllCategories();
		return cateList;
	}
	
}
