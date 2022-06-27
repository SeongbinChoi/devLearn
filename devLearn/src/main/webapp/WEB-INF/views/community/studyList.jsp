<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/studyList.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community_boot_board.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/ckeditor5/ckeditor.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4471b0f5333b09ad48b748242ef61bff&libraries=services"></script>

<!-- css 및 js -->			
<style>
@import url("https://fonts.googleapis.com/css2?family=Noto+Sans&display=swap");
</style>

<style>
a#top_btn {
	position: fixed;
	left: 3%;
	bottom: 15%;
	display: none;
	z-index: 99;
}

.ck.ck-editor {
	max-width: 97%;
}

.ck-editor__editable {
    min-height: 250px;
    max-height: 250px;
}

.mark_ing {
	width: 80px;
}

.mark_finish {
	width: 57px;
	height: 25px;
	background: lightgray;
	color: white;
	font-size: 13px;
	font-weight: bold;
	text-align: center;
	margin-right: 5px;
	line-height: 25px;
}

.map {
	width: 970px;
	height: 700px;
}

.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: "Malgun Gothic", dotum, "돋움", sans-serif;
	font-size: 12px;
}
.map_wrap {
	position: relative;
	width: 100%;
	height: 350px;
}


#category {top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
#category li {float:left;list-style: none;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
#category li.on {background: #eee;}
#category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
#category li:last-child{margin-right:0;border-right:0;}
#category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
#category li .category_bg {background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
#category li .cafe {background-position: -10px -144px;}
#category li .store {background-position: -10px -180px;}
#category li.on .category_bg {background-position-x:-46px;}

.placeinfo_wrap {
	position: absolute;
	bottom: 28px;
	left: -150px;
	width: 300px;
}
.placeinfo {
	position: relative;
	width: 100%;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	padding-bottom: 10px;
	background: #fff;
}
.placeinfo:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}
.placeinfo_wrap .after {
	content: "";
	position: relative;
	margin-left: -12px;
	left: 50%;
	width: 22px;
	height: 12px;
	background: url("https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png");
}
.placeinfo a,
.placeinfo a:hover,
.placeinfo a:active {
	color: #fff;
	text-decoration: none;
}
.placeinfo a,
.placeinfo span {
	display: block;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}
.placeinfo span {
	margin: 5px 5px 0 5px;
	cursor: default;
	font-size: 13px;
}
.placeinfo .title {
	font-weight: bold;
	font-size: 14px;
	border-radius: 6px 6px 0 0;
	margin: -1px -1px 0 -1px;
	padding: 10px;
	color: #fff;
	background: #d95050;
	background: #d95050
	  url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
	  no-repeat right 14px center;
}
.placeinfo .tel {
	color: #0f7833;
}
.placeinfo .jibun {
	color: #999;
	font-size: 11px;
	margin-top: 0;
}

</style>

<script type="text/javascript">
function login() {
	location.href="${pageContext.request.contextPath}/member/login";
}

function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			if(jqXHR.status === 403) {
				login();
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패 했습니다.");
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}

//전체 / 모집중 / 모집완료 네비게이션 바
function list_category() {
	$(".input-group").show();
	$(".contentHeader").show();
	
	$("#tab-1").removeClass("active");
	$("#tab-0").addClass("active");
	
	
	const $tab = $("button[role='tab'].active");
	let categoryNum = $tab.attr("data-categoryNum"); 

	let url = "${pageContext.request.contextPath}/community/studyList";
	let query = "categoryNum="+categoryNum;
	
	
	let search = $("form[name=searchForm]").serialize();
	query = query + "&" + search;
	
	let selector = "#nav-all";
	
	const fn = function(data) {
		
		$(selector).html( ($(data).find("#nav-all")) );
	};
	
	ajaxFun(url, "get", query, "html", fn);
}


// 최신순 / 답변많은순 항목
function list_detail() {
	$(".input-group").show();
	$(".contentHeader").show();
	
	const $tab1 = $("button[role='tab3'].active");
	let detailNum = $tab1.attr("data-detailNum");
	
	const $tab2 = $("button[role='tab'].active");
	let categoryNum = $tab2.attr("data-categoryNum"); 

	let url = "${pageContext.request.contextPath}/community/studyList";
	let query = "categoryNum="+categoryNum+"&detailNum="+detailNum;
	
	let search = $("form[name=searchForm]").serialize();
	query = query + "&" + search;
	
	let selector = "#nav-all";
	
	const fn = function(data) {
		
		$(selector).html( ($(data).find("#nav-all")) );
	};
	
	ajaxFun(url, "get", query, "html", fn);
}

