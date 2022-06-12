<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title><tiles:insertAttribute name="title"/></title>
	<link rel="icon" href="data:;base64,iVBORw0KGgo=">
	<!-- 구글 폰트 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/icon/bootstrap-icons.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/icofont/icofont.min.css" type="text/css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.0/css/all.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/jquery/css/jquery-ui.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/jquery/css/jquery-ui.theme.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/jquery/css/jquery-ui.structure.min.css" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/util-jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/menu.js"></script>
</head>

<body>

<div class="wrapper">
	<tiles:insertAttribute name="left"/>
	<tiles:insertAttribute name="body"/>
</div>



<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>


<script type="text/javascript">
	let angle = document.querySelectorAll(".fa-angle-down");
	for(let i = 0; i < angle.length; i++) {
		angle[i].addEventListener("click", (e) => {
			let angleParent = e.target.parentElement.parentElement;
			angleParent.classList.toggle("showMenu");
		});
	}
</script>


<script type="text/javascript">
function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data){
			fn(data);
		},
		beforeSend : function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error : function(jqXHR) {
			if (jqXHR.status === 403) {
				location.href="${pageContext.request.contextPath}/member/login";
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패했습니다.");
				return false;
			}
			console.log(jqXHR.responseText);
		}
	});
}

function memberDetail(eMail) { //리스트에서 tr 클릭해서 상세정보 보기
	
	let dlg = $("#detailModal").dialog({
		  autoOpen: false,
		  modal: true,
		  height: 500,
		  width: 830,
		  buttons: {
		       " 닫기 " : function() {
				$(this).dialog("close");
				location.reload();
		    	$(this).css("border", "1px solid red");	
		       }
		  },
		  title: "회원상세정보",
		  close: function(event, ui) {
		  }
	});
	let url = "${pageContext.request.contextPath}/admin/memberManage/detail";
	let query = "eMail="+eMail;
	
	const fn = function(data) {
		$("#detailModal").html(data);
		dlg.dialog("open");		
		//console.log(query);
		//console.log(data);
		$(".ui-dialog-titlebar-close").css("display", "none");
	};
	ajaxFun(url, "post", query, "html", fn);
}
function refreshMemberList() {
	
}

function changeEnabled() {  //전체/활성화/비활성화 셀렉트 박스 움직였을 때
	const f = document.memberListForm;
	f.action = "${pageContext.request.contextPath}/admin/memberManage/main";
	f.submit();
}


function stateDetail() {
	$("#stateDetail").dialog({
		  modal: true,
		  minHeight: 100,
		  maxHeight: 450,
		  width: 750,
		  title: '계정상태 상세',
		  close: function(event, ui) {
			   $(this).dialog("destroy"); // 이전 대화상자가 남아 있으므로 필요
		  }
	});
	console.log();
}

function updateRole() {
	const f = document.infoDetailForm;
	
	let url = "${pageContext.request.contextPath}/admin/memberManage/updateRole";
	let query = $("#infoDetailForm").serialize();

	const fn = function(data) {
		//console.log(data);
		//console.log(data.eMail);
		memberDetail(data.eMail);
	}
		
	ajaxFun(url, "post", query, "json", fn);
}


function stateUpdate(){
	const f = document.stateForm;
	
	let enabled = f.enabled.value;
	let stateCode = f.stateCode.value;
	
	//console.log(enabled);
	//console.log(stateCode);
	//console.log(typeof(stateCode));
	
	if (! stateCode ) {
		f.stateCode.focus();
	} else if (enabled === '1' && stateCode !== '11') {
		alert("계정을 활성화 하는경우에는 <해제>를 선택해주세요.");
		f.stateCode.focus();
	} else if (enabled === '99' && stateCode === '11') {
		alert("계정을 비활성화 하는 경우에는 <해제>이외의 사유를 선택해주세요.");
		f.stateCode.focus();
	}
	
	
	let url = "${pageContext.request.contextPath}/admin/memberManage/updateEnabled";
	let query = $("#stateForm").serialize();
	const fn = function(data) {
 		location.reload();
	}
	ajaxFun(url, "post", query, "json", fn);		
}

function aaaa() {
	alert("?")
}
</script>

</body>
</html>