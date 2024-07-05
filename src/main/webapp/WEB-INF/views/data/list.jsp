<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>data list jsp</title>
<style type="text/css">
#map {
	position: absolute;
	width: 800px;
	height: 600px;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	border: 3px solid #666;
	display: none;
}

#map-background{
	position: absolute;
	width: 100%;
	height: 100%;
	left: 0;
	top: 0;
	background-color:#000;
	opacity:0.3;
	display: none;
}

/* include/page.jsp의 스타일 가져옴 */
.page_on, .page_off, .page_next, .page_last, .page_first, .page_prev {
	display: inline-block;
	line-height: 30px;
	margin: 0;		
}

.page_on, .page_off {
	min-width:22px;
	padding: 0 5px 2px;
}

.page_next, .page_last, .page_first, .page_prev {
	text-indent: -99999999px;
	border: 1px solid #d0d0d0;
	width: 30px;
}

.page_on {
	border: 1px solid gray;
	background-color: gray;
	color:#FFF;
	font-weight: bold;
}

.page_next { background: url("img/page_next.jpg") center no-repeat; }
.page_last { background: url("img/page_last.jpg") center no-repeat; }
.page_prev { background: url("img/page_prev.jpg") center no-repeat; }
.page_first { background: url("img/page_first.jpg") center no-repeat; }

