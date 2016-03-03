package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;


import dao.PhotoDAO;

import model.Photo;

public class PhotoServiceImpl implements PhotoService{

	@Autowired
	@Qualifier("photoDao")
	private PhotoDAO dao;
	
	@Override
	public void create(Photo photo) {
		dao.saveFile(photo);
	}

	@Override
	public Photo findById(Integer id) {	
		return dao.getById(id);
	}

	@Override
	public void delete(Photo photo) {
		dao.deleteFile(photo);	
	}
	
}
