package service;

import java.util.List;

import model.Invoice;

public interface ReportService {
	// get list invoice by category and months before
	public List<Invoice> getInoiveByCateMonths(Integer cateId, int nofMonth);

	// get list invoice by category and from date to date
	public List<Invoice> getInvoiceD2D(Integer cateId, String startdate, String endate);
	
	//get list invoice by cateName and time follow month
	public List<Invoice> getReportDetail(String cateName, String time);
	
	//get list invoice by cateName and time follow date to date
	public List<Invoice> getReportDetaild2d(String cateName, String fromdate, String todate);
		
	//get list invoice by cateName and date
	public List<Invoice> getReportDetailByDate(String cateName, String selectdate);
	
	public List<Invoice> getReportInfo(String cateName, String month);
	
	//get list report with all category every month in current year
	public List<Object[]> getReportDataEveryMonth();
	
	
	//get data report follow date
	public List<Object[]> getReportDataByDate(String selectdate);
	
	public List<Object[]> getMoneyUsePerDay(int month, int year);
	
	//get list data report with all category by select month
	public List<Object[]> getReportDataByMonth(String selectdate);
	
	//get list data report with all category by select year
	public List<Object[]> getReportDataByYear(int year);
	
	//get list data report with all category by date to date
	public List<Object[]> getReportDataByd2d(String fromdate, String todate);
	
	/**
	 * 
	 * @param month
	 * @param year
	 * @return List of Object[]; Object[0] = category.name; Object[1]=money used in that category  in month-year;
	 * @author Luat
	 */
	public List<Object[]> getCategoryByMonth(int month, int year);
	
	/**
	 * @param month
	 * @param year
	 * @return List of Object[]; Object[0] = day; Object[1]=money used in that day in month-year;
	 * @author Luat
	 */
	
	
	/**
	 * @param year
	 * @return List of Object[]; Object[0] = category.name; Object[1] = money use in that category in year.
	 * @author Luat
	 */
	public List<Object[]> getMoneyUseInCategoryByYear(int year);
	
	/** 
	 * @param year
	 * @return List of Object[]; Object[0] = month; Object[1] = money use in that category in year.
	 * @author Luat
	 */
	public List<Object[]> getMoneyUseEachMonthInYear(int year);

}
