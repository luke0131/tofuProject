package com.group3.tofu.product.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.group3.tofu.product.model.Product;
import com.group3.tofu.product.model.ProductDao;
import com.group3.tofu.product.service.ProductService;



@Controller
public class ProductController {
	
	@Autowired
	private ProductService pService ;
	
	@Autowired
	private ProductDao productDAO;
	
	@GetMapping("/product/all")
	public String findAllProduct(Model model) {

		List<Product> productList = pService.findAllProduct();

		model.addAttribute("productList", productList);

		return "product/allProduct";
	}
	
	@GetMapping("/product/pSelect")
	public String selectAllProduct(Model model) {

		List<Product> selectList = pService.findAllProduct();

		model.addAttribute("selectList", selectList);

		return "product/productSelect";
	}
	
	@GetMapping("/product/findProduct")
	public Product findProductById(@RequestParam("productId") Integer productId) {
		Optional<Product> op = productDAO.findById(productId) ;
		
		if(op.isPresent()) {
			return op.get();
		}
		
		return null;
	}
	
//	@GetMapping("/product/test")
//	@ResponseBody
//    public List<Product> selectProduct(@RequestParam(value = "brand", required = false) List<String> brand,
//    									@RequestParam(value = "category", required = false) List<String> category,
//    									@RequestParam(value = "engineType", required = false) List<String> engineType) {
//		
//		if (brand == null && category == null && engineType == null) {
//            return pService.findAllProduct();
//        }else {
//        	return pService.getProductsByCategories(brand,category,engineType);
//        }
//        
//		
//    }
	
	
	
}