// 지역별 네이게이션 바
function list_region() {
	$(".input-group").show();
	$(".contentHeader").show();
	
	$("#tab-1").removeClass("active");
	$("#tab-0").addClass("active");
	
	const $tab = $("button[role='tab1'].active");
	
	let jRegionNum = $tab.attr("data-jRegionNum");
	let url = "${pageContext.request.contextPath}/community/studyList";
	let query = "categoryNum=2&jRegionNum="+jRegionNum;
	let search = $("form[name=searchForm]").serialize();
	query = query + "&" + search;
	
	let selector = "#nav-all";
	let selector2 = "#input-group";
	
	const fn = function(data) {
		$(selector2).html( ($(data).find("#input-group")) );
		$(selector).html( ($(data).find("#nav-all")) );
	};
	
	
	ajaxFun(url, "get", query, "html", fn);
}


// 지도 API
function list_gido() {
	$(".input-group").hide();
	$(".contentHeader").hide();
	
	$("#tab-1").removeClass("active");
	$("#tab-0").addClass("active");
	
	const $gido = $("button[role='tab2'].active");
	
	let gidoNum = $gido.attr("data-gidoNum");
	if(gidoNum == 1) {
		setCenter1();
	} else if(gidoNum == 2) {
		setCenter2();
	} else if(gidoNum == 3) {
		setCenter3();
	} else {
		setCenter0();
	}
	
	let url = "${pageContext.request.contextPath}/community/studyList";
	let query = "gidoNum="+gidoNum;
	
	let selector = "#nav-gido";
	
	const fn = function(data) {
		
	};
	
	ajaxFun(url, "get", query, "html", fn);
}


// 글쓰기 함수
function sendOk() {
	var f = document.boardForm;
	var str;
	
	str = f.subject.value.trim();
	if(! str) {
		alert("제목을 입력하세요.");
		f.subject.focus();
		return false;
	}

	str = f.limit.value;
    if(str == "select") {
        alert("모집인원을 선택하세요.");
       	f.limit.focus();
        return;
    }
    
    str = f.regionNum.value;
    if(str == "select") {
        alert("스터디 지역을 선택하세요.");
       	f.regionNum.focus();
        return;
    }

    str = window.editor.getData().trim();
    if(! str) {
        alert("내용을 입력하세요. ");
        window.editor.focus();
        return;
    }
    f.content.value = str;

	f.action = "${pageContext.request.contextPath}/community/study_write";
	f.submit();
}

</script>


<!-- 메인코드 -->
<!-- banner -->
<div class="banner mb-5">
	<div class="container px-4">
		<div class="title row align-items-center" style="height: 200px;">
			<p><span>스터디</span><br>함께 성장할 스터디를 모집해보세요!</p>
		</div>
	</div>
</div>

