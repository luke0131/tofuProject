<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/img/indexPicture/favicon.ico" rel="icon"
	type="image/x-icon" />
<meta charset="UTF-8">
<title>Tofucars Product</title>
</head>
<body>

	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp" />

	<h1 class="cmp-title__text ">BMW全車系選單頁</h1>

	<h2 class="cmp-modelfilter__title">篩選條件</h2>

	<div class="cmp-modelfilter__overlay-wrap">
		<div data-amp-component-path="overlay-v1" data-loader="webpack"
			data-initialized="true">
			<div class="cmp-overlay cmp-overlay__hidden"
				data-cmp-hook-overlay="layer" role="dialog" aria-modal="true"
				id="filterLayer-1301721188"
				aria-labelledby="filterLayer-1301721188-head">
				<div class="cmp-overlay__content">
					<h3 id="filterLayer-1301721188-head" class="cmp-overlay__head ">篩選條件</h3>
					<div class="cmp-overlay__body ">
						<fieldset
							class="cmp-modelfilter__overlay-group cmp-modelfilter__overlay-group--hidden">
							<legend class="cmp-modelfilter__overlay-group-heading">車系</legend>
							<div
								class="cmp-modelfilter__overlay-group-filter cmp-modelfilter__overlay-group-filter--column-flow">
								<div class="cmp-modelfilter__checkbox ">
									<input type="checkbox"
										class="cmp-modelfilter__input cmp-modelfilter__input--checkbox"
										id="filterLayer-1301721188-series_BMW i" value="BMW i"
										name="series"><span
										class="cmp-modelfilter__checkbox-icon" aria-hidden="true"></span><label
										for="filterLayer-1301721188-series_BMW i"
										data-filter-value="BMW i" data-filter-type="series"
										class="cmp-modelfilter__label cmp-modelfilter__label--checkbox cmp-modelfilter__checkbox-text">BMW
										i</label>
								</div>
								<div class="cmp-modelfilter__checkbox ">
									<input type="checkbox"
										class="cmp-modelfilter__input cmp-modelfilter__input--checkbox"
										id="filterLayer-1301721188-series_X" value="X" name="series"><span
										class="cmp-modelfilter__checkbox-icon" aria-hidden="true"></span><label
										for="filterLayer-1301721188-series_X" data-filter-value="X"
										data-filter-type="series"
										class="cmp-modelfilter__label cmp-modelfilter__label--checkbox cmp-modelfilter__checkbox-text">X</label>
								</div>
								<div class="cmp-modelfilter__checkbox ">
									<input type="checkbox"
										class="cmp-modelfilter__input cmp-modelfilter__input--checkbox"
										id="filterLayer-1301721188-series_M" value="M" name="series"><span
										class="cmp-modelfilter__checkbox-icon" aria-hidden="true"></span><label
										for="filterLayer-1301721188-series_M" data-filter-value="M"
										data-filter-type="series"
										class="cmp-modelfilter__label cmp-modelfilter__label--checkbox cmp-modelfilter__checkbox-text">M</label>
								</div>
								<div class="cmp-modelfilter__checkbox ">
									<input type="checkbox"
										class="cmp-modelfilter__input cmp-modelfilter__input--checkbox"
										id="filterLayer-1301721188-series_8" value="8" name="series"><span
										class="cmp-modelfilter__checkbox-icon" aria-hidden="true"></span><label
										for="filterLayer-1301721188-series_8" data-filter-value="8"
										data-filter-type="series"
										class="cmp-modelfilter__label cmp-modelfilter__label--checkbox cmp-modelfilter__checkbox-text">8</label>
								</div>
								<div class="cmp-modelfilter__checkbox ">
									<input type="checkbox"
										class="cmp-modelfilter__input cmp-modelfilter__input--checkbox"
										id="filterLayer-1301721188-series_7" value="7" name="series"><span
										class="cmp-modelfilter__checkbox-icon" aria-hidden="true"></span><label
										for="filterLayer-1301721188-series_7" data-filter-value="7"
										data-filter-type="series"
										class="cmp-modelfilter__label cmp-modelfilter__label--checkbox cmp-modelfilter__checkbox-text">7</label>
								</div>
								<div class="cmp-modelfilter__checkbox ">
									<input type="checkbox"
										class="cmp-modelfilter__input cmp-modelfilter__input--checkbox"
										id="filterLayer-1301721188-series_6" value="6" name="series"><span
										class="cmp-modelfilter__checkbox-icon" aria-hidden="true"></span><label
										for="filterLayer-1301721188-series_6" data-filter-value="6"
										data-filter-type="series"
										class="cmp-modelfilter__label cmp-modelfilter__label--checkbox cmp-modelfilter__checkbox-text">6</label>
								</div>
								<div class="cmp-modelfilter__checkbox ">
									<input type="checkbox"
										class="cmp-modelfilter__input cmp-modelfilter__input--checkbox"
										id="filterLayer-1301721188-series_5" value="5" name="series"><span
										class="cmp-modelfilter__checkbox-icon" aria-hidden="true"></span><label
										for="filterLayer-1301721188-series_5" data-filter-value="5"
										data-filter-type="series"
										class="cmp-modelfilter__label cmp-modelfilter__label--checkbox cmp-modelfilter__checkbox-text">5</label>
								</div>
								<div class="cmp-modelfilter__checkbox ">
									<input type="checkbox"
										class="cmp-modelfilter__input cmp-modelfilter__input--checkbox"
										id="filterLayer-1301721188-series_4" value="4" name="series"><span
										class="cmp-modelfilter__checkbox-icon" aria-hidden="true"></span><label
										for="filterLayer-1301721188-series_4" data-filter-value="4"
										data-filter-type="series"
										class="cmp-modelfilter__label cmp-modelfilter__label--checkbox cmp-modelfilter__checkbox-text">4</label>
								</div>
								<div class="cmp-modelfilter__checkbox ">
									<input type="checkbox"
										class="cmp-modelfilter__input cmp-modelfilter__input--checkbox"
										id="filterLayer-1301721188-series_3" value="3" name="series"><span
										class="cmp-modelfilter__checkbox-icon" aria-hidden="true"></span><label
										for="filterLayer-1301721188-series_3" data-filter-value="3"
										data-filter-type="series"
										class="cmp-modelfilter__label cmp-modelfilter__label--checkbox cmp-modelfilter__checkbox-text">3</label>
								</div>
								<div class="cmp-modelfilter__checkbox ">
									<input type="checkbox"
										class="cmp-modelfilter__input cmp-modelfilter__input--checkbox"
										id="filterLayer-1301721188-series_2" value="2" name="series"><span
										class="cmp-modelfilter__checkbox-icon" aria-hidden="true"></span><label
										for="filterLayer-1301721188-series_2" data-filter-value="2"
										data-filter-type="series"
										class="cmp-modelfilter__label cmp-modelfilter__label--checkbox cmp-modelfilter__checkbox-text">2</label>
								</div>
								<div class="cmp-modelfilter__checkbox ">
									<input type="checkbox"
										class="cmp-modelfilter__input cmp-modelfilter__input--checkbox"
										id="filterLayer-1301721188-series_1" value="1" name="series"><span
										class="cmp-modelfilter__checkbox-icon" aria-hidden="true"></span><label
										for="filterLayer-1301721188-series_1" data-filter-value="1"
										data-filter-type="series"
										class="cmp-modelfilter__label cmp-modelfilter__label--checkbox cmp-modelfilter__checkbox-text">1</label>
								</div>
								<div class="cmp-modelfilter__checkbox ">
									<input type="checkbox"
										class="cmp-modelfilter__input cmp-modelfilter__input--checkbox"
										id="filterLayer-1301721188-series_Z4" value="Z4" name="series"><span
										class="cmp-modelfilter__checkbox-icon" aria-hidden="true"></span><label
										for="filterLayer-1301721188-series_Z4" data-filter-value="Z4"
										data-filter-type="series"
										class="cmp-modelfilter__label cmp-modelfilter__label--checkbox cmp-modelfilter__checkbox-text">Z4</label>
								</div>
								<div class="cmp-modelfilter__checkbox ">
									<input type="checkbox"
										class="cmp-modelfilter__input cmp-modelfilter__input--checkbox"
										id="filterLayer-1301721188-series_Concept Cars"
										value="Concept Cars" name="series"><span
										class="cmp-modelfilter__checkbox-icon" aria-hidden="true"></span><label
										for="filterLayer-1301721188-series_Concept Cars"
										data-filter-value="Concept Cars" data-filter-type="series"
										class="cmp-modelfilter__label cmp-modelfilter__label--checkbox cmp-modelfilter__checkbox-text">Concept
										Cars</label>
								</div>
							</div>
						</fieldset>
						<fieldset class="cmp-modelfilter__overlay-group ">
							<legend class="cmp-modelfilter__overlay-group-heading">車型樣式</legend>
							<div
								class="cmp-modelfilter__overlay-group-filter cmp-modelfilter__overlay-group-filter--column-flow">
								<div class="cmp-modelfilter__checkbox ">
									<input type="checkbox"
										class="cmp-modelfilter__input cmp-modelfilter__input--checkbox"
										id="filterLayer-1301721188-bodyType_sedan" value="sedan"
										name="bodyType"><span
										class="cmp-modelfilter__checkbox-icon" aria-hidden="true"></span><label
										for="filterLayer-1301721188-bodyType_sedan"
										data-filter-value="sedan" data-filter-type="bodyType"
										icon="none" iconclass="cmp-modelselection__model-icon"
										class="cmp-modelfilter__label cmp-modelfilter__label--checkbox cmp-modelfilter__checkbox-text">Sedan
										房車</label>
								</div>
								<div class="cmp-modelfilter__checkbox ">
									<input type="checkbox"
										class="cmp-modelfilter__input cmp-modelfilter__input--checkbox"
										id="filterLayer-1301721188-bodyType_coupe" value="coupe"
										name="bodyType"><span
										class="cmp-modelfilter__checkbox-icon" aria-hidden="true"></span><label
										for="filterLayer-1301721188-bodyType_coupe"
										data-filter-value="coupe" data-filter-type="bodyType"
										icon="none" iconclass="cmp-modelselection__model-icon"
										class="cmp-modelfilter__label cmp-modelfilter__label--checkbox cmp-modelfilter__checkbox-text">Coupé
										雙門跑車</label>
								</div>
								<div class="cmp-modelfilter__checkbox ">
									<input type="checkbox"
										class="cmp-modelfilter__input cmp-modelfilter__input--checkbox"
										id="filterLayer-1301721188-bodyType_sports_activity_coupe"
										value="sports_activity_coupe" name="bodyType"><span
										class="cmp-modelfilter__checkbox-icon" aria-hidden="true"></span><label
										for="filterLayer-1301721188-bodyType_sports_activity_coupe"
										data-filter-value="sports_activity_coupe"
										data-filter-type="bodyType" icon="none"
										iconclass="cmp-modelselection__model-icon"
										class="cmp-modelfilter__label cmp-modelfilter__label--checkbox cmp-modelfilter__checkbox-text">SAC
										運動跑旅</label>
								</div>
								<div class="cmp-modelfilter__checkbox ">
									<input type="checkbox"
										class="cmp-modelfilter__input cmp-modelfilter__input--checkbox"
										id="filterLayer-1301721188-bodyType_tourer" value="tourer"
										name="bodyType"><span
										class="cmp-modelfilter__checkbox-icon" aria-hidden="true"></span><label
										for="filterLayer-1301721188-bodyType_tourer"
										data-filter-value="tourer" data-filter-type="bodyType"
										icon="none" iconclass="cmp-modelselection__model-icon"
										class="cmp-modelfilter__label cmp-modelfilter__label--checkbox cmp-modelfilter__checkbox-text">Tourer
										運動跑旅</label>
								</div>
								<div class="cmp-modelfilter__checkbox ">
									<input type="checkbox"
										class="cmp-modelfilter__input cmp-modelfilter__input--checkbox"
										id="filterLayer-1301721188-bodyType_touring" value="touring"
										name="bodyType"><span
										class="cmp-modelfilter__checkbox-icon" aria-hidden="true"></span><label
										for="filterLayer-1301721188-bodyType_touring"
										data-filter-value="touring" data-filter-type="bodyType"
										icon="none" iconclass="cmp-modelselection__model-icon"
										class="cmp-modelfilter__label cmp-modelfilter__label--checkbox cmp-modelfilter__checkbox-text">Touring
										旅行車</label>
								</div>
								<div class="cmp-modelfilter__checkbox ">
									<input type="checkbox"
										class="cmp-modelfilter__input cmp-modelfilter__input--checkbox"
										id="filterLayer-1301721188-bodyType_gran_turismo"
										value="gran_turismo" name="bodyType"><span
										class="cmp-modelfilter__checkbox-icon" aria-hidden="true"></span><label
										for="filterLayer-1301721188-bodyType_gran_turismo"
										data-filter-value="gran_turismo" data-filter-type="bodyType"
										icon="none" iconclass="cmp-modelselection__model-icon"
										class="cmp-modelfilter__label cmp-modelfilter__label--checkbox cmp-modelfilter__checkbox-text">Gran
										Turismo</label>
								</div>
								<div class="cmp-modelfilter__checkbox ">
									<input type="checkbox"
										class="cmp-modelfilter__input cmp-modelfilter__input--checkbox"
										id="filterLayer-1301721188-bodyType_sports_activity_vehicle"
										value="sports_activity_vehicle" name="bodyType"><span
										class="cmp-modelfilter__checkbox-icon" aria-hidden="true"></span><label
										for="filterLayer-1301721188-bodyType_sports_activity_vehicle"
										data-filter-value="sports_activity_vehicle"
										data-filter-type="bodyType" icon="none"
										iconclass="cmp-modelselection__model-icon"
										class="cmp-modelfilter__label cmp-modelfilter__label--checkbox cmp-modelfilter__checkbox-text">SAV
										運動休旅</label>
								</div>
								<div class="cmp-modelfilter__checkbox ">
									<input type="checkbox"
										class="cmp-modelfilter__input cmp-modelfilter__input--checkbox"
										id="filterLayer-1301721188-bodyType_bmw_m" value="bmw_m"
										name="bodyType"><span
										class="cmp-modelfilter__checkbox-icon" aria-hidden="true"></span><label
										for="filterLayer-1301721188-bodyType_bmw_m"
										data-filter-value="bmw_m" data-filter-type="bodyType"
										icon="none" iconclass="cmp-modelselection__model-icon"
										class="cmp-modelfilter__label cmp-modelfilter__label--checkbox cmp-modelfilter__checkbox-text">BMW
										M</label>
								</div>
								<div class="cmp-modelfilter__checkbox ">
									<input type="checkbox"
										class="cmp-modelfilter__input cmp-modelfilter__input--checkbox"
										id="filterLayer-1301721188-bodyType_roadster" value="roadster"
										name="bodyType"><span
										class="cmp-modelfilter__checkbox-icon" aria-hidden="true"></span><label
										for="filterLayer-1301721188-bodyType_roadster"
										data-filter-value="roadster" data-filter-type="bodyType"
										icon="none" iconclass="cmp-modelselection__model-icon"
										class="cmp-modelfilter__label cmp-modelfilter__label--checkbox cmp-modelfilter__checkbox-text">Roadster
										雙座敞篷跑車</label>
								</div>
								<div class="cmp-modelfilter__checkbox ">
									<input type="checkbox"
										class="cmp-modelfilter__input cmp-modelfilter__input--checkbox"
										id="filterLayer-1301721188-bodyType_gran_coupe"
										value="gran_coupe" name="bodyType"><span
										class="cmp-modelfilter__checkbox-icon" aria-hidden="true"></span><label
										for="filterLayer-1301721188-bodyType_gran_coupe"
										data-filter-value="gran_coupe" data-filter-type="bodyType"
										icon="none" iconclass="cmp-modelselection__model-icon"
										class="cmp-modelfilter__label cmp-modelfilter__label--checkbox cmp-modelfilter__checkbox-text">Gran
										Coupé 四門跑車</label>
								</div>
								<div class="cmp-modelfilter__checkbox ">
									<input type="checkbox"
										class="cmp-modelfilter__input cmp-modelfilter__input--checkbox"
										id="filterLayer-1301721188-bodyType_hatch" value="hatch"
										name="bodyType"><span
										class="cmp-modelfilter__checkbox-icon" aria-hidden="true"></span><label
										for="filterLayer-1301721188-bodyType_hatch"
										data-filter-value="hatch" data-filter-type="bodyType"
										icon="none" iconclass="cmp-modelselection__model-icon"
										class="cmp-modelfilter__label cmp-modelfilter__label--checkbox cmp-modelfilter__checkbox-text">Hatch
										掀背車</label>
								</div>
								<div class="cmp-modelfilter__checkbox ">
									<input type="checkbox"
										class="cmp-modelfilter__input cmp-modelfilter__input--checkbox"
										id="filterLayer-1301721188-bodyType_bmw_i" value="bmw_i"
										name="bodyType"><span
										class="cmp-modelfilter__checkbox-icon" aria-hidden="true"></span><label
										for="filterLayer-1301721188-bodyType_bmw_i"
										data-filter-value="bmw_i" data-filter-type="bodyType"
										icon="none" iconclass="cmp-modelselection__model-icon"
										class="cmp-modelfilter__label cmp-modelfilter__label--checkbox cmp-modelfilter__checkbox-text">BMW
										i</label>
								</div>
								<div class="cmp-modelfilter__checkbox ">
									<input type="checkbox"
										class="cmp-modelfilter__input cmp-modelfilter__input--checkbox"
										id="filterLayer-1301721188-bodyType_convertible"
										value="convertible" name="bodyType"><span
										class="cmp-modelfilter__checkbox-icon" aria-hidden="true"></span><label
										for="filterLayer-1301721188-bodyType_convertible"
										data-filter-value="convertible" data-filter-type="bodyType"
										icon="none" iconclass="cmp-modelselection__model-icon"
										class="cmp-modelfilter__label cmp-modelfilter__label--checkbox cmp-modelfilter__checkbox-text">Convertible
										四座敞篷跑車</label>
								</div>
							</div>
						</fieldset>
						<fieldset class="cmp-modelfilter__overlay-group">
							<legend class="cmp-modelfilter__overlay-group-heading">Fuel
								Type</legend>
							<div
								class="cmp-modelfilter__overlay-group-filter cmp-modelfilter__overlay-group-filter--column-flow">
								<div class="cmp-modelfilter__checkbox ">
									<input type="checkbox"
										class="cmp-modelfilter__input cmp-modelfilter__input--checkbox"
										id="-fuelTypes_gasoline" value="gasoline" name="fuelTypes"><span
										class="cmp-modelfilter__checkbox-icon" aria-hidden="true"></span><label
										for="-fuelTypes_gasoline" data-filter-value="gasoline"
										data-filter-type="fuelTypes"
										class="cmp-modelfilter__label cmp-modelfilter__label--checkbox cmp-modelfilter__checkbox-text">汽油引擎</label>
								</div>
								<div class="cmp-modelfilter__checkbox ">
									<input type="checkbox"
										class="cmp-modelfilter__input cmp-modelfilter__input--checkbox"
										id="-fuelTypes_diesel" value="diesel" name="fuelTypes"><span
										class="cmp-modelfilter__checkbox-icon" aria-hidden="true"></span><label
										for="-fuelTypes_diesel" data-filter-value="diesel"
										data-filter-type="fuelTypes"
										class="cmp-modelfilter__label cmp-modelfilter__label--checkbox cmp-modelfilter__checkbox-text">柴油引擎</label>
								</div>
								<div class="cmp-modelfilter__checkbox ">
									<input type="checkbox"
										class="cmp-modelfilter__input cmp-modelfilter__input--checkbox"
										id="-fuelTypes_pluginHybrid" value="pluginHybrid"
										name="fuelTypes"><span
										class="cmp-modelfilter__checkbox-icon" aria-hidden="true"></span><label
										for="-fuelTypes_pluginHybrid" data-filter-value="pluginHybrid"
										data-filter-type="fuelTypes" icon="fuel-type-phev"
										iconclass="cmp-modelfilter__electric-icon"
										class="cmp-modelfilter__label cmp-modelfilter__label--checkbox cmp-modelfilter__checkbox-text"><div
											class="icon-fuel-type-phev cmp-modelfilter__electric-icon"></div>混合動力</label>
								</div>
								<div class="cmp-modelfilter__checkbox ">
									<input type="checkbox"
										class="cmp-modelfilter__input cmp-modelfilter__input--checkbox"
										id="-fuelTypes_fullElectric" value="fullElectric"
										name="fuelTypes"><span
										class="cmp-modelfilter__checkbox-icon" aria-hidden="true"></span><label
										for="-fuelTypes_fullElectric" data-filter-value="fullElectric"
										data-filter-type="fuelTypes" icon="fuel-type-bev"
										iconclass="cmp-modelfilter__electric-icon"
										class="cmp-modelfilter__label cmp-modelfilter__label--checkbox cmp-modelfilter__checkbox-text"><div
											class="icon-fuel-type-bev cmp-modelfilter__electric-icon"></div>純電</label>
								</div>
							</div>
						</fieldset>
					</div>
					<div class="cmp-overlay__foot cmp-modelfilter__overlay-footer">
						<button type="button"
							data-cmp-hook-modelselection="closeOverlayButton"
							class="cmp-modelfilter__button cmp-modelfilter__button--button ">查看篩選結果
							(59)</button>
						<button type="reset"
							class="cmp-modelfilter__button cmp-modelfilter__button--reset ">
							<span
								class="cmp-modelfilter__button-icon icon-bmw_actions_delete"
								aria-hidden="true"></span><span
								class="cmp-modelfilter__button-text">重設篩選條件</span>
						</button>
					</div>
					<button class="cmp-overlay__close-button" type="button"
						data-cmp-hook-overlay="close-button" aria-label="Close"></button>
				</div>
			</div>
			<button
				class="cmp-overlay__button cmp-modelfilter__more-filter-button"
				type="button" data-cmp-hook-overlay="trigger-button">顯示更多篩選條件</button>
		</div>
	</div>

	<div class="cmp-modelfilter__number-wrap" role="region"
		aria-live="assertive">
		<span class="cmp-modelfilter__number"
			data-cmp-hook-modelselection="filterNumber">59</span><span
			class="cmp-modelfilter__number-space">&nbsp;</span><span
			class="cmp-modelfilter__number-text"
			data-cmp-hook-modelselection="filterNumberText">符合條件之車型</span>
	</div>

	<!-- 製作回到頂端的TOP-->
	<a href="#top" class="top">Top</a>

	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />

</body>
</html>