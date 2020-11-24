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
								$.get("${root}/main/map"
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
								$.get("${root}/main/map"
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
								$.get("${root}/main/map"
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
									<th>거래금액(만원)</th>
									<th>면적(m<sup>2</sup>)</th>
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
				
				<section id="tabs" class="tabs">
			      <div class="container aos-init aos-animate" data-aos="fade-up">
			
			        <ul class="nav nav-tabs row d-flex">
			          <li class="nav-item col-3">
			            <a class="nav-link show active" data-toggle="tab" href="#tab-1">
			              <i class="ri-gps-line"></i>
			              <h4 class="d-none d-lg-block">News</h4>
			            </a>
			          </li>
			          <li class="nav-item col-3">
			            <a class="nav-link" data-toggle="tab" href="#tab-2">
			             <i class="ri-sun-line"></i>
			              <h4 class="d-none d-lg-block">Post</h4>
			            </a>
			          </li>
			          <li class="nav-item col-3">
			            <a class="nav-link" data-toggle="tab" href="#tab-3">
			             <i class="ri-body-scan-line"></i>
			              <h4 class="d-none d-lg-block">YouTube</h4>
			            </a>
			          </li>
			          <li class="nav-item col-3">
			            <a class="nav-link" data-toggle="tab" href="#tab-4">
			              <i class="ri-store-line"></i>
			              <h4 class="d-none d-lg-block">Sites</h4>
			            </a>
			          </li>
			        </ul>
			
			        <div class="tab-content">
			          <div class="tab-pane show active" id="tab-1">
			            <div class="row">
							<div class="col-lg-6 aos-init aos-animate" data-aos="fade-up" data-aos-delay="100">
								<h3>
								<a href="https://land.naver.com/news/newsRead.nhn?type=headline&bss_ymd=20201124&prsco_id=005&arti_id=0001383841" target="_blank"  style="color: black">
								'1가구 1주택'시대 열겠다더니 '공공임대주택' 살라는 정부.</a>
								</h3>
								<p class="font-italic">정부가 최근 내놓은 11·19 전세대책은 공공임대주택의 공실과 신축
									빌라나 상가·오피스 공실 등을 모두 합쳐 11만4000가구의 전세 물량을 공급하는 방안을 담고 있다. 공급 형태는
									다양하지만, 대책 내용을 모두 합치면 한 마디로 '전세용 공공임대주택 보급'으로 요약된다..  
									<a href="https://land.naver.com/news/newsRead.nhn?type=headline&bss_ymd=20201124&prsco_id=005&arti_id=0001383841" target="_blank">Read More</a>
									</p>
								<div class="col-lg-6 order-1 order-lg-2 text-center aos-init aos-animate"
									data-aos="fade-up" data-aos-delay="200">
									<img src="https://imgnews.pstatic.net/image/005/2020/11/24/202011240010_11150924166232_1_20201124001120988.jpg?type=w647"
										alt="" width="500" height="301.56">
								</div>
							</div>
							<div class="col-lg-6 aos-init aos-animate" data-aos="fade-up" data-aos-delay="100">
								<h3>
								<a href="https://land.naver.com/news/newsRead.nhn?type=headline&bss_ymd=20201124&prsco_id=003&arti_id=0010202110" target="_blank" style="color: black">
								"집값 오른다" 전망 불붙어…<br>역대 최고치 찍었다</a>
								</h3>
								<p class="font-italic">[서울=뉴시스] 조현아 기자 = 집값 상승 전망이 더 굳건해졌다. 
								11월 소비자의 주택가격전망 지수가 역대 최고치를 기록한 것으로 나타났다. 
								정부의 강력한 규제에도 집값 상승세가 지속되면서 앞으로 더 오를 것이라는 심리가 확산되고 있는 영향으로 풀이된다..
								<a href="https://land.naver.com/news/newsRead.nhn?type=headline&bss_ymd=20201124&prsco_id=003&arti_id=0010202110" target="_blank">Read More</a>
								</p>
								<div class="col-lg-6 order-1 order-lg-2 text-center aos-init aos-animate"
									data-aos="fade-up" data-aos-delay="200">
									<img src="https://imgnews.pstatic.net/image/003/2020/11/24/NISI20201117_0016901682_web_20201117135347_20201124060117647.jpg?type=w647"
										alt="" width="500">
								</div>
							</div>
						</div>
			          </div>
			          <div class="tab-pane" id="tab-2">
			            <div class="row">
							<div class="col-lg-6 aos-init aos-animate" data-aos="fade-up" data-aos-delay="100">
								<h3>
								<a href="https://brunch.co.kr/@jachuisolo/2" target="_blank"  style="color: black">
								좋은 집을 찾는 5가지 방법</a>
								</h3>
								<p class="font-italic">20살 때부터 9년 동안 집을 네 번 옮겼다. 며칠 전다섯 번째 집으로 이사했다. 
									최근 이사 갈 매물을 찾으며 좋은 집을 얻는 팁 아닌 팁(?)을 공유하고자 한다.
									절대적인 것은 아니며, 집을 구하면서 도움이 되었던 방법이다.<br>
									1. 살고 싶은 집의 특징을 적어보자.<br>
									2. 오피스텔인가? 원룸인가?..
									<a href="https://brunch.co.kr/@jachuisolo/2" target="_blank">Read More</a>
									</p>
								<div class="col-lg-6 order-1 order-lg-2 text-center aos-init aos-animate"
									data-aos="fade-up" data-aos-delay="200">
									<img src="//t1.daumcdn.net/thumb/R1280x0/?fname=http://t1.daumcdn.net/brunch/service/user/2lnY/image/AA2kafa9J4zgWNiw-E6QB5YEFJs.jpg""
										alt="" width="500" height="277.3">
								</div>
							</div>
							<div class="col-lg-6 aos-init aos-animate" data-aos="fade-up" data-aos-delay="100">
								<h3>
								<a href="https://seoulitelab.tistory.com/entry/%EB%B6%80%EB%8F%99%EC%82%B0-%EC%A0%84%EB%AC%B8%EA%B0%80%EA%B0%80-%EC%95%8C%EB%A0%A4%EC%A3%BC%EB%8A%94-%EC%A7%91-%EA%B5%AC%ED%95%98%EA%B8%B0-%ED%8C%81" target="_blank" style="color: black">
								전문가가 알려주는 집 구하기 팁</a>
								</h3>
								<p class="font-italic">마리텔에서 "부동산 전문가가 알려주는 집 구하기 팁"<br>
								1. 내 예산을 솔직히 얘기하지 마라<br>
								2. 결정은 혼자하는 게 아닌 것처럼 굴어라.<br>
								3. 부동산 방문 시 초보일 경우 부모님이나 어른과 동행해라.<br>
								4. 주변 방을 많이 보고 온 척 해라...
								<a href="https://seoulitelab.tistory.com/entry/%EB%B6%80%EB%8F%99%EC%82%B0-%EC%A0%84%EB%AC%B8%EA%B0%80%EA%B0%80-%EC%95%8C%EB%A0%A4%EC%A3%BC%EB%8A%94-%EC%A7%91-%EA%B5%AC%ED%95%98%EA%B8%B0-%ED%8C%81" target="_blank">Read More</a>
								</p>
								<div class="col-lg-6 order-1 order-lg-2 text-center aos-init aos-animate"
									data-aos="fade-up" data-aos-delay="200">
									<img src="https://t1.daumcdn.net/cfile/tistory/2623C641580496D004?original"
										alt="" width="500">
								</div>
							</div>
						</div>
			          </div>
			          <div class="tab-pane" id="tab-3">
			            <div class="row">
							<div class="col-lg-6 aos-init aos-animate" data-aos="fade-up" data-aos-delay="100">
								<h3>
								<a href="https://www.youtube.com/watch?v=ecJussct1s0" target="_blank"  style="color: black">
								집구하기 팁<br>부동산가서 집보기전 말해야할것들</a>
								</h3>
								<p class="font-italic">부동산(공인중개사사무소)에 가셔서 집구하시는 분들께 
									알려드리는 시간절약 집구하기 팁 입니다
									인터넷이나 어플을 통하든
									또는 예약없이 바로 부동산 중개업소에 방문을 하시든
									부동산사무실에 꼭 이야기를 해주셔야 하는것들이 있습니다
									간략하게 7가지로 추려보았구요!<br>
									이 7가지를 우물쭈물 명확하게 말하지 못한다면
									양질의 매물은 보지 못한채 미팅이 산으로 가서 
									황금같이 귀한 시간낭비만 하시게 될겁니다!
									꼭 미리 7가지 부동산에 이야기 하시고!
									좋은 매물 보시고! 좋은 계약! 체결하시길 바랍니다!..
									<a href="https://www.youtube.com/watch?v=ecJussct1s0" target="_blank">Read More</a>
									</p>
								<div class="col-lg-6 order-1 order-lg-2 text-center aos-init aos-animate"
									data-aos="fade-up" data-aos-delay="200">
									<iframe width="500" height="280" src="https://www.youtube.com/embed/ecJussct1s0" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
								</div>
							</div>
							<div class="col-lg-6 aos-init aos-animate" data-aos="fade-up" data-aos-delay="100">
								<h3>
								<a href="https://www.youtube.com/watch?v=iABPjzTjC8M" target="_blank" style="color: black">
								초보 자취생들 위한<br>좋은집 구하는 꿀팁 전수!</a>
								</h3>
								<p class="font-italic">*190113 초보 자취생들 위한 좋은집 구하는 꿀팁 전수!..<br>
								 1. 위치 <br>
								 2. 건물 <br>
								 3. 집<br>
								 4. 주방<br>
								 5. 화장실<br>
								 6. 공과금<br>
								 7. 생활 ..
								<a href="https://www.youtube.com/watch?v=iABPjzTjC8M" target="_blank">Read More</a>
								</p>
								<div class="col-lg-6 order-1 order-lg-2 text-center aos-init aos-animate"
									data-aos="fade-up" data-aos-delay="200">
									<iframe width="500" height="280" src="https://www.youtube.com/embed/iABPjzTjC8M" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
								</div>
							</div>
						</div>
			          </div>
			          <div class="tab-pane" id="tab-4">
			            <div class="row">
			            	<!-- <div class="col-lg-1"></div> -->
							<div class="col-lg-3 aos-init aos-animate" data-aos="fade-up" data-aos-delay="100">
								<div class="col-lg-6 order-1 order-lg-2 text-center aos-init aos-animate"
									data-aos="fade-up" data-aos-delay="200">
									<a href="https://www.zigbang.com/" target="_blank">
									<img src="http://newsroom.etomato.com/userfiles/직방로고01(1).jpg"
										alt="" width="200"></a>
								</div>
							</div>
							<div class="col-lg-3 aos-init aos-animate" data-aos="fade-up" data-aos-delay="100">
								<div class="col-lg-6 order-1 order-lg-2 text-center aos-init aos-animate"
									data-aos="fade-up" data-aos-delay="200">
									<a href="https://www.dabangapp.com/" target="_blank">
									<img src="https://t1.daumcdn.net/cfile/tistory/99617F3F5CF664AB0A"
										alt="" width="200"></a>
								</div>
							</div>
							<div class="col-lg-3 aos-init aos-animate" data-aos="fade-up" data-aos-delay="100">
								<div class="col-lg-6 order-1 order-lg-2 text-center aos-init aos-animate"
									data-aos="fade-up" data-aos-delay="200">
									<p><br><br></p>
									<a href="https://www.r114.com/?_c=memul&_m=p10&direct=A" target="_blank">
									<img src="https://kmug.co.kr/data/file/design/data_logo_114_logo_%EC%9B%90%EB%B3%B8.jpg"
										alt="" width="200"></a>
								</div>
							</div>
							<div class="col-lg-3 aos-init aos-animate" data-aos="fade-up" data-aos-delay="100">
								<div class="col-lg-6 order-1 order-lg-2 text-center aos-init aos-animate"
									data-aos="fade-up" data-aos-delay="200">
									<a href="https://land.naver.com/" target="_blank">
									<img src="/assets/img/NaverRealEstate.jpg" alt="" width="200"></a>
								</div>
							</div>
						</div>
			        </div>
			
			      </div>
			    </section>
				
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