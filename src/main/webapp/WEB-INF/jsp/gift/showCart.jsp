<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>
	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="../layout/navbar.jsp" />



<section class="h-100 h-custom">
  <div class="container h-100 py-5">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col">

        <div class="table-responsive">
          <table class="table">
            <thead>
              <tr>
                <th scope="col" class="h5">Shopping Cart</th>
                <th scope="col">Product Name</th>
                <th scope="col">Quantity</th>
                <th scope="col">Unit Price</th>
                <th scope="col">Price</th>
                <th scope="col">Remove</th>
              </tr>
            </thead>
            <tbody>
            
      		<c:forEach items="${carts}" var="carts">
              <tr>
                <th scope="row">
                  <div class="d-flex align-items-center">
                    <img src="${contextRoot}/tofu/showGift/${carts.gift.id}" class="img-fluid rounded-3"
                      style="width: 120px; height: 100px;" alt="Book">
                    <div class="flex-column ms-4">
                      <p class="mb-2">Thinking, Fast and Slow</p>
                      <p class="mb-0">Daniel Kahneman</p>
                    </div>
                  </div>
                </th>
                <td class="align-middle">
                  	<p class="mb-0" style="font-weight: 500;">${carts.gift.name}</p>
                </td>
                <td class="align-middle">
                    <input id="${carts.gift.id}" min="1" name="quantity" value="${carts.qty}" type="number" class="form-control form-control-sm number" style="width: 50px;" />
                </td>
                <td class="align-middle">
                  	<p class="mb-0 price" style="font-weight: 500;">${carts.gift.price}</p>
                </td>
                <td class="align-middle">
                  <span class="s_price"></span>
              </td>
                 <td class="align-middle">
                  	<p class="mb-0" style="font-weight: 500;">
                  	<a href="http://localhost:8080/tofu/remove?id=${carts.gift.id}">
                      <button class="btn btn-danger"><i class="fa-solid fa-trash" style="font-size:24px;"></i> Remove</button>
                  	</a>
                  </p>
                </td>
              </tr>
           </c:forEach>   
            </tbody>
          </table>
          
          
        </div>

      </div>
    </div>
  </div>


  
</section>



              <div class="col-lg-4 col-xl-3" style="margin-left: 300px;">
                <div class="d-flex justify-content-between" style="font-weight: 500;">
                  <p class="mb-2">Subtotal</p>
                  <p class="mb-2 total">$23.49</p>
                </div>

                <div class="d-flex justify-content-between" style="font-weight: 500;">
                  <p class="mb-0">Tax</p>
                  <p class="mb-0 tax">$60</p>
                </div>

                <hr class="my-4">

                <div class="d-flex justify-content-between mb-4" style="font-weight: 500;">
                  <p class="mb-2">Total (tax included)</p>
                  <p class="mb-2 final_price">$26.48</p>
                </div>

                <button type="button" class="btn btn-warning btn-block btn-lg">
                  <div class="d-flex justify-content-between">
                    <span><a href="http://localhost:8080/tofu/showGift" style="text-decoration: none; color: black;"><i class="fa-solid fa-reply" style="font-size: 24px;"></i>Back Shopping</a></span> 
                  </div>
                </button>

                <a href="http://localhost:8080/tofu/order/test">
                  <button type="button" class="btn btn-primary btn-block btn-lg">
                  <div class="d-flex justify-content-between">
                    <span>Checkout</span>
                  </div>
                  </button>
                </a>

              </div>


	
	<script>
    
    let total = 0;

    $('.s_price').each(function(){
      p = $(this).closest("tr").find('.price').text();
      q = $(this).closest("tr").find('.number').val();
      sum = p*q;

      // console.log(p);
      // console.log(q);
      // console.log(sum);
      
      $(this).text(sum);
      
      total += Number($(this).text());
    });
    console.log(total);
    $('.total').text("$" + total);
    $('.tax').text("$" + total*0.1);
    $('.final_price').text("$" + Math.floor(total*1.1));

    $('.number').on("change keyup", function(){
            console.log("id = " + $(this).attr('id'));
            
            let ProductRow=$(this).closest("tr");
            console.log(ProductRow);

            let price=ProductRow.find('.price').text();
            console.log(price);

            let qty=$(this).val();
            console.log($(this).val());

            let s_price=price*qty;
            console.log(s_price);
            ProductRow.find('.s_price').text(s_price);

            let total = 0;
            $('.s_price').each(function(){
              total += Number($(this).text());
            });
            console.log(total);
            $('.total').text("$" + total);
            $('.tax').text("$" + total*0.1);
            $('.final_price').text("$" + Math.floor(total*1.1));

            id = $(this).attr('id');
            console.log("id = " + $(this).attr('id') );
            let requestBody={
              "giftid":id,
              "qty":qty
              };
            console.log("requestBody = " ,requestBody );
            axios.post("http://localhost:8080/tofu/modifyUnit",requestBody).then(function(response){
              console.log("response",response);
            }).catch().finally();
            });



  </script>
	
	
	<jsp:include page="../layout/footer.jsp" />
</body>
</html>