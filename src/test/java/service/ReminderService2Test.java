package service;

import java.util.ArrayList;
import java.util.List;

import model.Category;
import model.Reminder;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.times;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.ArgumentCaptor;
import org.mockito.Captor;
import org.mockito.Mockito;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.ui.ModelMap;

import dao.ReminderDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:/servlet-context.xml"})
public class ReminderService2Test {
	ReminderService reminService;
	
	ReminderDAO reminDao = Mockito.mock(ReminderDAO.class);
	
	List<Reminder> listReminder = new ArrayList<Reminder>();
	@Captor
    ArgumentCaptor<Reminder> captor;
	
	@Test
	public void TestInsert_Success(){
		reminService = new ReminderServiceImpl(reminDao);
		
		Reminder reminder = new Reminder();
		Category cate = new Category();
		cate.setId(1);
		reminder.setCategory(cate);
		
		Mockito.when(reminDao.getByCategory(Mockito.anyInt())).thenReturn(null);
		ModelMap model = Mockito.mock(ModelMap.class);
		//reminService.create(reminder, model);
		
		Mockito.verify(model).addAttribute("message", "Insert Success!");
	}
	
	@Test
	public void TestInsert_Fail(){
		reminService = new ReminderServiceImpl(reminDao);
		
		Reminder reminder = new Reminder();
		Category cate = new Category();
		cate.setId(1);
		reminder.setCategory(cate);
		
		Mockito.when(reminDao.getByCategory(Mockito.anyInt())).thenReturn(reminder);
		ModelMap model = Mockito.mock(ModelMap.class);
		//reminService.create(reminder, model);
		
		Mockito.verify(model).addAttribute("message", "Reminder has Exist!");
	}
	
	
	@Test
	public void UpdateTest_success() throws Exception{
		reminService = new ReminderServiceImpl(reminDao);
		
		listReminder.add(new Reminder());
		listReminder.add(new Reminder());
		
		Reminder remintest = listReminder.get(0);
		remintest.setTime(10);
		
		Mockito.doNothing().when(reminDao).update(remintest);

		reminService.update(remintest);
	}
	
	@Test
	public void TestGetAllReminder_Success(){
		reminService = new ReminderServiceImpl(reminDao);
		Mockito.when(reminDao.getAll()).thenReturn(listReminder);
		Assert.assertEquals(reminService.getAll(), listReminder);
		verify(reminDao, times(1)).getAll();
	}
	
	@Test
	public void TestGetReminderByDate_Success(){
		reminService = new ReminderServiceImpl(reminDao);
		Mockito.when(reminDao.getByDay(Mockito.anyInt())).thenReturn(listReminder);
		Assert.assertEquals(reminService.getByDay(), listReminder);
	}
	
	@Test
	public void TestGetReminderById(){
		reminService = new ReminderServiceImpl(reminDao);
		Reminder reminnew = new Reminder();
		reminnew.setId(5);
		Mockito.when(reminDao.getById(5)).thenReturn(reminnew);
		Assert.assertEquals(reminService.getById(5), reminnew);
	}
	
	
}
