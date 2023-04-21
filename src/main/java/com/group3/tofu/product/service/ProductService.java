package com.group3.tofu.product.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
	public Page<Product> findByPage(Integer pageNumber){
		PageRequest pgb = PageRequest.of(pageNumber-1, 3, Sort.Direction.DESC, "added");
		
		Page<Product> page = productDAO.findAll(pgb);
		
		return page;
	}
	
	public byte[] getPetPhotoByID(Integer photoID) {
		Optional<Photo> oPhoto = photoDAO.findById(photoID) ;
		Photo photo = oPhoto.orElse(new Photo());
		return photo.getPhoto();
	}
	
	public void insertProduct(Product pro) {
		productDAO.save(pro);
	}
	
	public void deleteById(Integer id) {
		productDAO.deleteById(id);
	}
	
	public Product findById(Integer id) {
		Optional<Product> op = productDAO.findById(id);
		
		if(op.isPresent()) {
			return op.get();
		}		
		return null;
	}
	
	public List<Product> findAllProduct(){
		return productDAO.findAll();
	}
	
	@Transactional
	public Product updateProductById(Integer id, String newProduct) {
		
		Optional<Product> option = productDAO.findById(id);
		
		if(option.isPresent()) {
			Product product = option.get();
			product.setProductModel(newProduct);
			return product;
		}
		
		return null;
	}
	
}