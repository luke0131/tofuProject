<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>預約保養</title>
<style>
.t1 {
	float: left;
}

input[type="date"]::-webkit-datetime-edit-day-field:disabled {
	color: #999; /* 顯示為灰色 */
	pointer-events: none;
} /* 禁止點擊 */
</style>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp" />

	<div class="d-flex flex-row ">
		<img src="${contextRoot}/img/mPicture/s992.jpg" alt="Your Image">





		<div class="container">
			<h3 style="text-decoration: underline;">豆腐專業保養</h3>
			<br>
			
			<span for="" class="text-danger">請先選擇愛車品牌型號</span>
			<select style="border: 3px solid dark; border-radius: 5px; padding: 8px;" id="brandSelect" onchange="filterModels()" >
    <option value="">請選擇汽車品牌</option>
    <option value="Toyota">Toyota</option>
    <option value="Honda">Honda</option>
    <option value="Nissan">Nissan</option>
    <option value="Mercedes-Benz">Mercedes-Benz</option>
    <option value="BMW">BMW</option>
    <option value="Mitsubishi">Mitsubishi</option>
    <option value="Mazda">Mazda</option>
    <option value="Lexus">Lexus</option>
    <option value="Audi">Audi</option>
    <option value="Porsche">Porsche</option>
    <option value="Ferrari">Ferrari</option>
    <option value="Volvo">Volvo</option>
    <option value="Mini">Mini</option>
</select>

<!-- 建立汽車型號下拉選單 -->
<select style="border: 3px solid dark; border-radius: 5px; padding: 8px;" id="modelSelect">
    <option value="">請選擇型號</option>
</select>

