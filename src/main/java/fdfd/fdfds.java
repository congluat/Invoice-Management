package fdfd;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import dao.StudentDao;

@ContextConfiguration(locations = {"classpath:/WEB-INF/servlet-context.xml"})
public class fdfds {
	
	@Autowired
	@Qualifier("studentDao")
	static StudentDao dao;
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		dao.test();
		
	}

}
