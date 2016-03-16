package dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import model.Category;
import model.Invoice;

public interface InvoiceDAO {
	public List<Invoice> getAllInvoices();

	public List<Invoice> getAllInvoices(int Uid);

	public Invoice findById(int id);

	public Boolean create(Invoice invoice);

	public void update(Invoice invoice);

	public void delete(Invoice invoice);

	public List<Invoice> getAllInvoicesByMonth(Date date);
	
	public List<Invoice> getAllDangerInvoicesByMonth(Date date);

	public Map<String, List<Invoice>> getInvoicesGroupbyMonth();

	public List<String> getAllDayMonth();
	
	public List<Invoice> getTop10IsNotWarning(Category category);
	
	public List<Invoice> getTop10(Category category);
	
	public List<Invoice> getInvoiceAttribute(String attribute, String empname);
	
	public List<Invoice> searchAnyString(String keyword);
	
	public List<Invoice> getTop5Invoices();
}
