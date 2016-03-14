package service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import dao.InvoiceDAO;
import model.Category;
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
	public Boolean create(Invoice invoice) {
		// TODO Auto-generated method stub
		return invoiceDao.create(invoice);
	}

	@Override
	public void update(Invoice invoice) {
		// TODO Auto-generated method stub
		invoiceDao.update(invoice);
	}

	@Override
	public void delete(Invoice invoice) {
		invoiceDao.delete(invoice);
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

	public List<String> getAllDayMonth() {
		return invoiceDao.getAllDayMonth();
	}

	@Override
	public List<Invoice> getTop10IsNotWarning(Category category) {
		return invoiceDao.getTop10IsNotWarning(category);
	}

	@Override
	public double calAverage(Category category) {
		List<Invoice> list = getTop10IsNotWarning(category);
		int listSize = list.size();

		BigDecimal avg = BigDecimal.valueOf(0.0d);
		Iterator it = list.iterator();
		while (it.hasNext()) {
			Invoice invoice = (Invoice) it.next();
			avg = avg.add(invoice.getAmount());
		}
		// chua co invoice nao` trong category nay
		if (listSize == 0) {
			listSize = 1;
		}
		// avg =0 chia cho 1 cũng bang 0
		return Double.parseDouble(avg.divide(BigDecimal.valueOf(listSize), RoundingMode.HALF_UP).toString());
	}

	@Override
	public List<Invoice> getTop10(Category category) {
		return invoiceDao.getTop10(category);
	}
	
	@Override
	public boolean checkIsWarning(BigDecimal amount, Category category) {
		double amountDouble = Double.parseDouble(amount.toString());
		double avg = calAverage(category) * 1.7;
		// la invoice dau` tien trong category
		if (avg == 0) {
			return false;
		}
		// kiem tra invoice
		if (amountDouble > (avg)) { // invoice co the bi canh bao
			List<Invoice> list = invoiceDao.getTop10(category);
			System.out.println(list.size());
			if (list.size() < 10) {
				return true;
			}
			Iterator it = list.iterator();
			while (it.hasNext()) {
				Invoice invoice = (Invoice) it.next();
				if (invoice.getIsWarning() == false) { // xuat hien 1 invoice ko
														// hop le
					// ko phai invoice thu 11 , bat canh bao
					return true;
				}
			}
			// la invoice thu 11 , tat canh bao
			return false;
		}
		// invoice ko bi canh bao
		return false;
	}

	@Override
	public List<Invoice> getInvoiceAttribute(String attribute, String empname, int page) {
		return invoiceDao.getInvoiceAttribute(attribute, empname, page);
	}

	@Override
	public List<Invoice> getAllDangerInvoicesByMonth(Date date) {
		// TODO Auto-generated method stub
		return invoiceDao.getAllDangerInvoicesByMonth(date);
	}

	@Override
	public List<Invoice> searchAnyString(String keyword) {

		return invoiceDao.searchAnyString(keyword);
	}
	
	@Override
	public List<Invoice> sortList(List<Invoice> tmp, String empname, String attribute) {
		List<Invoice> invoices = new ArrayList<Invoice>();
		String[] str = new String[tmp.size()];
		int i = 0;
		for (Invoice t : tmp) {
			if (attribute.equals("Name"))
				str[i] = t.getName();
			if (attribute.equals("Place"))
				str[i] = t.getPlace();
			i++;
		}

		Arrays.sort(str, new Comparator<String>() {

			@Override
			public int compare(String o1, String o2) {

				boolean o1_has_keyWord = o1.indexOf(empname.charAt(0)) == 0 && o1.contains(empname);
				boolean o2_has_keyWord = o2.indexOf(empname.charAt(0)) == 0 && o2.contains(empname);

				if (o1_has_keyWord && o2_has_keyWord) {
					if (o1.length() == o2.length()) {
						if (o1.indexOf(empname.charAt(0)) > o2.indexOf(empname.charAt(0))) {
							return -1;
						} else if (o1.indexOf(empname.charAt(0)) == o2.indexOf(empname.charAt(0))) {
							return 0;
						} else {
							return 1;
						}
					} else if (o1.length() > o2.length()) {
						return 1;
					} else {
						return -1;
					}
				} else if (o1_has_keyWord && !o2_has_keyWord) {
					return -1;
				} else if (!o1_has_keyWord && o2_has_keyWord) {
					return 1;
				}
				return 0;
			}
		});
		for (int j = 0; j < str.length; j++) {
			for (Invoice t : tmp) {
				if (attribute.equals("Name")) {
					if (t.getName().equals(str[j])) {
						invoices.add(t);
						tmp.remove(t);
						break;
					}
				}
				if (attribute.equals("Place")) {
					if (t.getPlace().equals(str[j])) {
						invoices.add(t);
						tmp.remove(t);
						break;
					}
				}
			}
		}
		return invoices;
	}

	@Override
	public void getDataInvoiceAndTemp(List<Invoice> invoices, List<Invoice> invoiceTmp , String attribute ,String empname ,String page) {
		List<Invoice> temp ;
		if (attribute.equals("Name") || attribute.equals("Place")) {
			temp = sortList(getInvoiceAttribute(attribute, empname, Integer.parseInt(page)), empname, attribute);
			invoices.addAll(temp);
			temp = getInvoiceAttribute(attribute, empname, 0);
			invoiceTmp.addAll(temp);
		}
		if (attribute.equals("Amount") || attribute.equals("IsWarning") || attribute.equals("Time")){
			temp = getInvoiceAttribute(attribute, empname, Integer.parseInt(page));
			invoices.addAll(temp);
			temp = getInvoiceAttribute(attribute, empname, 0);
			invoiceTmp.addAll(temp);
		}
	}
}
