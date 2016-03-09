package dao;

import java.util.List;

import model.Photo;

public interface PhotoDAO {
	public void saveFile(Photo photo);
	public void deleteFile(Photo photo);
	public Photo getById(Integer id);
	public List<String> getAllPhotos();
}
