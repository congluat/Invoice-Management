package dao;

import java.util.List;

import model.Invoice;

public interface ReportDAO {

	public List<Invoice> getInvoiceByCateandMonths(Integer cateId, int nofMonth);

	public List<Object[]> getCategoryByMonth(int month, int year);

}