<!-- 메인 컨텐츠 -->
<div class="contentBody container col-11 my-5">
	<!-- sidebar -->
	<div class="sideMenu col-2">
		<div class="cmmu-menu list-group px-1">
			<a class="list-group-item list-group-item-action disabled list-group-item-secondary">커뮤니티</a>
			<a class="list-group-item list-group-item-action" href="${pageContext.request.contextPath}/community/qnaList">· 질문과 답변</a>
			<a class="list-group-item list-group-item-action active" aria-current="true" href="${pageContext.request.contextPath}/community/studyList">· 스터디</a>
		</div>
	</div>
		
	
	<!-- 네비게이션 바(탭) 및  -->
	<div class="mainContent col-9" style="float: none; margin:0 auto;">
		<!-- TOP버튼 -->
		<a id="top_btn" href="#"><i class="fa-solid fa-circle-chevron-up fa-2x"></i></a>
			
		<ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="all-tab" data-bs-toggle="tab" data-bs-target="#nav-all" type="button" role="tab" aria-controls="all" aria-selected=${categoryNum == 2 ? "true" : "false"} data-categoryNum="2" onclick="list_category();">전체</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="find-tab" data-bs-toggle="tab" data-bs-target="#nav-all" type="button" role="tab" aria-controls="find" aria-selected=${categoryNum == 0 ? "true" : "false"} data-categoryNum="0" onclick="list_category();">모집중</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="finish-tab" data-bs-toggle="tab" data-bs-target="#nav-all" type="button" role="tab" aria-controls="finish" aria-selected=${categoryNum == 1 ? "true" : "false"} data-categoryNum="1" onclick="list_category();">모집완료</button>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" role="button" aria-expanded="false">지역별</a>
				<ul class="dropdown-menu">
					<li><button class="dropdown-item" id="seoul-tab" data-bs-toggle="tab" data-bs-target="#nav-all" type="button" role="tab1" aria-controls="seoul" aria-selected=${jRegionNum == 1 ? "true" : "false"} data-jRegionNum="1" onclick="list_region();">서울</button></li>
					<li><button class="dropdown-item" id="incheon-tab" data-bs-toggle="tab" data-bs-target="#nav-all" type="button" role="tab1" aria-controls="inchoen" aria-selected=${jRegionNum == 2 ? "true" : "false"} data-jRegionNum="2" onclick="list_region();">경기</button></li>
					<li><button class="dropdown-item" id="gyeonggi-tab" data-bs-toggle="tab" data-bs-target="#nav-all" type="button" role="tab1" aria-controls="gyeonggi" aria-selected=${jRegionNum == 3 ? "true" : "false"} data-jRegionNum="3" onclick="list_region();">인천</button></li>
				</ul>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="studyButton" aria-expanded="false">스터디 장소 찾기</a>
				<ul class="dropdown-menu">
					<li><button class="dropdown-item" id="cur-gido" data-bs-toggle="tab" data-bs-target="#nav-gido" type="button" role="tab2" aria-controls="curGido" aria-selected=${gidoNum == 99 ? "true" : "false"} data-gidoNum="99" onclick="list_gido();">현재 위치</button></li>
					<li><button class="dropdown-item" id="seoul-gido" data-bs-toggle="tab" data-bs-target="#nav-gido" type="button" role="tab2" aria-controls="seoulGido" aria-selected=${gidoNum == 1 ? "true" : "false"} data-gidoNum="1" onclick="list_gido();">서울</button></li>
					<li><button class="dropdown-item" id="inchon-gido" data-bs-toggle="tab" data-bs-target="#nav-gido" type="button" role="tab2" aria-controls="inchoenGido" aria-selected=${gidoNum == 2 ? "true" : "false"} data-gidoNum="2" onclick="list_gido();">경기</button></li>
					<li><button class="dropdown-item" id="gyeonggi-gido" data-bs-toggle="tab" data-bs-target="#nav-gido" type="button" role="tab2" aria-controls="gyeonggiGido" aria-selected=${gidoNum == 3 ? "true" : "false"} data-gidoNum="3" onclick="list_gido();">인천</button></li>
				</ul>
			</li>
		</ul>
		
		
		<!-- 검색란 -->
		<div class="input-group mb-3 input-group-lg mb-5">
			<form name="searchForm" action="${pageContext.request.contextPath}/community/studyList" method="post" class="input-group" id="input-group">
				<span class="input-group-text" id="basic-addon1 inputGroup-sizing-lg" style="background: white;"><i class="fas fa-search"></i></span>
				<input type="text" name="keyword" value="${keyword}" class="form-control" placeholder="관심 스터디를 검색해보세요!" aria-label="Username" aria-describedby="basic-addon1">
				<input type="hidden" name="rows" value="${rows}">
				
				<c:choose>
					<c:when test="${jRegionNum == '1' }">
						<button class="btn btn-outline-secondary px-5" type="button" id="button-addon1" onclick="list_region()">검색</button>
					</c:when>
					
					<c:when test="${jRegionNum == '2' }">
						<button class="btn btn-outline-secondary px-5" type="button" id="button-addon1" onclick="list_region()">검색</button>
					</c:when>
				
					<c:when test="${jRegionNum == '3' }">
						<button class="btn btn-outline-secondary px-5" type="button" id="button-addon1" onclick="list_region()">검색</button>
					</c:when>
				
					<c:when test="${jRegionNum == '4' }">
						<button class="btn btn-outline-secondary px-5" type="button" id="button-addon1" onclick="list_category()">검색</button>
					</c:when>
				
				</c:choose>
			</form>
		</div>
		
		
		<!-- 중간 탭(최신순|답변많은순 ...) -->
		<div class="contentHeader">
			<ul class="nav nav-pills" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="tab-0" data-bs-toggle="tab" data-bs-target="#nav-all" type="button" role="tab3" aria-controls="0" aria-selected=${detailNum == 0 ? "true" : "false"} data-detailNum="0" onclick="list_detail();">최신순</button>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-1" data-bs-toggle="tab" data-bs-target="#nav-all" type="button" role="tab3" aria-controls="1" aria-selected=${detailNum == 1 ? "true" : "false"} data-detailNum="1" onclick="list_detail();">답변많은순</button>
				</li>
			</ul>
			
			<div class="btnGroup">
				<button type="button" class="btn btn-outline-primary" onclick='location.href="${pageContext.request.contextPath}/community/studyList";'><i class="fas fa-redo-alt"></i>새로고침</button>
				<c:choose>
					<c:when test="${sessionScope.member.memberEmail == null}">
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#loginModal">글쓰기</button>
					</c:when>
					
					<c:otherwise>
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#studyModal">글쓰기</button>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<hr>
		
		
		<div class="tab-content" id="nav-tabContent">
			<div class="tab-pane fade show active" id="nav-all" role="tabpanel" aria-labelledby="all-tab">
				<!-- 스터디 - 전체 -->
				<c:forEach var="dto" items="${list}">
					<c:choose>
						<c:when test="${sessionScope.member.memberEmail == null}">
							<a href="${articleUrl}&studyNum=${dto.studyNum}" data-bs-toggle="modal" data-bs-target="#loginModal">
						</c:when>
							
						<c:otherwise>
							<a href="${articleUrl}&studyNum=${dto.studyNum}">
						</c:otherwise>
					</c:choose>
						
						<div class="study px-3 py-1">
							<div class="study_info">
								<div class="study_title col-12">
										<c:choose>
											<c:when test="${dto.status == 0}">
												<div class="mark_ing col-2">모집중(${dto.applied}/${dto.limit})</div>
											</c:when>
											
											<c:otherwise>
												<div class="mark_finish col-2">모집완료(${dto.applied}/${dto.limit})</div>
											</c:otherwise>
										</c:choose>
									
										<div class="subject col-8">
											<p>
												[${dto.region}]${dto.subject}
											</p>
										</div>
									</div>
								
								<div class="study_body col-12"> 
									<div class="body_content col-10">
										${dto.content}
									</div>
									<div class="answerNum mx-4">
										<div class="num_center">
											<span>${dto.replyCount}<br>댓글</span>
										</div>
									</div>
								</div>
								
								<div class="study_footer">
									<p></p>
									<p>${dto.memberNickname} | ${dto.regDate} | 조회수 : ${dto.hitCount}</p>
								</div>
							</div>
						</div>
					</a>
					<hr>
				</c:forEach>
				
				<div class="study px-3 py-1">
					${dataCount == 0 ? "등록된 게시글이 없습니다." : paging }			
				</div>
			</div>
			
			
			<div class="tab-pane fade show" id="nav-gido" role="tabpanel" aria-labelledby="all-tab">
				<!-- 스터디 - 지도 -->
				<ul id="category">
					<li id="CE7" data-order="4">
						<span class="category_bg cafe"></span>
							스터디카페
					</li>
				
					<li id="SC4" data-order="5">
						<span class="category_bg store"></span>
					 		학교 도서관
					</li>
				</ul>
				
				<div id="map" class="map px-3 py-1" style="position: relative; overflow: hidden; float: left;"></div>
			<hr>
			
			</div>
			
			
		</div>
	</div>
