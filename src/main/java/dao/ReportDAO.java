package dao;


import java.util.Date;
import java.util.List;

import model.Invoice;

public interface ReportDAO {
	//get list invoice by Category and before month
	public List<Invoice> getInvoiceByCateandMonths(Integer cateId, int nofMonth);
	
	// get list invoice by category and d2d
	public List<Invoice> getInvoiceD2D(Integer cateId, String startdate, String endate);
	
}
