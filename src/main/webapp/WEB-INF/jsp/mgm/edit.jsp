<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/img/indexPicture/favicon.ico" rel="icon"
	type="image/x-icon" />
<meta charset="UTF-8" />
<title>豆腐車業管理平台-會員管理</title>
<script type="text/javascript"
	src="${contextRoot}/js/pages/dashboard.js"></script>
<script type="text/javascript" src="${contextRoot}/css/dashboard.css"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/layout/mgmDependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/mgmHeader.jsp" />


	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/WEB-INF/jsp/layout/mgmNavbar.jsp" />
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
			<form:form method="put" action="${contextRoot}/maintenance/save" modelAttribute="updateForm">
				
				<h2>維修保養管理</h2>
				<table class="table">
				<form:input type="hidden" path="mid"/>
					<thead>
						<tr>
							<th scope="col">Serial number</th>
							<th scope="col">保養</th>
							<th scope="col">維修</th>
							<th scope="col">EV保養</th>
							<th scope="col">備註</th>
							<th scope="col">日期</th>
							<th scope="col">時段</th>

						</tr>
					</thead>
					<tbody>

						<tr>
							<td>${updateForm.mid}</td>
							<td>
								<div>
									<input type="checkbox" id="small" name="mcategory" value="小保養" ${updateForm.mcategory == '小保養' ? 'checked' : ''} />
									<label for="mcategory">小保養</label>
								</div>
								<div>
									<input type="checkbox" name="mcategory" value="大保養" ${updateForm.mcategory == '大保養' ? 'checked' : ''} /> <label
										for="mcategory">大保養</label>
								</div>
								<div>
									<input type="checkbox" name="mcategory" value="電池更換"${updateForm.mcategory == '電池更換' ? 'checked' : ''} /> <label
										for="mcategory">電池更換</label>
								</div>
								<div>
									<input type="checkbox" name="mcategory" value="引擎積碳清洗"${updateForm.mcategory == '引擎積碳清洗' ? 'checked' : ''} /> <label
										for="mcategory">引擎積碳清洗</label>
								</div>
								<div>
									<input type="checkbox" name="mcategory" value="引擎油泥清洗"${updateForm.mcategory == '引擎油泥清洗' ? 'checked' : ''} /> <label
										for="mcategory">引擎油泥清洗</label>
								</div>
								<div>
									<input type="checkbox" name="mcategory" value="配件加裝" ${updateForm.mcategory == '配件加裝' ? 'checked' : ''}/> <label
										for="">配件加裝</label>
								</div>
								<div>
									<input type="checkbox" id="tire" name="mcategory" value="輪胎更換" ${updateForm.mcategory == '輪胎更換' ? 'checked' : ''}/>
									<label for="">輪胎更換</label>
								</div>
								<div>
									<input type="checkbox" name="mcategory" value="鈑金烤漆" ${updateForm.mcategory == '鈑金烤漆' ? 'checked' : ''} />
									<label for="">鈑金烤漆</label>
								</div>
								<div>
									<input type="checkbox" name="mcategory" value="冷氣系統保養/清潔" ${updateForm.mcategory == '冷氣系統保養/清潔' ? 'checked' : ''}/> <label
										for="">冷氣系統保養/清潔</label>
								</div>
							</td>
							<td>
								<div>
									<input type="checkbox" name="inspection" value="線路系統" ${updateForm.inspection == '線路系統' ? 'checked' : ''}/> <label
										for="inspection">線路系統</label>
								</div>
								<div>
									<input type="checkbox" name="inspection" value="渦輪系統" ${updateForm.inspection == '渦輪系統' ? 'checked' : ''}/> <label
										for="inspection">渦輪系統</label>
								</div>
								<div>
									<input type="checkbox" name="inspection" value="冷卻系統" ${updateForm.inspection == '冷卻系統' ? 'checked' : ''}/> <label
										for="inspection">冷卻系統</label>
								</div>
								<div>
									<input type="checkbox" name="inspection" value="電機系統" ${updateForm.inspection == '電機系統' ? 'checked' : ''} /> <label
										for="inspection">電機系統</label>

								</div>
								<div>
									<input type="checkbox" name="inspection" value="變速箱系統" ${updateForm.inspection == '變速箱系統' ? 'checked' : ''}/> <label
										for="inspection">變速箱系統</label>
								</div>
								<div>
									<input type="checkbox" name="inspection" value="空調系統" ${updateForm.inspection == '空調系統' ? 'checked' : ''}/> <label
										for="">空調系統</label>
								</div>
								<div>
									<input type="checkbox" name="inspection" value="煞車系統" ${updateForm.inspection == '煞車系統' ? 'checked' : ''}/> <label
										for="">煞車系統</label>
								</div>
								<div>
									<input type="checkbox" name="inspection" value="轉向系統" ${updateForm.inspection == '轉向系統' ? 'checked' : ''}/> <label
										for="">轉向系統</label>
								</div>
								<div>
									<input type="checkbox" name="inspection" value="引擎動力系統" ${updateForm.inspection == '引擎動力系統' ? 'checked' : ''}/> <label
										for="">引擎動力系統</label>
								</div>
								<div>
									<input type="checkbox" name="inspection" value="事故包修" ${updateForm.inspection == '事故包修' ? 'checked' : ''}/> <label
										for="">事故包修</label>
								</div>
								<div>
									<input type="checkbox" name="inspection" value="底盤系統" ${updateForm.inspection == '底盤系統' ? 'checked' : ''}/> <label
										for="">底盤系統</label>
								</div>
							</td>
							<td>
								<div>
									<input type="checkbox" name="electric" value="EV定期保養" ${updateForm.electric == 'EV定期保養' ? 'checked' : ''}/> <label
										for="electric">定期保養</label>
								</div>
								<div>
									<input type="checkbox" name="electric" value="EV冷卻液體" ${updateForm.electric == 'EV冷卻液體' ? 'checked' : ''}/> <label
										for="electric">冷卻液體</label>
								</div>
								<div>
									<input type="checkbox" name="electric" value="EV電池檢查" ${updateForm.electric == 'EV電池檢查' ? 'checked' : ''}/> <label
										for="electric">電池檢查</label>
								</div>
								<div>
									<input type="checkbox" name="electric" value="EV煞車系統" ${updateForm.electric == 'EV煞車系統' ? 'checked' : ''}/> <label
										for="electric">煞車系統</label>
								</div>
								<div>
									<input type="checkbox" name="electric" value="EV輪胎保養" ${updateForm.electric == 'EV輪胎保養' ? 'checked' : ''}/> <label
										for="electric">輪胎對調、四輪定位</label>
								</div>
								<div>
									<input type="checkbox" name="electric" value="EV大保養" ${updateForm.electric == 'EV大保養' ? 'checked' : ''}/> <label
										for="">大保養</label>
								</div>
								<div>
									<input type="checkbox" name="electric" value="EV鈑金烤漆" ${updateForm.electric == 'EV鈑金烤漆' ? 'checked' : ''}/> <label
										for="">鈑金烤漆</label>
								</div>
								<div>
									<input type="checkbox" name="electric" value="EV冷氣系統保養/清潔" ${updateForm.electric == 'EV冷氣系統保養/清潔' ? 'checked' : ''}/>
									<label for="">冷氣系統保養/清潔</label>
								</div>
							</td>

							<td><textarea style="border: 2px solid gray;" name="notes"
									id="note" cols="30" rows="2">${updateForm.notes}</textarea></td>
							<td>
							<fmt:formatDate value="${updateForm.appointment}" pattern="yyyy-MM-dd" var="formattedDate" />
							<input type="date"
								style="border: 2px solid dark; border-radius: 5px; padding: 6px;"
								id="appointment" name="appointment" value="${formattedDate}" />
								
							</td>
							
							<td><select
								style="border: 3px solid dark; border-radius: 5px; padding: 8px;"
								id="part" name="appointmenttime" required>
									<option value="">${updateForm.appointmenttime}</option>
									<option value="上午10:00">上午10:00</option>
									<option value="上午11:00">上午11:00</option>
									<option value="上午12:00">上午12:00</option>
									<option value="下午13:00">下午13:00</option>
									<option value="下午14:00">下午14:00</option>
									<option value="下午15:00">下午15:00</option>
									<option value="下午16:00">下午16:00</option>
									<option value="下午17:00">下午17:00</option>
									<option value="下午18:00">下午18:00</option>
									<option value="晚上19:00">晚上19:00</option>
									<option value="晚上20:00">晚上20:00</option>
							</select></td>


							<td><button type="submit" class="btn btn-dark"style="width: 80px; height: 50px;">更新</button></td>
						</tr>
						</form:form>



					</tbody>

				</table>





			</main>
		</div>
	</div>
	


	<jsp:include page="/WEB-INF/jsp/layout/mgmfooter.jsp" />
</body>
</html>