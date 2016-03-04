package service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

import model.Category;
import model.Invoice;

public interface InvoiceService {
	public List<Invoice> getAllInvoices();

	public List<Invoice> getAllInvoices(int Uid);

	public Invoice getById(int id);

	public Boolean create(Invoice invoice);

	public void update(Invoice invoice);

	public void delete(Invoice invoice);

	public List<Invoice> getAllInvoicesByMonth(Date date);

	public Map<String, List<Invoice>> getInvoicesGroupbyMonth();

	public List<String> getAllDayMonth();

	public List<Invoice> getTop10IsNotWarning(Category category);

	public double calAverage(Category category);

	public List<Invoice> getTop10(Category category);

	public boolean checkIsWarning(BigDecimal amount, Category category);

	public List<Invoice> getInvoiceAttribute(String attribute);

}
