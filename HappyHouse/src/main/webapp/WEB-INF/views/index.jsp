<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<body>
	<main id="main">	
		<!-- ======= Tabs Section ======= -->
		<section id="tabs" class="tabs">
			<div class="container" data-aos="fade-up">
				<section id="index_section">
					<div class="card col-sm-12 mt-1" style="min-height: 850px;">
						<div class="card-body">
						<script>
						let colorArr = ['table-primary','table-success','table-danger'];
						$(document).ready(function(){
							$.get("${root}/main/map"
								,{act:"sido"}
								,function(data, status){
									$.each(data, function(index, vo) {
										$("#sido").append("<option value='"+vo.sido_code+"'>"+vo.sido_name+"</option>");
									});//each
								}//function
								, "json"
							);//get
						});//ready
						$(document).ready(function(){
							$("#sido").change(function() {
								$.get("${root}/map"
										,{act:"gugun", sido:$("#sido").val()}
										,function(data, status){
											$("#gugun").empty();
											$("#gugun").append('<option value="0">선택</option>');
											$.each(data, function(index, vo) {
												$("#gugun").append("<option value='"+vo.gugun_code+"'>"+vo.gugun_name+"</option>");
											});//each
										}//function
										, "json"
								);//get
							});//change
							$("#gugun").change(function() {
								$.get("${root}/map"
										,{act:"dong", gugun:$("#gugun").val()}
										,function(data, status){
											$("#dong").empty();
											$("#dong").append('<option value="0">선택</option>');
											$.each(data, function(index, vo) {
												$("#dong").append("<option value='"+vo.dong+"'>"+vo.dong+"</option>");
											});//each
										}//function
										, "json"
								);//get
							});//change
							$("#dong").change(function() {
								$.get("${root}/map"
										,{act:"apt", dong:$("#dong").val()}
										,function(data, status){
											$("#searchResult").empty();
											$.each(data, function(index, vo) {
												let str = "<tr class="+colorArr[index%3]+">"
												+ "<td>" + vo.no + "</td>"
												+ "<td>" + vo.dong + "</td>"
												+ "<td>" + vo.aptName + "</td>"
												+ "<td>" + vo.jibun + "</td>"
												+ "<td>" + vo.code + "</td>"
												+ "<td>" + vo.dealAmount + "</td>"
												+ "<td>" + vo.area + "</td></tr>"
												// + "</td><td id='lat_"+index+"'></td><td id='lng_"+index+"'></td></tr>";
												$("#searchResult").append(str);
												// $("#searchResult").append(vo.dong+" "+vo.aptName+" "+vo.jibun+"<br>");
											});//each
											clearOverlays();
											geocode(data);
										}//function
										, "json"
								);//get
							});//change
						});//ready
						function geocode(jsonData) {
							let idx = 0;
							
							$.each(jsonData, function(index, vo) {
								let tmpLat;
								let tmpLng;
								$.get("https://maps.googleapis.com/maps/api/geocode/json"
										,{	key:'AIzaSyAOtxY09nDbxHEGc0M9hj7X8Smfo-Cu7so'
											, address:vo.dong+"+"+vo.aptName+"+"+vo.jibun
										}
										, function(data, status) {
											// alert(data.results[0].geometry.location.lat);
											tmpLat = data.results[0].geometry.location.lat;
											tmpLng = data.results[0].geometry.location.lng;
											// $("#lat_"+index).text(tmpLat);
											// $("#lng_"+index).text(tmpLng);
											addMarker(tmpLat, tmpLng, vo.aptName, vo.no);
										}
										, "json"
								);//get
							});//each
						}
						</script>
						시도 : <select id="sido">
							<option value="0">선택</option>
						</select>
						구군 : <select id="gugun">
							<option value="0">선택</option>
						</select>
						읍면동 : <select id="dong">
							<option value="0">선택</option>
						</select>
						<table class="table mt-2">
							<thead>
								<tr>
									<th>번호</th>
									<th>법정동</th>
									<th>아파트이름</th>
									<th>지번</th>
									<th>지역코드</th>
									<th>거래금액</th>
									<th>면적</th>
								</tr>
							</thead>
							<tbody id="searchResult">
							</tbody>
						</table>
		
						<div id="map" style="width: 100%; height: 700px; margin: auto;"></div>
						<script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
						<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAOtxY09nDbxHEGc0M9hj7X8Smfo-Cu7so&callback=initMap"></script>
						<script>
							var multi = {lat: 37.5665734, lng: 126.978179};
							var map;
							var markersArray = [];
							
							function initMap() {
								map = new google.maps.Map(document.getElementById('map'), {
									center: multi, zoom: 12
								});
								const image =
								    "https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png";
								var marker = new google.maps.Marker({position: multi, map: map, icon: image});
								markersArray.push(marker);
							}
							function addMarker(tmpLat, tmpLng, aptName, no) {
								const image = "https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png";
								var marker = new google.maps.Marker({
									position: new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng)),
									label: aptName,
									title: aptName,
									icon: image
								});
								marker.addListener('click', function() {
									map.setZoom(17);
									map.setCenter(marker.getPosition());
									callHouseDealInfo(tmpLat, tmpLng, aptName, no);
								});
								markersArray.push(marker);
								var initialLocation = new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng));
			                    map.setCenter(initialLocation);
			                    map.setZoom(17);
								marker.setMap(map);
							}
							function clearOverlays() {
			                      for (var i = 0; i < markersArray.length; i++ ) {
			                        markersArray[i].setMap(null);
			                      }
			                      markersArray.length = 0;
			                }
							function callHouseDealInfo(tmpLat, tmpLng, aptName, no) {
								// alert(no + ' ' + aptName);
								$("#AptInfoModal").modal('show');
								$("#modalAptName").text(aptName + " 거래정보");
								
								$.get("${root}/main/map"
										,{act:"aptInfo", aptName: aptName}
										,function(data, status){
											$("#AptResult").empty();
											$.each(data, function(index, vo) {
												let str = "<tr>"
												+ "<td>" + vo.dealAmount + "</td>"
												+ "<td>" + vo.buildYear + "</td>"
												+ "<td>" + vo.area + "</td>"
												+ "<td>" + vo.floor + "</td>"
												+ "<td>" + vo.dealYear + "." + vo.dealMonth + "." + vo.dealDay + "</td></tr>"
												$("#AptResult").append(str);
											});//each
										}//function
										, "json"
								);//get 
							}
						</script>
						</div>
					</div>
				</section>
			
				<div class="tab-content">
					<div class="tab-pane active show" id="tab-1">
						<div class="row">
							<div class="col-lg-6 order-2 order-lg-1 mt-3 mt-lg-0" 
								data-aos="fade-up" data-aos-delay="100">
								</div>
							<div class="col-lg-6 order-1 order-lg-2 text-center"
								data-aos="fade-up" data-aos-delay="200">
							</div>
						</div>
					</div>
					<div class="tab-pane" id="tab-2">
						<div class="row">
							<div class="col-lg-6 order-2 order-lg-1 mt-3 mt-lg-0">
								</div>
							<div class="col-lg-6 order-1 order-lg-2 text-center">
							</div>
						</div>
					</div>
					<div class="tab-pane" id="tab-3">
						<div class="row">
							<div class="col-lg-6 order-2 order-lg-1 mt-3 mt-lg-0">
							</div>
							<div class="col-lg-6 order-1 order-lg-2 text-center">
							</div>
						</div>
					</div>
					<div class="tab-pane" id="tab-4">
						<div class="row">
							<div class="col-lg-6 order-2 order-lg-1 mt-3 mt-lg-0">
								
							</div>
							<div class="col-lg-6 order-1 order-lg-2 text-center">
							</div>
						</div>
					</div>
				</div>

			</div>
		</section>
		<!-- End Tabs Section -->
	</main>
	
	<!-- End #main -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

	<!-- Apt Info Modal -->
	<div class="modal" id="AptInfoModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title" id="modalAptName"></h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body">
					<table class="table mt-2">
						<thead>
							<tr>
								<th>거래금액</th>
								<th>건축연도</th>
								<th>면적</th>
								<th>층</th>
								<th>거래시점</th>
							</tr>
						</thead>
						<tbody id="AptResult">
						</tbody>
					</table>
				</div>	
			</div>
		</div>
	</div>
</body>