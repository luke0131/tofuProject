package com.group3.tofu.product.controller;

import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.group3.tofu.product.model.Product;
import com.group3.tofu.product.service.ProductAjaxService;



@RestController
//@RequestMapping("/product/test1")
public class ProductAjaxController {
	
	@Autowired
	private ProductAjaxService pService ;
	
	@PostMapping( path = "/product/all",consumes = "application/json")
	public String find(@RequestBody Map<String, List<String>> body ) {		
		
		System.out.println(body);
		
		JSONObject responseJson = new JSONObject();		
		JSONArray array = new JSONArray();
		
		List<Product> products = pService.find(body);
		
		if(products!=null && !products.isEmpty()) {
			for(Product product : products) {
				JSONObject item = new JSONObject()
						.put("productModel", product.getProductModel());

				array = array.put(item);
			}
		}
		responseJson = responseJson.put("datatable", array);
		return responseJson.toString();
	}
	
	@GetMapping("/product/{brand}")
	public String findByBrand(@PathVariable(name = "brand") String brand) {
		JSONObject responseJson = new JSONObject();
		
		JSONArray array = new JSONArray();
		Product product = pService.findByBrand(brand);
		if(product!=null) {
			JSONObject item = new JSONObject()
					.put("id", product.getProductId())
					.put("brand", product.getBrand())
					.put("category", product.getCategory())
					.put("engineType", product.getEngineType())
					.put("productPrice", product.getProductPrice());

			array = array.put(item);
		}
		responseJson = responseJson.put("datatable", array);
		return responseJson.toString();
	}
	
}
