<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp" %>

    <h1>카카오맵(블루)</h1>

    <div id="map"></div>

    <div id="controls">
        <button id="reload">다시그리기</button>

        <p>좌표</p>
        <!--<input type="text" id="coordinates">
        
        <button id="saveButton">입력</button> -->

        <input type="text" id="manualCoordinates" placeholder="좌표 입력">
        <button id="manualDrawButton">다각형 그리기</button>
    </div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f96461d35c6cee324cd2b59aa03c70fd"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
        mapOption = { 
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };
    
    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    
     // 현재 위치 가져오기
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (position) {
            var lat = position.coords.latitude;
            var lon = position.coords.longitude;
            var newCenter = new kakao.maps.LatLng(lat, lon);
            map.setCenter(newCenter);
        }, function (error) {
            console.error('Error getting current position:', error);
        });
    }
    
    var drawingFlag = false; // 다각형이 그려지고 있는 상태를 가지고 있을 변수입니다
    var drawingPolygon; // 그려지고 있는 다각형을 표시할 다각형 객체입니다
    var polygon; // 그리기가 종료됐을 때 지도에 표시할 다각형 객체입니다
    var areaOverlay; // 다각형의 면적정보를 표시할 커스텀오버레이 입니다
    var clickCount = 0;
    var reloadButton = document.getElementById('reload');

    // "다시 그리기" 버튼을 클릭했을 때 초기화 함수 호출
    reloadButton.addEventListener('click', function () {

        // 현재 위치 가져오기
        if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (position) {
            var lat = position.coords.latitude;
            var lon = position.coords.longitude;
            var newCenter = new kakao.maps.LatLng(lat, lon);
            map.setCenter(newCenter);
        }, function (error) {
            console.error('Error getting current position:', error);
        });
    }


        resetMap();
        clickCount = 0;

        // 입력 창을 초기화
        var coordinatesInput = document.getElementById('manualCoordinates');
        coordinatesInput.value = ''; 

    });

    // 초기화 함수
    function resetMap() {
        drawingFlag = false;
        clickCounter = 0;

        if (drawingPolygon) {
            drawingPolygon.setMap(null);
            drawingPolygon = null;
        }

        if (polygon) {
            polygon.setMap(null);
            polygon = null;
        }

        if (areaOverlay) {
            areaOverlay.setMap(null);
            areaOverlay = null;
        }

        map.setLevel(5); // 확대 레벨 초기화
        
    }
    </script>
    <script>

        $("#saveButton").click(()=>{

            let data = {
                coordinates: $("#coordinates").val()
            };

            $.ajax("/addCoord",{
			type:"POST",
			dataType: "json",
			data: JSON.stringify(data),
			headers : {
				"Content-Type" : "application/json"
			}
		}).done((res)=>{
			if(res.code == 1){
				alert("좌표가 저장되었습니다");
			}
		});

        });



   // "다각형 그리기" 버튼에 대한 이벤트 리스너 추가
   document.getElementById('manualDrawButton').addEventListener('click', function () {
        // 수동으로 입력한 좌표 값을 가져오기
        var manualCoordinatesInput = document.getElementById('manualCoordinates').value;

        try {
            // JSON 형식의 입력 값을 파싱하기
            var manualCoordinatesArray = JSON.parse(manualCoordinatesInput);

            // 파싱된 데이터가 배열인지 확인
            if (Array.isArray(manualCoordinatesArray)) {
                // 다각형을 구성할 좌표 배열 생성
                var path = [];

                // 수동으로 입력한 좌표 배열을 순회하며 처리
                manualCoordinatesArray.forEach(function (coord) {
                    // 좌표가 'latitude'와 'longitude' 속성을 가지고 있는지 확인
                    if (coord.hasOwnProperty('latitude') && coord.hasOwnProperty('longitude')) {
                        // 좌표를 경로 배열에 추가
                        path.push(new kakao.maps.LatLng(coord.latitude, coord.longitude));
                    }
                });

                // 수동으로 입력한 좌표로 다각형 생성
                var manualPolygon = new kakao.maps.Polygon({
                    path: path,
                    strokeWeight: 3,
                    strokeColor: '#00a0e9',
                    strokeOpacity: 1,
                    strokeStyle: 'solid',
                    fillColor: '#00a0e9',
                    fillOpacity: 0.2
                });

                // 지도에 다각형 표시
                manualPolygon.setMap(map);

                // 지도를 수동으로 입력한 좌표 배열 중 첫 번째 좌표를 중심으로 이동
                if (path.length > 0) {
                    map.setCenter(path[0]);
                }
            } else {
                alert('유효하지 않은 입력입니다. 유효한 좌표 배열을 입력하세요.');
            }
        } catch (error) {
            alert('입력 파싱 중 오류가 발생했습니다. 유효한 JSON 형식의 좌표 배열을 입력하세요.');
        }
    });


    </script>


<%@ include file="layout/footer.jsp" %>