.list-view, .grid-view { font-size:25px; color:#3367d6; padding-top:3px; }

#list-top ul.common li:not(:last-child) {margin-right: 10px}
#data-list ul.pharmacy li div:first-child { height:25px; }
#data-list ul.pharmacy li div:last-child { font-size:14px; }

/* 수정된 스타일 */
.pharmacy td:nth-child(3),
.pharmacy td:nth-child(4) {
    width: 150px; /* 주소와 홈페이지 칸 너비 줄이기 */
}

.pharmacy td:nth-child(2) {
    width: 300px; /* 회사소개 칸 너비 늘리기 */
}
</style>
</head>
<body>
<h3>JAVALLAR와 협력, 의뢰신청을 한 회사 리스트</h3>
<div id="list-top">
	<ul class="common">
		<li>
			<select id="pageList" class="w-px80">
				<option value="10">10개씩</option>
				<option value="50">50개씩</option>
				<option value="100">100개씩</option>
			</select>
		</li>
		<li class="list-view" >
			<i class="fas fa-list font-img" style="vertical-align:top;"></i>
		</li>
		<li class="grid-view" >
			<i class="fas fa-th font-img" style="vertical-align:top;"></i>
		</li>
	</ul>
</div>

<div id="data-list" style="margin:20px 0 auto"></div>

<div class="btnSet">
	<div class="page-list"></div>
</div>

<div id="map-background"></div>
<div id="map"></div>


<script type="text/javascript">
var viewType="list";

$('.dataOption a').click(function() {
	//이미 선택된 내용에 대해서는 적용하지 않으려면
	if( $(this).hasClass('btn-empty') ) {
		$('.dataOption a').removeClass();
		$(this).addClass('btn-fill');
		var idx = $(this).index();
		$('.dataOption a:not(:eq(' + idx + '))').addClass('btn-empty');
	
		if( idx == 0) { pharmacy_list(1); }
		else { animal_list(); }
	}
});

pharmacy_list(1);
function pharmacy_list(page) {
    $.ajax({
        url: 'data/pharmacy',
        data: { pageNo: page, rows: $('#pageList').val() },
        success: function(data) {
            if (viewType == "list") {
                pharmacy_list_data(data, 0); // pharmacy_list_data 함수를 호출하여 데이터 처리
            } else {
                pharmacy_grid_data(data, 0); // pharmacy_grid_data 함수를 호출하여 데이터 처리
            }

            // makePage(data.count, page); // 페이지네이션 처리 함수 호출
        },
        error: function(text, req) {
            alert(text + " : " + req.status);
        }
    });
}

/*
function makePage( totalList, curPage ) {
	var page = pageInfo(totalList, curPage, pageList, blockPage);
	var tag = '';

	if ( page.curBlock > 1 ) {
		tag += "<a class='page_first' data-page=1>처음</a>"
			+ "<a class='page_prev'data-page=" + (page.beginPage - blockPage) + ">이전</a>";
	}
	
	for(var no=page.beginPage; no <= page.endPage; no++ ) {
		if( no==curPage ) {
			tag += "<span class='page_on'>" + no + "</span>";
		} else {
			tag += "<a class='page_off' data-page=" + no + ">" + no + "</a>";
		}
	}

	if (page.curBlock < page.totalBlock) {
		tag += "<a class='page_next' data-page=" + (page.endPage + 1) + ">다음</a>"
			+ "<a class='page_last' data-page=" + page.totalPage + ">마지막</a>";
	}
	$('.page-list').html(tag);
}

function pageInfo (totalList, curPage, pageList, blockPage) {
	var page = new Object();
	page.totalPage = parseInt(totalList/pageList) + (totalList % pageList == 0 ? 0 : 1);
	page.totalBlock = parseInt(page.totalPage/blockPage) + (page.totalPage % blockPage == 0 ? 0 : 1);
	page.curBlock = parseInt(curPage/blockPage) + (curPage % blockPage == 0 ? 0 : 1);
	page.endPage =  page.curBlock * blockPage;
	page.beginPage = page.endPage - (blockPage - 1);
	if( page.endPage > page.totalPage ) { page.endPage = page.totalPage; }
	return page;
}*/

function animal_list() {

}

//테이블 목록 뷰 → 그리드뷰로 변경
function pharmacy_grid_data(data, type) {
	var tag = "<ul class='pharmacy grid'>";
	if(type == 0) {
		data.each(function(){
				tag += "<li>"
					 	+"<div><a class='map' data-x='" + this.Xpos + "' data-y='" + this.Ypos + "'>" + this.yadmNm +"</a></div>"
					 	+"<div>" + (this.telno ? this.telno : '-') +"</div>"
					 	+"<div>" + this.addr +"</div>"
					 + "</li>";
		});
	} else {
		data.each(function() {
			if( $(this).index() > 0 ) {
				$a = $(this).find('.map');
				tag += "<li>"
					 	+"<div><a class='map' data-x='" + $a.data('x') + "' data-y='" + $a.data('y') + "'>" + $(this).children('td:eq(0)').text() +"</a></div>"
					 	+"<div>" + $(this).children('td:eq(1)').text() +"</div>"
					 	+"<div>" + $(this).children('td:eq(2)').text() +"</div>"
					 + "</li>";
			}
		});
	}

	tag += "</ul>";
	$("#data-list").html( tag );
	$('#data-list ul').css('height', 
			( ( $('.grid li').length % 5 > 0 ? 1 : 0 ) + Math.floor($('.grid li').length / 5) )
			 * $('.grid li').outerHeight(true) - 20);
}

//그리드 뷰 → 테이블 목록 뷰로 변경
function pharmacy_list_data(data, type) {
    var tag = "<table class='pharmacy'>"
            + "<tr>"
                + "<th class='w-px200'>회사명</th>"
                + "<th class='w-px140'>회사소개</th>"
                + "<th>주소</th>"
                + "<th>홈페이지</th>"
            + "</tr>";

    // 'tbVEnterprise' 객체 내부의 'row' 배열에 접근하여 데이터를 처리합니다.
    if (data.tbVEnterprise && data.tbVEnterprise.row) {
    // jQuery의 $.each()를 사용하여 배열을 반복합니다.
    $.each(data.tbVEnterprise.row, function(index, item) {
        var websiteUrl = item.WEBSITE;
        if (websiteUrl && !websiteUrl.startsWith('http://') && !websiteUrl.startsWith('https://')) {
            websiteUrl = 'https://' + websiteUrl;
        }
        
        tag += "<tr>"
            + "<td>" + item.GROUPNAME + "</td>" 
            + "<td>" + item.SUMMARY + "</td>"
            + "<td>" + item.DETAILADDR + "</td>"
            + "<td class='left'><a href='" + websiteUrl + "' target='_blank'>" + websiteUrl + "</a></td>"
            + "</tr>";
    });
}
 else {
        console.error("Invalid data format: Missing 'tbVEnterprise' or 'row' property");
    }
    
    tag += "</table>";
    $("#data-list").html(tag);
}

//$('.map').click(function(){  }); 페이지가 다 로딩되기전에 준비되는 함수라 작동이 안될수 있다.
$(document).on('click', '.page-list a', function(){
	pharmacy_list( $(this).data('page') );

}).on('click', '.list-view', function(){
	if( viewType == 'grid' ) {
		viewType="list";
		pharmacy_list_data($('.grid li'), 1);
	}

}).on('click', '.grid-view', function(){
	if( viewType=='list') {
		viewType="grid";
		pharmacy_grid_data( $('.pharmacy tr'), 1);
	}
	
}).on("change", "#pageList", function(){
	pageList = $(this).val();
	pharmacy_list(1);

}).on("click", ".map", function() { //이런 형태로 작성해야한다.
	if( $(this).data('y') == 'undefined' || $(this).data('x') == 'undefined') {
		alert("위경도가 지원되지 않아 지도에 표시할 수 없습니다!");
		return;
	}
	
	$("#map, #map-background").css("display", "block");
	//developers.google.com/maps/documentation/javascript/overview?_ga=2.124987530.1447651499.1595900798-1296965659.1595900772&hl=ko 구글 맵 플랫폼 자바스크립트 api
	//var pos = {lat: $(this).data('y'), lng: $(this).data('x')}
	var pos = {lat: Number($(this).data('y')), lng: Number($(this).data('x'))} //latitude : Xpos, 위도 longitude : Ypos, 경도
	var map = new google.maps.Map(document.getElementById('map'), {
	  center: pos,	
	  zoom: 17
	});

	/*
	new google.maps.Marker({
		map:map, position: pos, title:$(this).text()
	});
	*/

	var info = new google.maps.InfoWindow();
	info.setOptions({
		content:"<div>" + $(this).text() + "</div>"
	});
	
	info.open(map, new google.maps.Marker({
		map:map, position: pos
	}));
});

$('#map-background').click(function() {
	$("#map, #map-background").css("display", "none");
});

var pageList = 100, blockPage = 10; //페이지당 보여질 목록 수, 블럭당 보여질 페이지 수


</script>

<!-- key=구글 API 키 -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCsrerDHJrp9Wu09Ij7MUELxCTPiYfxfBI">
</script>
</body>
</html>