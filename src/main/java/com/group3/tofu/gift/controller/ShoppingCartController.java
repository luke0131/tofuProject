package com.group3.tofu.gift.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group3.tofu.customer.model.Customer;
import com.group3.tofu.gift.model.bean.CartDTO;
import com.group3.tofu.gift.model.bean.Gift;
import com.group3.tofu.gift.model.bean.ShoppingCart;
import com.group3.tofu.gift.service.GiftService;
import com.group3.tofu.gift.service.ShoppingCartService;
import com.group3.tofu.order.service.OrderDetailService;
import com.group3.tofu.order.service.OrderService;
import com.group3.tofu.photo.model.Photo;
import com.group3.tofu.photo.model.PhotoDao;
import com.group3.tofu.product.model.Product;
import com.group3.tofu.product.service.ProductService;

@Controller
public class ShoppingCartController {
	@Autowired
	private ShoppingCartService spcService;
	
	@Autowired
	private GiftService gService;
	
	@Autowired
	private OrderService oService;
	
	@Autowired
	private OrderDetailService odService;
	
	@Autowired
	private ProductService pService;
	
	@Autowired
	private PhotoDao pDAO;
	
	@GetMapping("/showCart")
	public String showCart(Model model,HttpSession session) {
		
		//登入資料存在session,透過session.getAttribute()拿到 f_customer_id
		//get foreign key customer id by session
		Customer customer = (Customer)session.getAttribute("loggedInCustomer");
		
		//檢查是否登入沒有導到登入畫面
		if (customer == null) {
			model.addAttribute("message", "請先登入會員");
			return "customer/login";
		}
		
		Integer customerId= customer.getCustomer_id();
		
		
		//Toyota Corolla Altis For Demo Only
		Product product = pService.findById(1);
		
		List<ShoppingCart> carts = spcService.findByCustomerId(customerId);
		model.addAttribute("carts",carts);
		model.addAttribute("product",product);
		
		return "gift/showCart";
	}
	
	@GetMapping("/showCarPhoto/{id}")
	public ResponseEntity<byte[]> findProductPhotoById(@PathVariable Integer id) {
		Photo carPhoto = pDAO.findById(1).get();
		byte[] photo = carPhoto.getPhoto();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);
		
		return new ResponseEntity<byte[]>(photo, headers, HttpStatus.OK);
	}
	
	@GetMapping("/remove")
	public String remove(@RequestParam("id")Integer id,HttpSession session) {
		
		//登入資料存在session,透過session.getAttribute()拿到 f_customer_id
		//get foreign key customer id by session
		
		Customer customer = (Customer)session.getAttribute("loggedInCustomer");
		Integer customerId= customer.getCustomer_id();
		
		List<ShoppingCart> carts = spcService.findByCustomerId(customerId);
		for (ShoppingCart cart : carts) {
			if(cart.getGift().getId() == id) {
				//System.out.println("cart id = " + cart.getId());
				spcService.remove(cart.getId());
			}
		}
		
		return "redirect:/showCart";
	}

	@ResponseBody
	@PostMapping("/modifyUnit")
	public String modifyGiftUnit(@RequestBody CartDTO dto,HttpSession session) {
		
		Customer customer = (Customer)session.getAttribute("loggedInCustomer");
		Integer customerId= customer.getCustomer_id();
		
		List<ShoppingCart> carts = spcService.findByCustomerId(customerId);
		for (ShoppingCart cart : carts) {
			if(cart.getGift().getId() == dto.getGiftid()) {
				cart.setQty(dto.getQty());
				spcService.save(cart);
			}
		}
		
		
		return "success";
	}
	
	@ResponseBody
	@PostMapping("/add")
	public String addToCart(@RequestBody CartDTO dto,HttpSession session) {
		
		Customer customer = (Customer)session.getAttribute("loggedInCustomer");
		Integer customerId= customer.getCustomer_id();
		
		JSONObject responseJson = new JSONObject();

		Integer giftId= dto.getGiftid();
		Integer qty= dto.getQty();

		boolean isExist = spcService.exist(customerId,giftId,qty);
		
		if(isExist) {
			responseJson.put("message", "產品已經存在購物車");
			responseJson.put("success", false);
		} else {
			Gift gift = gService.findById(giftId);
			
			ShoppingCart newCart = new ShoppingCart(customerId,gift,qty);
			spcService.save(newCart);
			
//			responseJson.put("message", "資料新增成功");
//			responseJson.put("success", true);
			
		}
		
		return responseJson.toString();
	}
	
	
}
