package dao;

import java.util.Date;
import java.util.List;

import model.Category;
import model.Invoice;
import model.User;

public interface InvoiceDAO {
	public List<Invoice> getAllInvoices();
	public List<Invoice> getAllInvoices(int Uid);
	public Invoice findById(int id);
	public void create(Invoice invoice);
	public void update(Invoice invoice);
	public List<Invoice> getAllInvoicesByMonth(Date date);
	
}