</div>


<!-- Modal -->
<form name="boardForm" method="post">	
	<div class="modal fade" id="studyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-scrollable modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">커뮤니티</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<div class="mb-3">
				<ul class="nav nav-pills mb-3" id="pills_button" role="tablist">
					<li class="nav-item" role="presentation">
				    	<button class="nav-link active" id="pills-study-tab" data-bs-toggle="pill" data-bs-target="#study_content" type="button" role="tab" aria-controls="pills-study" aria-selected="true">스터디</button>
				  	</li>
				</ul>
			</div>
	      	<div class="mb-3">
			  <label for="exampleFormControlInput1" class="form-label">제목</label>
			  <input type="text" class="form-control" id="community_subject" placeholder="제목을 입력해주세요." name="subject">
			</div>
			<div class="mb-3">
			<p>
			  <label for="exampleFormControlInput1" class="form-label" style="padding-right: 20px;">모집인원</label>
			  <select name="limit" style="margin-right: 150px;">
			  	<option value="select">--선택--</option>
			  	<option value="1">1명</option>
			  	<option value="2">2명</option>
			  	<option value="3">3명</option>
			  	<option value="4">4명</option>
			  </select>
			</p>
			
			<p>
			  <label for="exampleFormControlInput1" class="form-label">스터디 지역</label>
			  <select name="regionNum">
			  	<option value="select">--선택--</option>
			  	<option value="1">서울</option>
			  	<option value="2">경기</option>
			  	<option value="3">인천</option>
			  </select>
			</p>
			</div>
			<div class="mb-3 tab-content" id="community_tabContent">
			  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
			  	<div class="tab-pane fade show active" id="study_content" role="tabpanel">
			  		<div class="editor"></div>
			  		<input type="hidden" name="content">
				</div>
			</div>
			<div class="mb-3">
				<button class="btn btn-primary" type="button" data-bs-dismiss="modal">취소</button>
				<button class="btn btn-primary" type="button" onclick="sendOk();">저장</button>
			</div>
	      </div>
	    </div>
	  </div>
	</div>
