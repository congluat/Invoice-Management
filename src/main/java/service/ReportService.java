package service;

import java.util.Date;
import java.util.List;

import model.Invoice;

public interface ReportService {
	// get list invoice by category and months before
	public List<Invoice> getInoiveByCateMonths(Integer cateId, int nofMonth);

	// get list invoice by category and from date to date
	public List<Invoice> getInvoiceD2D(Integer cateId, String startdate, String endate);
	
	//test report
	public List<Object[]> getReportDataByMonth();
	
	public List<Object[]> getCategoryByMonth(int month, int year);

	public List<Object[]> getMoneyUsePerDay(int month, int year);

}