<br>
<br>

			<h4>選擇預約保修項目</h4>

			<form:form method="post" action="" modelAttribute="maintenanceForm"
				onsubmit="return validateForm()">
				<nav>
					<div class="nav nav-tabs" id="nav-tab" role="tablist">
						<button class="nav-link active" id="nav-home-tab"
							data-bs-toggle="tab" data-bs-target="#nav-home" type="button"
							role="tab" aria-controls="nav-home" aria-selected="true">汽車保養</button>
						<button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab"
							data-bs-target="#nav-profile" type="button" role="tab"
							aria-controls="nav-profile" aria-selected="false">故障檢修</button>
						<button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab"
							data-bs-target="#nav-contact" type="button" role="tab"
							aria-controls="nav-contact" aria-selected="false">電動車保養</button>
					</div>
				</nav>
				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active" id="nav-home"
						role="tabpanel" aria-labelledby="nav-home-tab">
						<div
							style="border: 2px solid gray; border-radius: 5px; width: 600px; padding: 10px;">
							<div style="font-size: 18px;" class="formgroup">
								<input type="checkbox" id="small"name="mcategory" value="小保養" checked /> <label
									for="mcategory">小保養</label> <input type="checkbox"
									name="mcategory" value="大保養" /> <label for="mcategory">大保養</label>
								<input type="checkbox" name="mcategory" value="電池更換" /> <label
									for="mcategory">電池更換</label> <input type="checkbox"
									name="mcategory" value="引擎積碳清洗" /> <label for="mcategory">引擎積碳清洗</label>
								<input type="checkbox" name="mcategory" value="引擎油泥清洗" /> <label
									for="mcategory">引擎油泥清洗</label>
							</div>
							<br>

							<!-- 電車 -->
							<div style="font-size: 18px;" class="formgroup">

								<input type="checkbox" name="mcategory" value="配件加裝" /> <label
									for="">配件加裝</label> <input type="checkbox" id="tire" name="mcategory"
									value="輪胎更換" /> <label for="">輪胎更換</label> <input
									type="checkbox" name="mcategory" value="鈑金烤漆" checked /> <label for="">鈑金烤漆</label>
								<input type="checkbox" name="mcategory" value="冷氣系統保養/清潔" /> <label
									for="">冷氣系統保養/清潔</label>
							</div>
						</div>
					</div>

					<div class="tab-pane fade" id="nav-profile" role="tabpanel"
						aria-labelledby="nav-profile-tab">
						<div
							style="border: 2px solid gray; border-radius: 5px; width: 600px; padding: 10px;">
							<div style="font-size: 18px;" class="formgroup">
								<input type="checkbox" name="inspection" value="線路系統" /> <label
									for="inspection">線路系統</label> <input type="checkbox"
									name="inspection" value="渦輪系統" /> <label for="inspection">渦輪系統</label>
								<input type="checkbox" name="inspection" value="冷卻系統" /> <label
									for="inspection">冷卻系統</label> <input type="checkbox"
									name="inspection" value="電機系統" /> <label for="inspection">電機系統</label>
								<input type="checkbox" name="inspection" value="變速箱系統" /> <label
									for="inspection">變速箱系統</label>
							</div>
							<br>


							<div style="font-size: 18px;" class="formgroup">

								<input type="checkbox" name="inspection" value="空調系統" /> <label
									for="">空調系統</label> <input type="checkbox" name="inspection"
									value="煞車系統" /> <label for="">煞車系統</label> <input
									type="checkbox" name="inspection" value="轉向系統" /> <label
									for="">轉向系統</label> <input type="checkbox" name="inspection"
									value="引擎動力系統" /> <label for="">引擎動力系統</label>
							</div>
							<br>
							<div style="font-size: 18px;" class="formgroup">

								<input type="checkbox" name="inspection" value="事故包修" /> <label
									for="">事故包修</label> <input type="checkbox" name="inspection"
									value="底盤系統" /> <label for="">底盤系統</label> <input
									type="checkbox" name="inspection" value="燈光系統" /> <label
									for="">燈光系統</label> <input type="checkbox" name="inspection"
									value="儀表亮燈" /> <label for="">儀表亮燈</label>
							</div>
						</div>
					</div>

					<!-- 電車 -->
					<div class="tab-pane fade" id="nav-contact" role="tabpanel"
						aria-labelledby="nav-contact-tab">
						<div
							style="border: 2px solid gray; border-radius: 5px; width: 600px; padding: 10px;">
							<div style="font-size: 18px;" class="formgroup">
								<input type="checkbox" name="electric" value="EV定期保養" /> <label
									for="electric">定期保養</label> <input type="checkbox"
									name="electric" value="EV冷卻液體" /> <label for="electric">冷卻液體</label>
								<input type="checkbox" name="electric" value="EV電池檢查" /> <label
									for="electric">電池檢查</label> <input type="checkbox"
									name="electric" value="EV煞車系統" /> <label for="electric">煞車系統</label>
								<br /> <input type="checkbox" name="electric" value="EV輪胎保養" />
								<label for="electric">輪胎對調、平衡以及四輪定位</label>
							</div>
							<br>


							<div style="font-size: 18px;" class="formgroup">

								<input type="checkbox" name="electric" value="EV大保養" /> <label
									for="">大保養</label> <input type="checkbox" name="electric"
									value="EV鈑金烤漆" /> <label for="">鈑金烤漆</label> <input
									type="checkbox" name="electric" value="EV冷氣系統保養/清潔" /> <label
									for="">冷氣系統保養/清潔</label>
							</div>
						</div>
					</div>
				</div>

			
				<br>

				<div class="formgroup">

					<span for="notes" class="t1">備註:</span>
					<p class="text-danger">可簡單敘述車輛狀況，方便技師快速診斷</p>
					<textarea style="border: 2px solid gray;" name="notes" id="note"
						cols="72" rows="3"></textarea>
				</div>
				<br>

			



				<div
					style="border: 2px solid gray; border-radius: 5px; width: 600px; padding: 10px;">
					<label for="date">預約時間：</label>
					<div class="formgroup">
						<input type="date"
							style="border: 2px solid dark; border-radius: 5px; padding: 6px;"
							id="date" name="appointment" required value="2023-06-01 10:00"
							min="" max="2023-06-30"> <select style="border: 3px solid dark; border-radius: 5px; padding: 8px;" id="part" name="appointmenttime" >
    <option value="">請點擊選擇時段</option>
    <option value="上午10:00" data-timeslot="morning">上午10:00</option>
    <option value="上午11:00" data-timeslot="morning">上午11:00</option>
    <option value="上午12:00" data-timeslot="morning">上午12:00</option>
    <option value="下午13:00" data-timeslot="afternoon">下午13:00</option>
    <option value="下午14:00" data-timeslot="afternoon">下午14:00</option>
    <option value="下午15:00" data-timeslot="afternoon">下午15:00</option>
    <option value="下午16:00" data-timeslot="afternoon">下午16:00</option>
    <option value="下午17:00" data-timeslot="afternoon">下午17:00</option>
    <option value="下午18:00" data-timeslot="afternoon">下午18:00</option>
    <option value="晚上19:00" data-timeslot="evening">晚上19:00</option>
    <option value="晚上20:00" data-timeslot="evening">晚上20:00</option>
