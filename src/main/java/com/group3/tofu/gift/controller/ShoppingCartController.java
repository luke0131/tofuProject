package com.group3.tofu.gift.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group3.tofu.gift.model.bean.ShoppingCart;
import com.group3.tofu.gift.service.ShoppingCartService;

@Controller
public class ShoppingCartController {
	@Autowired
	private ShoppingCartService spcService;
	
	
	@GetMapping("/showCart")
	public String showCart(Model model) {
		List<ShoppingCart> carts = spcService.findByCustomerId(2);
		model.addAttribute("carts",carts);
		for (ShoppingCart cart : carts) {	
			System.out.println("Cus id = " + cart.getF_cID());
			System.out.println("Gif id = " + cart.getGift().getId());
			System.out.println("Gif name  = " + cart.getGift().getName());
		}
		
		return "gift/showCart";
	}
	
	@GetMapping("/remove")
	public String remove(@RequestParam("id")Integer id) {
		
		List<ShoppingCart> carts = spcService.findByCustomerId(2);
		for (ShoppingCart cart : carts) {
			if(cart.getGift().getId() == id) {
				//System.out.println("cart id = " + cart.getId());
				spcService.remove(cart.getId());
			}
		}
		
		return "redirect:/showCart";
	}
}
