package service;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
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
	@Qualifier("photoService")
	private PhotoService photoService;

	@Test
	public void getAllPhoto2Test() {
		List<String> photos = photoService.getAllPhotos();
		assertNotNull(photos);
	}
	
	@Test
	public void deletePhot2Test() {
		Photo photo = Mockito.mock(Photo.class);
		photoService.delete(photo);
		
		
		
		Mockito.validateMockitoUsage();
		
		
	}
	
	

}
