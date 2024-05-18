<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAIN"></c:set>


<!-- 테일윈드 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" />

<style>
.big-outer-box {
	width: auto;
	height: auto;
	display: flex;
	align-items: center;
	flex-direction: column;
	justify-content: center;
}

.small-outer-box {
	width: 100%;
	height: 100%;
	display: flex;
	margin-top: 50px;
	flex-direction: column;
	margin-bottom: 250px;
}

.search-container {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-bottom: 20px;
}

.area-search-box {
	height: auto;
	margin-top: 50px;
}

.search-input {
	width: 300px;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	width: 300px;
}

.search-btn {
	padding: 10px 20px;
	background-color: #F2FBF6;
	color: black;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.content-box {
	display: flex;
}

.area-outer-box {
	margin-left: 100px;
	margin-top: 300px;
	width: 50%;
}

/* 날씨 박스  */
.weather-outer-box {
	width: 50%;
	display: flex;
	justify-content: center;
}

.weather-info {
	width: 250px;
	height: 200px;
	border: none;
	border-radius: 12px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	background: #F2FBF6;
	color: #000000;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	padding: 20px;
	font-size: 16px;
	line-height: 1.6;
}

.weather-info div {
	margin: 10px 0;
}

/* 대전 관광지 목록  */
.tour-spot-box {
	display: none; /* 초기 상태에서는 숨김 */
	width: 100%;
	height: 80%;
	display: flex;
	justify-content: center;
	margin-top: 50px;
}

.tour-spot-small-box {
	width: 90%;
	height: 50%;
	display: flex;
	justify-content: center;
}

.tour-info-table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

.tour-info-table, .tour-info-table th, .tour-info-table td {
	border: 1px solid #ccc;
	padding: 8px;
	text-align: left;
}

.tour-info-table th {
	background-color: #f3f4f6; /* 연한 회색 배경 */
	color: #333; /* 어두운 글씨 */
}
</style>

<div class="big-outer-box">
	<div class="small-outer-box">

		<div class="search-container">
			<form action="../FAQ/search" method="POST">
				<input name="searchKeyword" type="text" id="faq-search" class="search-input" placeholder="FAQ 검색">
				<button type="submit" class="search-btn">검색</button>
			</form>
		</div>

		<div class="content-box">
			<div class="area-outer-box">
				<!-- 지역 select 박스 -->
				<div class="area-select-box mt-4">
					<select id="region-select" class="search-input" onchange="fetchWeather(); handleRegionChange();">
						<option value="Daejeon" selected>대전</option>
						<option value="Seoul">서울</option>
						<option value="Busan">부산</option>
						<option value="Los Angeles">로스앤젤레스</option>
						<option value="Paris">파리</option>
						<option value="Bangkok">방콕</option>
						<option value="Tokyo">도쿄</option>
						<option value="Moscow">모스크바</option>
						<option value="Madrid">마드리드</option>
						<option value="Paris">파리</option>
					</select>
				</div>
			</div>
			<div class="weather-outer-box">
				<div class="weather-small-outer-box">
					<!-- 날씨 정보 표시 요소 -->
					<div id="weather-info" class="weather-info mt-4 text-center">
						<p style="font-weight: bold;" id="city"></p>
						<p style="font-weight: bold;" id="temperature"></p>
						<p style="font-weight: bold;" id="description"></p>
					</div>
				</div>
			</div>
		</div>

		<div class="tour-spot-box" id="tour-spot-box">
			<div class="tour-spot-small-box">
				<table class="tour-info-table">
					<thead>
						<tr>
							<th style="background-color: #F2FBF6;">구분</th>
							<th style="background-color: #F2FBF6;">명소 이름</th>
							<th style="background-color: #F2FBF6;">소재지</th>
							<th style="background-color: #F2FBF6;">전화번호</th>
							<th style="background-color: #F2FBF6;">부서 전화번호</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="touristDestination" items="${touristDestination }">
							<tr>
								<td>${touristDestination.division }</td>
								<td>${touristDestination.placename }</td>
								<td>${touristDestination.location }</td>
								<td>${touristDestination.phoneNumber }</td>
								<td>${touristDestination.departmentphoneNumber }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>


<script>
	function handleRegionChange() {
		var selectedRegion = document.getElementById("region-select").value;
		var tourSpotBox = document.getElementById("tour-spot-box");

		if (selectedRegion === "Daejeon") {
			tourSpotBox.style.display = "flex"; 
		} else {
			tourSpotBox.style.display = "none"; 
		}
	}

	// 페이지 로드 시 초기 상태 확인
	document.addEventListener('DOMContentLoaded', handleRegionChange);
</script>

<script>
    function fetchWeather() {
        var city = document.getElementById('region-select').value;
        var apiKey = "4aeb4c84293bc9b4109638849c3b309c";
        var lang = "kr";
        var apiUrl = "http://api.openweathermap.org/data/2.5/weather?q=" + city + "&appid=" + apiKey + "&lang=" + lang + "&units=metric";

        fetch(apiUrl)
            .then(function(response) {
                return response.json();
            })
            .then(function(data) {
                console.log(data); 

                document.getElementById('city').textContent = data.name;
                document.getElementById('temperature').textContent = data.main.temp + "°C";
                document.getElementById('description').textContent = data.weather[0].description;
            })
            .catch(function(error) {
                console.error('Error:', error);
            });
    }

    window.onload = fetchWeather;
</script>

<%@ include file="../common/foot.jspf"%>