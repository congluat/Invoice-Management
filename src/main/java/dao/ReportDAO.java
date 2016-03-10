package dao;


import java.util.List;

import model.Invoice;

public interface ReportDAO {
	// get list invoice by Category and before month
	public List<Invoice> getInvoiceByCateandMonths(Integer cateId, int nofMonth);

	/**
	 * 
	 * @param month
	 * @param year
	 * @return List of Object[]; Object[0] = category.name; Object[1]=money used in that category  in month-year;
	 * @author Luat
	 */
	public List<Object[]> getCategoryByMonth(int month, int year);

	// get list invoice by category and d2d
	public List<Invoice> getInvoiceD2D(Integer cateId, String startdate, String endate);
	
	//get data report every Month group by category
	public List<Object[]> getReportDataEveryMonth();
	
	//get data report by month and year
	public List<Object[]> getReportDataByMonth(int month, int year);
	
	//get data report by year
	public List<Object[]> getReportDataByYear(int year);

	/**
	 * @param month
	 * @param year
	 * @return List of Object[]; Object[0] = day; Object[1]=money used in that day in month-year;
	 * @author Luat
	 */
	public List<Object[]> getMoneyUsePerDay(int month, int year);
	
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
