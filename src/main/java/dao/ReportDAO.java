package dao;


import java.util.List;

import model.Invoice;

public interface ReportDAO {
	// get list invoice by Category and before month
	public List<Invoice> getInvoiceByCateandMonths(Integer cateId, int nofMonth);

	public List<Object[]> getCategoryByMonth(int month, int year);

	// get list invoice by category and d2d
	public List<Invoice> getInvoiceD2D(Integer cateId, String startdate, String endate);
	
	//get data report every Month group by category
	public List<Object[]> getReportDataByMonth();

	public List<Object[]> getMoneyUsePerDay(int month, int year);
}