</select>

					</div>
				</div>







				<br>

				<button type="submit" class="btn btn-dark">確認送出</button>
				<button type="button" class="btn btn-success" id="verified">輸入</button>
		</div>
		</form:form>
	</div>
	<br>
	<script>
		function validateForm() {
			var checkboxes1 = document.getElementsByName('mcategory');
			var checkboxes2 = document.getElementsByName('electric');
			var checkboxes3 = document.getElementsByName('inspection');
			var checked = false;
			for (var i = 0; i < checkboxes1.length; i++) {
				if (checkboxes1[i].checked) {
					checked = true;
					break;
				}
			}
			for (var i = 0; i < checkboxes2.length; i++) {
				if (checkboxes2[i].checked) {
					checked = true;
					break;
				}
			}
			for (var i = 0; i < checkboxes3.length; i++) {
				if (checkboxes3[i].checked) {
					checked = true;
					break;
				}
			}
			if (!checked) {
				var message = "您需要在保修項目勾選至少一項才能提交";
				var dialog = bootbox.alert(message);
				return false;
			}
			return true;
		}

		const dateInput = document.getElementById("date");
		dateInput.addEventListener("input", function(event) {
			const selectedDate = new Date(event.target.value);
			if (selectedDate.getDay() === 6 || selectedDate.getDay() === 0) {
				event.target.setCustomValidity("請選擇平日週一至週五的日期");
			} else {
				event.target.setCustomValidity("");
			}
		});
		let today = new Date();
		// 計算今天的兩天後的日期
		let futureDate = new Date(today.getTime() + 2 * 24 * 60 * 60 * 1000);
		// 設定日期選擇器的初始值為今天的兩天後
		document.getElementById("date").value = futureDate.toISOString().slice(
				0, 10);
		
		
		
		document
		.querySelector('#verified')
		.addEventListener(
				'click',
				function() {
					
					document.querySelector('#note').value = '引擎有異音，要一起做檢修';
					document.querySelector('#date').value = '2023-06-24';
					document.querySelector('#part').value = '晚上19:00';
				});
	</script>
	<script>
    function filterModels() {
        var brandSelect = document.getElementById("brandSelect");
        var modelSelect = document.getElementById("modelSelect");
        
        // 清空原有的型號選項
        modelSelect.innerHTML = "";
        
        // 取得選取的品牌
        var selectedBrand = brandSelect.value;
        
        // 定義汽車品牌和型號的對應關係
        var brandModels = {
            "Toyota": ["Toyota Corolla Altis", "Toyota RAV4", "Toyota Yaris", "Toyota Camry", "Toyota Sienta", "Toyota Vios", "Toyota Hilux"],
            "Honda": ["Honda CR-V", "Honda Civic", "Honda HR-V", "Honda Accord", "Honda Fit", "Honda City", "Honda Odyssey"],
            "Nissan": ["Nissan Kicks", "Nissan Altima", "Nissan Maxima", "Nissan Rogue", "Nissan Murano", "Nissan Pathfinder"],
            "Mercedes-Benz": ["Mercedes-Benz C300", "Mercedes-Benz E-200", "Mercedes-Benz GLC 300", "Mercedes-Benz GLE 450", "Mercedes-Benz CLA 250", "Mercedes-Benz S450L", "Mercedes-Benz GLS 450"],
            "BMW": ["BMW 320i", "BMW 530i", "BMW X3", "BMW 730Li", "BMW X1", "BMW 330i", "BMW X5", "BMW 420i"],
            "Mitsubishi": ["Mitsubishi Outlander", "Mitsubishi ASX", "Mitsubishi Triton"],
            "Mazda": ["Mazda CX-5", "Mazda3", "Mazda CX-30", "Mazda6", "Mazda2", "Mazda CX-3"],
            "Lexus": ["Lexus ES", "Lexus RX 350", "Lexus NX 200", "Lexus LS", "Lexus UX 200", "Lexus LC 500"],
            "Audi": ["Audi A3", "Audi A4", "Audi Q3", "Audi Q5", "Audi TT", "Audi RS4", "Audi RS5", "Audi R8"],
            "Porsche": ["Porsche 911 Carrera", "Porsche 911 GT3", "Porsche Macan", "Porsche Cayenne"],
            "Ferrari": ["Ferrari F8 Tributo", "Ferrari Portofino", "Ferrari Roma"],
            "Volvo": ["Volvo XC90", "Volvo S60", "Volvo V60"],
            "Mini": ["Mini Cooper 3 Door", "Mini Countryman"]
        };
        
        // 根據選取的品牌設定型號選項
        var models = brandModels[selectedBrand];
        if (models) {
            for (var i = 0; i < models.length; i++) {
                var option = document.createElement("option");
                option.value = models[i];
                option.text = models[i];
                modelSelect.appendChild(option);
            }
        }
    }
</script>
<script>
    var reservationCount = {
        morning: 0,
        afternoon: 0,
        evening: 3
    };

    var partSelect = document.getElementById("part");
    partSelect.addEventListener("change", function() {
        var selectedOption = partSelect.options[partSelect.selectedIndex];
        var selectedTimeslot = selectedOption.getAttribute("data-timeslot");

        if (reservationCount[selectedTimeslot] >= 3) {
            disableOption(selectedTimeslot);
        } else {
            enableOption(selectedTimeslot);
        }
    });

    function disableOption(timeslot) {
        var options = partSelect.options;
        for (var i = 0; i < options.length; i++) {
            var option = options[i];
            if (option.getAttribute("data-timeslot") === timeslot) {
                option.disabled = true;
                option.style.color = "gray";
            }
        }
    }

    function enableOption(timeslot) {
        var options = partSelect.options;
        for (var i = 0; i < options.length; i++) {
            var option = options[i];
            if (option.getAttribute("data-timeslot") === timeslot) {
                option.disabled = false;
                option.style.color = "initial";
            }
        }
    }
</script>
	<!-- 製作回到頂端的TOP-->
	<a href="#top" class="top">Top</a>

	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />
</body>
</html>
