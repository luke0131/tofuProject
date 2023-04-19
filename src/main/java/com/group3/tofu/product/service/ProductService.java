package com.group3.tofu.product.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.group3.tofu.photo.model.Photo;
import com.group3.tofu.photo.model.PhotoDao;
import com.group3.tofu.product.model.Product;
import com.group3.tofu.product.model.ProductDao;


@Service
public class ProductService {
	
	@Autowired
	private ProductDao productDAO;
	
	@Autowired
	private PhotoDao photoDAO;
	
	public Page<Product> getProductByPage(Integer page, Integer count) {

		Page<Product> pageProduct = productDAO.findAll(PageRequest.of(page - 1, count));

		return pageProduct;
	}
	
	public byte[] getPetPhotoByID(Integer photoID) {
		Optional<Photo> oPhoto = photoDAO.findById(photoID) ;
		Photo photo = oPhoto.orElse(new Photo());
		return photo.getPhoto();
	}
	
}
