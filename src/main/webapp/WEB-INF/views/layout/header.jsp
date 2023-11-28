<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
	<title>카카오맵</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
        }

        h1 {
            text-align: center;
            width: 800px; /* h1 요소 너비 지정 */
        }

        #map {
            width: 800px;
            height: 700px;
            margin: 10px;
            border: 1px solid #ccc; /* 지도 테두리 스타일 지정 */
        }

        #controls {
            display: flex;
            flex-direction: column;
            align-items: flex-start; /* 왼쪽 정렬 지정 */
            margin: 10px;
			width: 500px;
        }

        #coordinates, input[type="text"] {
            width: 70%;
            margin: 10px;
        }

        #reload {
            margin: 10px;
        }
    </style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <a href="/">메인</a>
    <a href="/board">게시판</a>
    <a href="/blue">블루</a>