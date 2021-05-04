<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>

	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!--브라우저 스타일 초기화-->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />

	<!-- Favicons -->
	<link href="../assets/img/favicon.png" rel="icon">
	<link href="../assets/img/apple-touch-icon.png" rel="apple-touch-icon">

	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">
	<link	href="https://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,600,600i,700,700i|Satisfy|Comic+Neue:300,300i,400,400i,700,700i"	rel="stylesheet">
	<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanumgothic.css">


	<!--GSAP & ScrollToPlugin-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/gsap.min.js"	integrity="sha512-IQLehpLoVS4fNzl7IfH8Iowfm5+RiMGtHykgZJl9AWMgqx0AmJ6cRWcB+GaGVtIsnC4voMfm8f2vwtY+6oPjpQ=="	crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/ScrollToPlugin.min.js"	integrity="sha512-nTHzMQK7lwWt8nL4KF6DhwLHluv6dVq/hNnj2PBN0xMl2KaMm1PM02csx57mmToPAodHmPsipoERRNn4pG7f+Q=="	crossorigin="anonymous"></script>
	<!--Swiper-->
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<!--ScrollMagic-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js"></script>
	<!--Lodash-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.20/lodash.min.js"
		integrity="sha512-90vH1Z83AJY9DmlWa8WkjkV79yfS2n2Oxhsi2dZbIv0nC4E6m5AbH8Nh156kkM7JePmqD6tcZsfad1ueoaovww=="	crossorigin="anonymous"></script>



	<!--Google Material Icons-->
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
	<link href="css/myPage.css" rel="stylesheet">



	<title>My Page</title>



<script>
	function check_delete(){
		if(confirm('계정을 삭제하시겠습니까?')){
			location.href='delete.do?memberId=${vo.memberId}&name=${vo.name}';
		}
		else{
			location.href='myPage.do?memberId=${vo.memberId}';
		}
	}
</script>


</head>


<!-- ====================== body 시작 ======================================================================= -->

<body>


	<header id="header" class="fixed-top d-flex align-items-center header-transparent">

		<div class="container d-flex align-items-center">

			<nav class="nav-menu d-none d-lg-block">
				<ul>
					<li><a href="../index.jsp">Home</a></li>
					<li><a href="../aboutus.jsp">About Us</a></li>
					<li><a href="../Board/boardList.do">Board</a></li>
					<li><a href="../Store/storeList.do">Restaurants</a></li>
					<c:if test="${!empty vo}">
						<li class="active"><a href="../Member/myPage.do?memberId=${vo.memberId}">My Page</a></li>
					</c:if>
					<c:if test="${!empty vo}">
						<li class="book-a-table text-center"><a href="logout.do">logout</a></li>
					</c:if>
					<c:if test="${empty vo}">
						<li class="book-a-table text-center"><a href="loginForm.jsp">login</a></li>
					</c:if>
				</ul>
			</nav>
			<!-- .nav-menu -->

		</div>

	</header>
	

    <!-- ====================== form 시작 ======================================================================= -->

	<form action="myPage.do">
		
	<!-- ====================== top ======================================================================= -->

		<div class="top">
			<h2>My Page</h2>
		</div>

		
    <!-- ====================== main ======================================================================= -->

		<div class="main">

			<!-- ====================== side ======================================================================= -->

			<div class="side">
				
				<img src="../bg_img/bgimg (3).png" width=150px> <br /> <br />
				NAME : ${vo.name}<br /> ID : ${vo.memberId}<br /> <br /> 
				       Preference<br /> Location<br /> <br />

				<div class="preference">
					<c:forEach items="${listA}" var="area">
						<div class="area"><a href="../Store/storeList.do?area=${area.areaId}">${area.name}</a></div>
					</c:forEach>
				</div>
				<br /> <br /> <input type="button" value="Modify" onClick="location.href='updateForm.jsp'" id="modifyButton">
				<br /> <br /> <input type="button" value="Delete Account" onClick="check_delete()" id="withdraw">

			</div>

			<!-- ====================== contents ======================================================================= -->

			<div class="contents" style="overflow:auto; height:580px ">


				<c:forEach items="${listB}" var="board">
					<div class="post">
						
						- My Post : ${board.title}
						<div class="myPostbox">
							<a href="../Board/boardDetailPage.do?boardId=${board.boardId}">
							<div class="contentbox">${board.content}</div>
							</a>
						</div>
						
					</div>
				</c:forEach>

			</div>

		</div>
	</form>


	<!-- ====================== like pic ======================================================================= -->

	    
		<section class="like">
		<div class="L_title">I LIKE ♥</div>
		<div>
			<div>
			
				<c:forEach items="${listSI}" var="storeIamge">
					
						<a href="../Store/storeDetail.do?storeId=${storeIamge.storeId}">
							<img alt=${storeIamge.name} src="../store_img/${storeIamge.imageUrl}" width="200px"
								height="200px">
						</a>
					
				</c:forEach>
				
			</div>

		</div>

	</section>
   
   
	<!-- ====================== Footer ======================================================================= -->

	<footer id="footer">
		<div class="container">
			<h2>VEGAN PROJECT</h2>
			<p>All life deserves respect, dignity, and compassion. All life.</p>

			<div class="copyright">
				&copy; Copyright <strong><span>VEGAN PROJECT</span></strong>. All
				Rights Reserved
			</div>
			<div class="credits">
				<a>Designed by Enocore 1 Team</a>
			</div>
		</div>
	</footer>
	


</body>

</html>