package dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import model.Category;
import model.Invoice;
import model.User;

public interface InvoiceDAO {
	public List<Invoice> getAllInvoices();
	public List<Invoice> getAllInvoices(int Uid);
	public Invoice findById(int id);
	public Boolean create(Invoice invoice);
	public void update(Invoice invoice);
	public List<Invoice> getAllInvoicesByMonth(Date date);
	public Map<String, List<Invoice>> getInvoicesGroupbyMonth();
	public List<Date> getAllDayMonth();
}
