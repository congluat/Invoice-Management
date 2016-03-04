package service;

import java.util.Date;
import java.util.List;

import model.Invoice;

public interface ReportService {
	//get list invoice by category and months before
	public List<Invoice> getInoiveByCateMonths(Integer cateId, int nofMonth);
	
	//get list invoice by category and from date to date
	public List<Invoice> getInvoiceD2D(Integer cateId, String startdate, String endate);
}
