package service;

import java.util.List;

import model.Invoice;

public interface InvoiceService {
	public List<Invoice> getAllInvoices();
	public Invoice getById(int id);
	public void create(Invoice invoice);
	public void update(Invoice invoice);
}
