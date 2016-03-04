package service;

import java.util.List;

import model.Invoice;
import model.Photo;

public interface PhotoService {
	public void create(Photo photo);
	public Photo findById(Integer id);
	public void delete(Photo photo);
	
}
