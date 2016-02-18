package service;

import java.util.List;

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

}
