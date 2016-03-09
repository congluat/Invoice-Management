package service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

import model.Photo;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:/servlet-context.xml"})
@Transactional
public class PhotoService2Test {
	
	@Autowired
	private PhotoService photoService;

	@Test
	public void findById2Test() {
		
		Photo photo = photoService.findById(1);
		
		assertNotNull(photo);
	}

}