</form>



<!-- 맨위로 올리기 -->
<script>
	$(function() {
		$(window).scroll(function(){
		    
		    if ($(this).scrollTop() > 200) {
				$('#top_btn').fadeIn();
	           } else {
	               $('#top_btn').fadeOut();
	           }
		    
		  });
		    
		$("#top_btn").click(function(){
		  window.scrollTo({top : 0, behavior: 'smooth'}); 
		});
	});
</script>


<!-- ck에디터 -->
<script type="text/javascript">
ClassicEditor
	.create( document.querySelector( '.editor' ), {
		fontFamily: {
            options: [
                'default',
                '맑은 고딕, Malgun Gothic, 돋움, sans-serif',
                '나눔고딕, NanumGothic, Arial'
            ]
        },
        fontSize: {
            options: [
                9, 11, 13, 'default', 17, 19, 21
            ]
        },
		toolbar: {
			items: [
				'heading','|',
				'fontFamily','fontSize','bold','italic','fontColor','|',
				'alignment','bulletedList','numberedList','|',
				'imageUpload','insertTable','sourceEditing','blockQuote','mediaEmbed','|',
				'undo','redo','|',
				'link','outdent','indent','|',
			]
		},
		image: {
            toolbar: [
                'imageStyle:full',
                'imageStyle:side',
                '|',
                'imageTextAlternative'
            ],

            // The default value.
            styles: [
                'full',
                'side'
            ]
        },
		language: 'ko',
		ckfinder: {
	        uploadUrl: '${pageContext.request.contextPath}/image/upload' // 업로드 url (post로 요청 감)
	    }
	})
	.then( editor => {
		window.editor = editor;
	})
	.catch( err => {
		console.error( err.stack );
	});
</script>




