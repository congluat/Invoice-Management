package service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.multipart.MultipartFile;

import dao.PhotoDAO;
import model.Invoice;
import model.Photo;

public class PhotoServiceImpl implements PhotoService {

	@Autowired
	ServletContext application;

	@Autowired
	@Qualifier("photoDao")
	private PhotoDAO dao;

	@Override
	public Photo findById(Integer id) {
		return dao.getById(id);
	}

	@Override
	public void delete(Photo photo) {
		dao.deleteFile(photo);
	}

	@Override
	public void savePhoto(Map<String, MultipartFile> map, Invoice invoice) {
		Date now = new Date();
		String name = now.toString().replaceAll(" ", "").replaceAll(":", "");
		for (MultipartFile multipartFile : map.values()) {
			try {
				InputStream input = multipartFile.getInputStream();
				if (ImageIO.read(input) == null) {
					throw new IOException();
				}
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			String fileName = name + multipartFile.getOriginalFilename();
			File f = new File(application.getRealPath("/resources/images/"));
			if (f.exists() && f.isDirectory()) {

			} else {
				f.mkdir();
			}
			String path = application.getRealPath("/resources/images/") + fileName;
			if (!fileName.equals(""))
				try {
					multipartFile.transferTo(new File(path));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			Photo photo = new Photo();
			photo.setPhoto(fileName);
			photo.setInvoice(invoice);
			dao.saveFile(photo);
		}
	}

	@Override
	public List<String> getAllPhotos() {
		return dao.getAllPhotos();
	}

}
