package service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import dao.InvoiceDAO;
import model.Invoice;

@Service
public class InvoiceServiceImpl implements InvoiceService {

	@Autowired
	@Qualifier("invoiceDao")
	private InvoiceDAO invoiceDao;

	@Override
	public List<Invoice> getAllInvoices() {
		return invoiceDao.getAllInvoices();
	}

	@Override
	public List<Invoice> getAllInvoices(int Uid) {
		List<Invoice> invoices = null;
		try {
			invoices = invoiceDao.getAllInvoices(Uid);
		} catch (Exception e) {
			invoices = null;
		}

		return invoices;
	}

	@Override
	public void create(Invoice invoice) {
		// TODO Auto-generated method stub
		invoiceDao.create(invoice);
	}

	@Override
	public void update(Invoice invoice) {
		// TODO Auto-generated method stub
		invoiceDao.update(invoice);
	}

	@Override
	public Invoice getById(int id) {
		return invoiceDao.findById(id);
	}

	@Override
	public List<Invoice> getAllInvoicesByMonth(Date date) {

		return invoiceDao.getAllInvoicesByMonth(date);
	}

	public Map<String, List<Invoice>> getInvoicesGroupbyMonth() {
		return invoiceDao.getInvoicesGroupbyMonth();
	}

	public List<Date> getAllDayMonth() {
		return invoiceDao.getAllDayMonth();
	}
}