<!-- kakao맵 -->
<script type="text/javascript">
//마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
	var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
	    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
	    markers = [], // 마커를 담을 배열입니다
	    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
       		center: new kakao.maps.LatLng(37.50719187568753, 126.73129050639602), // 지도의 중심좌표
			
	        level: 3 // 지도의 확대 레벨
	    };
	
	
	// 현재 위치
	function setCenter0() {
		if (navigator.geolocation) {
			// GeoLocation을 이용해서 접속 위치를 얻어 오기
		    navigator.geolocation.getCurrentPosition(function(position) {
		        
		        var lat = position.coords.latitude, // 위도
		            lon = position.coords.longitude; // 경도
		        
		        locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성
		        
		        // 지도의 중심을 현재 위치 정보로 변경
		        map.setCenter(locPosition);
		    });
		}
	}
	
	// 홍대입구(서울)
	function setCenter1() {            
	    // 이동할 위도 경도 위치를 생성합니다 
	    var moveLatLon = new kakao.maps.LatLng(37.56, 126.919);
	    
	    // 지도 중심을 이동 시킵니다
	    map.setCenter(moveLatLon);
	}
	
	
	// 일산(경기)
	function setCenter2() {            
	    // 이동할 위도 경도 위치를 생성합니다 
	    var moveLatLon = new kakao.maps.LatLng(37.68184914770742, 126.76988597679569);
	    
	    // 지도 중심을 이동 시킵니다
	    map.setCenter(moveLatLon);
	}
	
	
	// 굴포천역(인천)
	function setCenter3() {            
	    // 이동할 위도 경도 위치를 생성합니다 
	    var moveLatLon = new kakao.maps.LatLng(37.50719187568753, 126.73129050639602);
	    
	    // 지도 중심을 이동 시킵니다
	    map.setCenter(moveLatLon);
	}
	
	///////////////////////////////////////////////////////////
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places(map); 

	// 지도에 idle 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'idle', searchPlaces);

	// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
	contentNode.className = 'placeinfo_wrap';

	// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
	// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
	addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
	addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

	// 커스텀 오버레이 컨텐츠를 설정합니다
	placeOverlay.setContent(contentNode);  

	// 각 카테고리에 클릭 이벤트를 등록합니다
	addCategoryClickEvent();

	// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
	function addEventHandle(target, type, callback) {
	    if (target.addEventListener) {
	        target.addEventListener(type, callback);
	    } else {
	        target.attachEvent('on' + type, callback);
	    }
	}

	// 카테고리 검색을 요청하는 함수입니다
	function searchPlaces() {
	    if (!currCategory) {
	        return;
	    }
	    
	    // 커스텀 오버레이를 숨깁니다 
	    placeOverlay.setMap(null);

	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    
	    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
	}

	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {

	        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
	        displayPlaces(data);
	    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
	        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

	    } else if (status === kakao.maps.services.Status.ERROR) {
	        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
	        
	    }
	}

	// 지도에 마커를 표출하는 함수입니다
	function displayPlaces(places) {

	    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
	    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
	    var order = document.getElementById(currCategory).getAttribute('data-order');

	    

	    for ( var i=0; i<places.length; i++ ) {

	            // 마커를 생성하고 지도에 표시합니다
	            var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);

	            // 마커와 검색결과 항목을 클릭 했을 때
	            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
	            (function(marker, place) {
	                kakao.maps.event.addListener(marker, 'click', function() {
	                    displayPlaceInfo(place);
	                });
	            })(marker, places[i]);
	    }
	}

	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, order) {
	    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
	            spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new kakao.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });

	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

	    return marker;
	}

	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}

	// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
	function displayPlaceInfo (place) {
	    var content = '<div class="placeinfo">' +
	                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   

	    if (place.road_address_name) {
	        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
	                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
	    }  else {
	        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
	    }                
	   
	    content += '    <span class="tel">' + place.phone + '</span>' + 
	                '</div>' + 
	                '<div class="after"></div>';

	    contentNode.innerHTML = content;
	    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
	    placeOverlay.setMap(map);  
	}


	// 각 카테고리에 클릭 이벤트를 등록합니다
	function addCategoryClickEvent() {
	    var category = document.getElementById('category'),
	        children = category.children;

	    for (var i=0; i<children.length; i++) {
	        children[i].onclick = onClickCategory;
	    }
	}

	// 카테고리를 클릭했을 때 호출되는 함수입니다
	function onClickCategory() {
	    var id = this.id,
	        className = this.className;

	    placeOverlay.setMap(null);

	    if (className === 'on') {
	        currCategory = '';
	        changeCategoryClass();
	        removeMarker();
	    } else {
	        currCategory = id;
	        changeCategoryClass(this);
	        searchPlaces();
	    }
	}

	// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
	function changeCategoryClass(el) {
	    var category = document.getElementById('category'),
	        children = category.children,
	        i;

	    for ( i=0; i<children.length; i++ ) {
	        children[i].className = '';
	    }

	    if (el) {
	        el.className = 'on';
	    } 
	}
	
</script>
