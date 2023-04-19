package com.group3.tofu.photo.service;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.ResourceUtils;

import com.group3.tofu.photo.model.Photo;
import com.group3.tofu.photo.model.PhotoDao;

public class PhotoService {
	
	@Autowired
	private PhotoDao pDao ;
	
	private void insertPhotoIntoDB() {
		
		try {
			File file = ResourceUtils.getFile("classpath:C:\\Users\\Student\\Desktop\\Product_Photo");
			
			File[] allPhoto = file.listFiles();
			
			for(File photo : allPhoto) {
				Integer pID = Integer.valueOf(photo.getName().substring(0,photo.getName().indexOf("."))) ;
				BufferedInputStream bis = new BufferedInputStream(new FileInputStream(photo)) ;
				byte[] photoContent = bis.readAllBytes() ;
				bis.close();
				
				Photo p = pDao.findById(pID).get();
				p.setPhoto(photoContent);
				pDao.save(p) ;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
			
	}
	
}
