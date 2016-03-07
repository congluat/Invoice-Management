package service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import model.Invoice;
import model.Photo;

public interface PhotoService {
	/*public void create(Photo photo);*/
	public Photo findById(Integer id);
	public void delete(Photo photo);
	public void savePhoto(Map<String, MultipartFile> map,Invoice invoice);
}
