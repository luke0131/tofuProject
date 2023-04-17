package com.group3.tofu.product.service;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;

import com.group3.tofu.product.model.Product;
import com.group3.tofu.product.model.ProductDao;

@Service
public class ProductService {
	
	@Autowired
	private ProductDao pDao ;
	
	private void insertPhotoIntoDB() {
		try {
			File file = ResourceUtils.getFile("");
			
			File[] allPhoto = file.listFiles();
			
			for(File photo : allPhoto) {
				Integer pID = Integer.valueOf(photo.getName().substring(0, photo.getName().indexOf(".")));
				BufferedInputStream bis = new BufferedInputStream(new FileInputStream(photo));
				byte[] photoContent = bis.readAllBytes();
				bis.close();
				
				Product p = pDao.findById(pID).get();
				//p.setphoto(photoContent);
				pDao.save(p);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
