package service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import dao.ReportDAO;
import model.Invoice;

public class ReportServiceImpl implements ReportService {

	@Autowired
	@Qualifier("reportDao")
	ReportDAO reportDao;

	@Override
	public List<Invoice> getInoiveByCateMonths(Integer cateId, int nofMonth) {
		return reportDao.getInvoiceByCateandMonths(cateId, nofMonth);
	}

	@Override
	public List<Invoice> getInvoiceD2D(Integer cateId, String startdate, String endate) {
		return reportDao.getInvoiceD2D(cateId, startdate, endate);
	}

	public List<Object[]> getCategoryByMonth(int month, int year) {
		return reportDao.getCategoryByMonth(month, year);
	}

	@Override
	public List<Object[]> getMoneyUsePerDay(int month, int year) {
		List<Object[]> list = reportDao.getMoneyUsePerDay(month, year);
		List<Object[]> result = new ArrayList<>();
		for (Object[] object : list) {
			object[0] = object[0].toString();

		}
		return list;
	}

	@Override
	public List getReportDataEveryMonth() {
		return reportDao.getReportDataEveryMonth();
	}

	@Override
	public List<Object[]> getReportDataByMonth(int month, int year) {
		return reportDao.getReportDataByMonth(month, year);
	}

	@Override
	public List<Object[]> getReportDataByYear(int year) {
		return reportDao.getReportDataByYear(year);
	}

	@Override
	public List<Object[]> getMoneyUseInCategoryByYear(int year) {
		return reportDao.getMoneyUseInCategoryByYear(year);
	}

	@Override
	public List<Object[]> getMoneyUseEachMonthInYear(int year) {
		List<Object[]> list = reportDao.getMoneyUseEachMonthInYear(year);
		List<Object[]> result = new ArrayList<>();
		for (Object[] object : list) {
			object[0] = object[0].toString();
		}
		return list;
	}
}
