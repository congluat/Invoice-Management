package service;

import java.util.List;

import model.Invoice;

public interface InvoiceService {
	public List<Invoice> getAllInvoices();
	public List<Invoice> getAllInvoices(int Uid);
	public Invoice getById(int id);
	public Boolean create(Invoice invoice);
	public void update(Invoice invoice);
}
