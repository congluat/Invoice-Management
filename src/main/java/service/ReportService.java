package service;

import java.util.List;

import model.Invoice;

public interface ReportService {
	public List<Invoice> getInoiveByCateMonths(Integer cateId, int nofMonth);
}
