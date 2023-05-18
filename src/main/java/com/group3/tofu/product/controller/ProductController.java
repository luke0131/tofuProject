package com.group3.tofu.product.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group3.tofu.book.model.Book;
import com.group3.tofu.book.service.BookService;
import com.group3.tofu.customer.model.Customer;
import com.group3.tofu.product.model.Product;
import com.group3.tofu.product.model.ProductDao;
import com.group3.tofu.product.service.ProductService;


@Controller
public class ProductController {
	
	@Autowired
	private ProductService pService ;
	
	@Autowired
	private ProductDao productDAO;
	
	@Autowired
	private BookService bService ;
	
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
	
	@GetMapping("/GetLoggedInCustomerID")
	@ResponseBody
	public Integer getLoggedInCustomerID(HttpSession session) {

		Customer c = (Customer) session.getAttribute("LoggedInCustomer");

		if (c == null) {
			return null;
		}

		return c.getCustomer_id();

	}
	
//	@GetMapping("/product/book")
//    public String showForm(Model model) {
//        model.addAttribute("book", new Book());
//        return "product/book";
//    }
//    
//    @PostMapping("/product/book")
//    public String submitForm(@ModelAttribute("book") Book book) {
//    	bService.saveBook(book);
//        return "redirect:/success";
//    }
	
    @PostMapping("/product/book")
    public String book(@RequestParam("name") String name,
            			@RequestParam("car") String car,
            			@RequestParam("time") String time,
            			Model model,HttpSession session) throws ParseException {
    	
    	Book book = new Book();
    	
//    	Customer customer = (Customer) session.getAttribute("loggedInCustomer");
//    	customer.getCustomer_id();
    	Date date = new SimpleDateFormat("yyyy-MM-dd").parse(time) ;
    	
    	
    	book.setF_customer_id(bService.findCustomerId(name));
    	book.setF_employee_id(null);
    	book.setF_product_id(pService.findProductId(car));
    	book.setStatus("Waiting");
    	book.setBook_date(date);
    	
    	bService.saveBook(book);
    	
        return "product/toyotaDetail" ;
    }
	
    @GetMapping("/mgm/ProductManagement")
	public String AllProduct(Model model) {

		List<Product> productList = pService.findAllProduct();

		model.addAttribute("productList", productList);

		return "mgm/ProductManagement";
	}
	
}
