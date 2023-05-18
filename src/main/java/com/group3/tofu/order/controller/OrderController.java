package com.group3.tofu.order.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group3.tofu.customer.model.Customer;
import com.group3.tofu.customer.service.CustomerService;
import com.group3.tofu.gift.model.bean.ShoppingCart;
import com.group3.tofu.gift.service.ShoppingCartService;
import com.group3.tofu.order.model.bean.Order;
import com.group3.tofu.order.model.bean.OrderDetail;
import com.group3.tofu.order.service.OrderDetailService;
import com.group3.tofu.order.service.OrderService;
import com.group3.tofu.product.model.Product;
import com.group3.tofu.product.service.ProductService;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private OrderDetailService odService;
	
	@Autowired
	private ShoppingCartService spcService;
	
	@Autowired
	private CustomerService cService;
	
	@Autowired
	private ProductService pService;
	
	@GetMapping("order/findAll")
	public String findCustomerOrder(@RequestParam(name = "p",defaultValue = "1") Integer pageNumber,Model model) {
		
		String str = "findAll";
		
		Page<Order> page = orderService.findByPage(pageNumber);
		model.addAttribute("page",page);
		model.addAttribute("str", str);
		
		return "mgm/order/showOrder" ;
	}
	
	@GetMapping("order/removeOrder")
	public String removeOrder(@RequestParam(name = "id")Integer id) {
		
		orderService.removeOrder(id);
		
		return "redirect:/order/findAll";
	}
	
	@GetMapping("order/updateStatus")
	public String updateStatus(@RequestParam(name = "id")Integer id,
							   @RequestParam(name = "source")String source) {
		System.out.println("comefrom = " + source);
		System.out.println("**************************************************");
		Order order = orderService.findbyId(id);
		order.setOrder_status("訂單取消");
		orderService.insertOrder(order);
		if(source.equals("findAll")) {
			return "redirect:/order/findAll";			
		}
		return "redirect:/order/findStatus";
	}
	
	
	@GetMapping("order/showDetail")
	public String showDetail(@RequestParam(name = "id")Integer orderid,Model model) {
		
		Order order = orderService.findbyId(orderid);
		Integer customerId = order.getF_customer_id();
		
		Customer customer = cService.findCustomerById(customerId);
		List<OrderDetail> orderDetails = order.getOrderDetails();
		
		Integer product_id = order.getF_product_id();
		Product product = pService.findById(product_id);
		
		model.addAttribute("customer",customer);
		model.addAttribute("order",order);
		model.addAttribute("orderDetails",orderDetails);
		model.addAttribute("product",product);

		return "mgm/order/showDetail";
	}
	
	@GetMapping("order/showModify")
	public String showModify(@RequestParam(name = "id")Integer orderid,Model model) {
		Order order = orderService.findbyId(orderid);
		Integer customerId = order.getF_customer_id();
		
		Customer customer = cService.findCustomerById(customerId);
		
		model.addAttribute("customer",customer);
		model.addAttribute("order",order);
		
		return "mgm/order/modifyOrder";
	}
	@GetMapping("order/updateOrder")
	public String updateOrder(@RequestParam(name = "id")Integer orderid,
							  @RequestParam(name = "shipment")String shipment,
							  @RequestParam(name = "payment")String payment,
							  @RequestParam(name = "status")String status,
							  @RequestParam(name = "address")String address,Model model) {

		Order order = orderService.findbyId(orderid);
		
		order.setShip_status(shipment);
		order.setPayment(payment);
		order.setShip_address(address);
		order.setOrder_status(status);
		orderService.insertOrder(order);
		

		return "redirect:/order/findAll";
	}
	
	@GetMapping("order/findByPayment")
	public String findByPayment(@RequestParam(name = "p",defaultValue = "1") Integer pageNumber,Model model) {
		
		List<Order> orders = orderService.findByPayment("未付款");
		
		int pages=pageNumber-1;
		int count=2;
		int totalpage = 0;
		if (orders.size()%count == 0) {
			totalpage = orders.size()/count;
		}else {
			totalpage = orders.size()/count +1;
		}
		int start = (0+pages)*count;
		int end=count*(pages+1);
		
		List<Order> subList = orders.subList(start, end);
		model.addAttribute("page",subList);
		model.addAttribute("totalpage",totalpage);
		
		return "order/showOrder";
	}
	
	@GetMapping("order/checkout")
	public String checkout(HttpSession session) {
		
		Customer customer = (Customer)session.getAttribute("loggedInCustomer");
		Integer customerId= customer.getCustomer_id();

		
		Order newOrder = new Order();
		newOrder.setF_customer_id(customerId);
		newOrder.setShip_address(customer.getAddress());
		
		Order saved = orderService.insertOrder(newOrder);
		
		List<ShoppingCart> carts = spcService.findByCustomerId(customerId);
		
		for (ShoppingCart c : carts) {
			OrderDetail od = new OrderDetail();
			od.setGid(c.getGift().getId());
			od.setPrice(c.getGift().getPrice());
			od.setQty(c.getQty());
			od.setName(c.getGift().getName());
			od.setOrder(saved);

			
			odService.save(od);
		}
		
		return "order/showDetail";
	}

	//ECPAY
	@ResponseBody
	@GetMapping("order/ecpay")
	public String ECPay(@RequestParam(name = "id") Integer id) {
		Order order = orderService.findbyId(id);
		List<OrderDetail> details = order.getOrderDetails();
		//商品名稱組合字串
		String str = "";
		//商品金額相加
		Integer sum = 0;
		
		for (OrderDetail d : details) {
			str += d.getName()+"x"+d.getQty()+"#";
			sum += d.getPrice()*d.getQty();
		}
		
		//Add car name/price to ecpay
		Product car = pService.findById(1);
		str += car.getProductModel();
		sum += 78900;

		//JavaMail send mail to customer
		String mailStr = "<table><thead><tr><th>商品</th><th>數量</th><th>價錢</th></tr></thead><tbody>";
		for (OrderDetail d : details) {
			mailStr+="<tr><td>"+d.getName()+"</td><td>"+d.getQty()+"</td><td>"+d.getPrice()+"</td></tr>";			
		}
		mailStr+="<tr><td>"+car.getProductModel()+"</td><td>1</td><td>78900</td></tr>";	
		mailStr+="</tbody></table><br><span>總價:"+sum+"</span>";
		orderService.mailOrder(mailStr);
		
		
		
		//綠界方法
		AllInOne allInOne = new AllInOne("");
		AioCheckOutALL aioCheckOutALL = new AioCheckOutALL();
		
		//產生UUID
		String uuid = UUID.randomUUID().toString();
		uuid = uuid.replace("-", "A").substring(0, 20);

	
		aioCheckOutALL.setMerchantTradeNo(uuid);
		
		
		aioCheckOutALL.setItemName(str);
		aioCheckOutALL.setMerchantMemberID("ec0001");
		aioCheckOutALL.setTotalAmount(sum.toString());
		
		aioCheckOutALL.setBidingCard("1");
		aioCheckOutALL.setMerchantID("2000132");
		aioCheckOutALL.setMerchantTradeDate("2023/05/28 08:00:00");
		aioCheckOutALL.setTradeDesc("這裡是商品描述");
		//綠界交易完成導向網址
		aioCheckOutALL.setReturnURL("http://localhost:8080/tofu/");
		aioCheckOutALL.setClientBackURL("http://localhost:8080/tofu/");
		
		
		return allInOne.aioCheckOut(aioCheckOutALL, null);
	}
	
	//訂單生成功能
	@GetMapping("order/test")
	public String insert(HttpSession session,Model model) {
		
		Customer customer = (Customer)session.getAttribute("loggedInCustomer");
		Integer customerId= customer.getCustomer_id();
		
		Product product = pService.findById(1);
		
		Order newOrder = new Order();
		newOrder.setF_customer_id(customerId);
		newOrder.setShip_address(customer.getAddress());
		newOrder.setF_employee_id((int)(Math.random()*10+1));
		newOrder.setF_product_id(1);
		newOrder.setPayment("已付款");
		
		Order saved = orderService.insertOrder(newOrder);
		saved.setOrder_number("ORD000"+saved.getId());
		List<ShoppingCart> carts = spcService.findByCustomerId(customerId);
		
		List<OrderDetail> odList = new ArrayList<>();
		
		for (ShoppingCart c : carts) {
			OrderDetail od = new OrderDetail();
			od.setGid(c.getGift().getId());
			od.setPrice(c.getGift().getPrice());
			od.setQty(c.getQty());
			od.setName(c.getGift().getName());
			od.setOrder(saved);
			
			OrderDetail savedOd = odService.save(od);
			odList.add(savedOd);
		}
		
		model.addAttribute("customer",customer);
		model.addAttribute("order",saved);
		model.addAttribute("orderDetails",odList);
		model.addAttribute("product", product);
		
		return "order/showDetail";
	}
	
	
	
	@GetMapping("order/findStatus")
	public String findByShipment(@RequestParam(name = "p",defaultValue = "1") Integer pageNumber,Model model) {
		Page<Order> page = orderService.findByShipment2(pageNumber,"已送達");
		System.out.println("TotalPages :"+page.getTotalPages() );
		System.out.println("now :"+page.getNumber() );
		
		List<Order> orders = page.getContent();
		
		for (Order order : orders) {
			System.out.println(order.getId());
		}
		System.out.println("****************");
		String str = "findStatus";
		
		model.addAttribute("page", page);
		model.addAttribute("str", str);
		
		return "mgm/order/showOrder";
	}
	
	@ResponseBody
	@GetMapping("/order/findAllOrders")
	public List<Order> findAllOrders(@RequestParam(name = "p",defaultValue = "1") Integer pageNumber) {
		
		
		return orderService.findByPage(pageNumber).getContent();
	}
	@ResponseBody
	@GetMapping("/order/findAllOrderByPage")
	public Page<Order> findAllOrderByPage(@RequestParam(name = "p",defaultValue = "1") Integer pageNumber) {
		Page<Order> page = orderService.findByPage(pageNumber);
		
		return page;
	}
	
	@GetMapping("/order/showByAjax")
	public String showByAjax() {
		
		return "mgm/order/showOrder2";
	}
	@ResponseBody
	@GetMapping("/order/cancel/{id}")
	public Order cancelOrder(@PathVariable(name = "id")Integer id) {
		
		Order order = orderService.findbyId(id);
		order.setOrder_status("訂單取消");
		orderService.insertOrder(order);
		
		return order;
	}
	
	@GetMapping("/order/findByOption")
	public String findByOption(@RequestParam(name = "payment",required = false)String payment,
			  					  @RequestParam(name = "shipment",required = false)String shipment,
			  					  @RequestParam(name = "status",required = false)String status,
			  					  @RequestParam(name = "p",defaultValue = "1") Integer pageNumber,Model model) {
		Integer start = (pageNumber-1)*10;
		
		if(payment!=null) {
			if(payment.equals("")) {
				payment=null;
			}
		}
		if(shipment!=null) {
			if(shipment.equals("")) {
				shipment=null;
			}
		}
		if(status!=null) {
			if(status.equals("")) {
				status=null;
			}
		}
		System.out.println("*************************************");
		System.out.println("payment = " + payment);
		System.out.println("shipment = " + shipment);
		System.out.println("status = " + status);
			
		if(payment==null && shipment==null && status==null) {
			return "redirect:/order/findAll";
		}
		List<Order> orders = orderService.findByOption(payment, shipment, status,start);
		for (Order order : orders) {
			System.out.println(order.toString());
		}
		int count = orderService.findTotalCount(payment, shipment, status);
		int totalPage=0;
		if (count%10==0) {
			totalPage=count/10;
		}else {
			totalPage=count/10+1;
		}
		System.out.println("totalCount = " + count);
		System.out.println("totalPage = " + totalPage);

		
		model.addAttribute("orders",orders);
		model.addAttribute("totalPage",totalPage);
		model.addAttribute("payment",payment);
		model.addAttribute("shipment",shipment);
		model.addAttribute("status",status);
		
		return "mgm/order/showOrderQuery";
	}
	
	
}
