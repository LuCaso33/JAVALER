<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>견적 확인</title>
    <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/4.5.0/minty/bootstrap.min.css"> -->
    <style>
        body {
          background-color: #ECF0F1	;
        }
        .container {
          margin: 100px auto; /* 마진 크기를 100px로 줄임 */
          max-width: 800px; /* 최대 너비를 800px로 조정 */
          border-width: 2px; /* 보더 두께를 2px로 설정 */
          padding: 20px; /* 컨테이너 내부 패딩 추가 */
        }
      </style>
      <style>
        body {
          font-family: Arial, sans-serif;
          background-color: #ffffff;
        }
  
        .ahg_Quotation_category {
          margin-bottom: 20px;
        }
  
        .ahg_category_title {
          font-size: 1.5em;
          margin-bottom: 10px;
        }
  
        .ahg_btn_wrap {
          list-style-type: none;
          padding: 0;
          display: flex;
          flex-wrap: wrap;
        }
  
        .ahg_btn_wrap li {
          width: 30%; /* Adjust the width to your preference */
          margin: 10px;
          box-sizing: border-box;
        }
  
        .ahg_item_button {
          padding: 10px;
          border: 1px solid #ddd;
          border-radius: 5px;
          text-align: left;
          cursor: pointer;
          transition: background-color 0.3s ease, border-color 0.3s ease;
          height: 100%;
          display: block;
        }
  
        .ahg_item_button:hover {
          background-color: #f0f0f0;
        }
  
        .ahg_item_name {
          font-size: 1.2em;
          margin-bottom: 5px;
        }
  
        .ahg_item_price {
          font-size: 1.1em;
          color: #e74c3c;
          margin-bottom: 5px;
        }
  
        .ahg_item_ex {
          font-size: 0.9em;
          color: #777;
        }
  
        input[type="radio"] {
          display: none;
        }
  
        input[type="checkbox"] {
          display: none;
        }
  
        input[type="radio"]:checked + label {
          border-color: #3498db;
        }
  
        input[type="checkbox"]:checked + label {
          border-color: #27ae60;
        }
  
        .ahg_btn_wrap li {
          display: flex;
        }
  
        .ahg_item_button {
          flex: 1;
          display: flex;
          flex-direction: column;
          justify-content: space-between;
        }
  
        .modal-content {
          text-align: center; /* 예상 견적서를 가운데 정렬 */
      }
  
      .total-price-container {
          margin-top: 20px; /* Total price와 저장하기 버튼 사이 여백 추가 */
          padding-top: 10px; /* Total price의 상단 여백 */
          border-top: 1px solid #888; /* Total price와 아래 구분선 추가 */
          display: flex;
          justify-content: space-between;
          align-items: center; /* 세로 가운데 정렬 */
          width: 100%;
      }
  
      #totalPriceWrapper {
          margin-left: auto; /* Total Price: 텍스트를 오른쪽으로 밀어내기 */
      }
  
      #totalPrice {
          text-align: right; /* Total Price의 가격을 오른쪽 정렬 */
      }
      </style>
      <!--모달창-->
      <style>
        /* 모달창 스타일 */
        .modal {
            display: none; 
            position: fixed; 
            z-index: 1; 
            left: 0;
            top: 0;
            width: 100%; 
            height: 100%; 
            overflow: auto; 
            background-color: rgba(0,0,0,0.4); 
            padding-top: 60px; 
        }
    
        .modal-content {
            background-color: #fefefe;
            margin: 5% auto; 
            padding: 20px;
            border: 1px solid #888;
            width: 80%; 
            max-width: 600px; 
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            border-radius: 10px;
            position: relative; /* 부모로부터 상대 위치 설정 */
        }
    
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
    
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    
        .modal-content table {
            width: 100%;
            border-collapse: collapse;
        }
    
        .modal-content th, .modal-content td {
            border: 1px solid #ddd;
            padding: 8px;
        }
    
        .modal-content th {
            background-color: #f2f2f2;
            text-align: left;
        }
    
        .modal-content tr:nth-child(even) {
            background-color: #f9f9f9;
        }
    
        .modal-content tr:hover {
            background-color: #ddd;
        }
    
        #captureButton {
            position: absolute; /* 절대 위치 설정 */
            bottom: 10px;
            left: 10px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
    
        #captureButton:hover {
            background-color: #45a049;
        }
      </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const buttons = document.querySelectorAll('.ahg_item_button');
        
            buttons.forEach(button => {
                button.addEventListener('click', function() {
                    const radio = this.querySelector('input[type="radio"]');
                    const checkbox = this.querySelector('input[type="checkbox"]');
        
                    if (radio) {
                        // Handle radio buttons
                        if (!radio.checked) {
                            radio.checked = true;
                            const groupName = radio.name;
                            const groupLabels = document.querySelectorAll(`input[name="${groupName}"] + label`);
                            groupLabels.forEach(label => {
                                label.parentElement.classList.remove('selected');
                            });
                            this.classList.add('selected');
                        }
                    } else if (checkbox) {
                        // Handle checkboxes
                        checkbox.checked = !checkbox.checked;
                        if (checkbox.checked) {
                            this.classList.add('selected');
                        } else {
                            this.classList.remove('selected');
                        }
                    }
                });
            });
        });
          </script>
          
      <!--모달창 출력 스크립트-->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
      <script>
      document.addEventListener('DOMContentLoaded', function() {
          const buttons = document.querySelectorAll('.ahg_item_button');
      
          buttons.forEach(button => {
              button.addEventListener('click', function() {
                  const radio = this.querySelector('input[type="radio"]');
                  const checkbox = this.querySelector('input[type="checkbox"]');
      
                  if (radio) {
                      if (!radio.checked) {
                          radio.checked = true;
                          const groupName = radio.name;
                          const groupLabels = document.querySelectorAll(`input[name="${groupName}"] + label`);
                          groupLabels.forEach(label => {
                              label.parentElement.classList.remove('selected');
                          });
                          this.classList.add('selected');
                      }
                  } else if (checkbox) {
                      checkbox.checked = !checkbox.checked;
                      if (checkbox.checked) {
                          this.classList.add('selected');
                      } else {
                          this.classList.remove('selected');
                      }
                  }
              });
          });
      
          document.getElementById('showTotal').addEventListener('click', function() {
              const selectedItems = document.querySelectorAll('input:checked + label');
              let total = 0;
              let itemsHTML = '<table class="selected-items-table"><tr><th>순번</th><th>항목명</th><th>가격</th></tr>';

              selectedItems.forEach((label, index) => {
                  const name = label.querySelector('.ahg_item_name').innerText;
                  const price = parseInt(label.querySelector('.ahg_item_price span').innerText, 10);
                  total += price;
                  itemsHTML += '<tr><td>' + (index + 1) + '</td><td>' + name + '</td><td>' + price + '만 원</td></tr>';
              });

              itemsHTML += '</table>';

              document.getElementById('selectedItems').innerHTML = itemsHTML;
              document.getElementById('totalPrice').innerText = total + '만 원';
              document.getElementById('myModal').style.display = 'block';

              // Create Print button
              const captureButton = document.createElement('button');
              captureButton.setAttribute('id', 'captureButton');
              captureButton.textContent = 'Print';
              captureButton.addEventListener('click', function() {
                  html2canvas(document.querySelector('.modal-content'), { // Capture 'modal-content' instead of 'myModal'
                      onrendered: function(canvas) {
                          const link = document.createElement('a');
                          link.download = 'modal_capture.png';
                          link.href = canvas.toDataURL();
                          link.click();
                      }
                  });
              });

              // Append Print button to modal content
              const modalContent = document.querySelector('.modal-content');
              modalContent.appendChild(captureButton);
          });
      
          document.querySelector('.close').addEventListener('click', function() {
              document.getElementById('myModal').style.display = 'none';
          });
      
          window.addEventListener('click', function(event) {
              if (event.target === document.getElementById('myModal')) {
                  document.getElementById('myModal').style.display = 'none';
              }
          });
      });
      
      </script>
</head>
<body>
<div class="container">
    <h1>글로벌인은 견적서도 1분만에</h1>
    <form id="form_calc">

        <div class="ahg_Quotation_category">
          <p class="ahg_category_title">지원 버전</p>
          <ul class="ahg_btn_wrap">
              <li>
                  <input type="radio" name="지원 버전" id="지원 버전_PC 단일 제작 _0_0" ahg_item_name="PC 단일 제작 " ahg_item_price="200" ahg_item_ex="PC 버전 디자인 + 개발" ahg_item_tb_ex="PC 버전 디자인 + 개발">
                  <label for="지원 버전_PC 단일 제작 _0_0" class="ahg_item_button">
                      <p class="ahg_item_name">PC 단일 제작 </p>
                      <p class="ahg_item_price"><span>200</span>만 원</p>
                      <p class="ahg_item_ex">PC 버전 디자인 + 개발</p>
                  </label>
              </li>
              <li>
                  <input type="radio" name="지원 버전" id="지원 버전_반응형 제작_0_1" ahg_item_name="반응형 제작" ahg_item_price="250" ahg_item_ex="PC+모바일 버전 디자인 + 개발" ahg_item_tb_ex="PC+모바일 버전 디자인 + 개발">
                  <label for="지원 버전_반응형 제작_0_1" class="ahg_item_button">
                      <p class="ahg_item_name">반응형 제작</p>
                      <p class="ahg_item_price"><span>250</span>만 원</p>
                      <p class="ahg_item_ex">PC+모바일 버전 디자인 + 개발</p>
                  </label>
              </li>
          </ul>
        </div>
  
        <div class="ahg_Quotation_category">
          <p class="ahg_category_title">희망 메뉴 수 <span>(메인 포함)</span></p>
          <ul class="ahg_btn_wrap">
              <li>
                  <input type="radio" name="희망 메뉴 수 <span>(메인 포함)</span>" id="희망 메뉴 수 <span>(메인 포함)</span>_메뉴 1개 (메인 랜딩페이지) _1_0" ahg_item_name="메뉴 1개 (메인 랜딩페이지)" ahg_item_price="0" ahg_item_ex="1개 페이지 제작" ahg_item_tb_ex="1개 페이지 제작">
                  <label for="희망 메뉴 수 <span>(메인 포함)</span>_메뉴 1개 (메인 랜딩페이지) _1_0" class="ahg_item_button">
                      <p class="ahg_item_name">메뉴 1개 (메인 랜딩페이지)</p>
                      <p class="ahg_item_price"><span>0</span>만 원</p>
                      <p class="ahg_item_ex">1개 페이지 제작</p>
                  </label>
              </li>
              <li>
                  <input type="radio" name="희망 메뉴 수 <span>(메인 포함)</span>" id="희망 메뉴 수 <span>(메인 포함)</span>_메뉴 5개 이하 _1_1" ahg_item_name="메뉴 5개 이하" ahg_item_price="50" ahg_item_ex="2~5개 페이지 제작" ahg_item_tb_ex="2~5개 페이지 제작">
                  <label for="희망 메뉴 수 <span>(메인 포함)</span>_메뉴 5개 이하 _1_1" class="ahg_item_button">
                      <p class="ahg_item_name">메뉴 5개 이하</p>
                      <p class="ahg_item_price"><span>50</span>만 원</p>
                      <p class="ahg_item_ex">2~5개 페이지 제작</p>
                  </label>
              </li>
              <li>
                  <input type="radio" name="희망 메뉴 수 <span>(메인 포함)</span>" id="희망 메뉴 수 <span>(메인 포함)</span>_메뉴 10개 이하 _1_2" ahg_item_name="메뉴 10개 이하" ahg_item_price="100" ahg_item_ex="6~10개 페이지 제작" ahg_item_tb_ex="6~10개 페이지 제작">
                  <label for="희망 메뉴 수 <span>(메인 포함)</span>_메뉴 10개 이하 _1_2" class="ahg_item_button">
                      <p class="ahg_item_name">메뉴 10개 이하</p>
                      <p class="ahg_item_price"><span>100</span>만 원</p>
                      <p class="ahg_item_ex">6~10개 페이지 제작</p>
                  </label>
              </li>
              <li>
                  <input type="radio" name="희망 메뉴 수 <span>(메인 포함)</span>" id="희망 메뉴 수 <span>(메인 포함)</span>_메뉴 15개 이하_1_3" ahg_item_name="메뉴 15개 이하" ahg_item_price="150" ahg_item_ex="11~20개 페이지 제작" ahg_item_tb_ex="11~20개 페이지 제작">
                  <label for="희망 메뉴 수 <span>(메인 포함)</span>_메뉴 15개 이하_1_3" class="ahg_item_button">
                      <p class="ahg_item_name">메뉴 15개 이하</p>
                      <p class="ahg_item_price"><span>150</span>만 원</p>
                      <p class="ahg_item_ex">11~20개 페이지 제작</p>
                  </label>
              </li>
          </ul>
        </div>
  
        <div class="ahg_Quotation_category">
          <p class="ahg_category_title">기획 필요 항목</p>
          <ul class="ahg_btn_wrap">
            <li>
              <input type="radio" name="기획 필요 항목" id="기획 필요 항목_기획 불필요_2_0" ahg_item_name="기획 불필요" ahg_item_price="0" ahg_item_ex="문구 및 각 페이지 내 배치까지 상세하게 준비되어 있어요" ahg_item_tb_ex="-">
              <label for="기획 필요 항목_기획 불필요_2_0" class="ahg_item_button">
                <p class="ahg_item_name">기획 불필요</p>
                <p class="ahg_item_price"><span>0</span>만 원</p>
                <p class="ahg_item_ex">문구 및 각 페이지 내 배치까지 상세하게 준비되어 있어요</p>
              </label>
            </li>
            <li>
              <input type="radio" name="기획 필요 항목" id="기획 필요 항목_카피라이팅 + 레이아웃 기획 _2_1" ahg_item_name="카피라이팅 + 레이아웃 기획 " ahg_item_price="30" ahg_item_ex="메뉴 구조 및 각 메뉴에 들어갈 내용이 준비되어 있어요" ahg_item_tb_ex="와이어프레임, 카피라이팅 기획">
              <label for="기획 필요 항목_카피라이팅 + 레이아웃 기획 _2_1" class="ahg_item_button">
                <p class="ahg_item_name">카피라이팅 + 레이아웃 기획 </p>
                <p class="ahg_item_price"><span>30</span>만 원</p>
                <p class="ahg_item_ex">메뉴 구조 및 각 메뉴에 들어갈 내용이 준비되어 있어요</p>
              </label>
            </li>
            <li>
              <input type="radio" name="기획 필요 항목" id="기획 필요 항목_세부 기획 + 카피라이팅 + 레이아웃 기획 _2_2" ahg_item_name="세부 기획 + 카피라이팅 + 레이아웃 기획 " ahg_item_price="50" ahg_item_ex="메뉴 구조 및 각 메뉴에 들어갈 내용을 구상은 해뒀어요" ahg_item_tb_ex="와이어프레임, 스토리보드, 카피라이팅 기획">
              <label for="기획 필요 항목_세부 기획 + 카피라이팅 + 레이아웃 기획 _2_2" class="ahg_item_button">
                <p class="ahg_item_name">세부 기획 + 카피라이팅 + 레이아웃 기획 </p>
                <p class="ahg_item_price"><span>50</span>만 원</p>
                <p class="ahg_item_ex">메뉴 구조 및 각 메뉴에 들어갈 내용을 구상은 해뒀어요</p>
              </label>
            </li>
            <li>
              <input type="radio" name="기획 필요 항목" id="기획 필요 항목_메뉴 구조부터 전체 기획 _2_3" ahg_item_name="메뉴 구조부터 전체 기획 " ahg_item_price="100" ahg_item_ex="아직 정해진 게 없어서 같이 의논하고 싶어요" ahg_item_tb_ex="정보구조도, 와이어프레임, 스토리보드, 카피라이팅 기획 ">
              <label for="기획 필요 항목_메뉴 구조부터 전체 기획 _2_3" class="ahg_item_button">
                <p class="ahg_item_name">메뉴 구조부터 전체 기획 </p>
                <p class="ahg_item_price"><span>100</span>만 원</p>
                <p class="ahg_item_ex">아직 정해진 게 없어서 같이 의논하고 싶어요</p>
              </label>
            </li>
          </ul>
        </div>
  
        <div class="ahg_Quotation_category">
          <p class="ahg_category_title">이미지(필요 항목 사진, 일러스트, 그래프 표 등)</p>
          <ul class="ahg_btn_wrap">
              <li>
                  <input type="radio" name="이미지" id="이미지_무/유료 이미지 서치" ahg_item_name="무/유료 이미지 서치" ahg_item_price="10">
                  <label for="이미지_무/유료 이미지 서치" class="ahg_item_button">
                      <p class="ahg_item_name">무/유료 이미지 서치</p>
                      <p class="ahg_item_price"><span>10</span>만 원</p>
                  </label>
              </li>
              <li>
                  <input type="radio" name="이미지" id="이미지_자체 이미지 제작" ahg_item_name="자체 이미지 제작" ahg_item_price="20">
                  <label for="이미지_자체 이미지 제작" class="ahg_item_button">
                      <p class="ahg_item_name">자체 이미지 제작</p>
                      <p class="ahg_item_price"><span>20</span>만 원</p>
                  </label>
              </li>
              <li>
                  <input type="radio" name="이미지" id="이미지_그래프 등 시각자료 자체 제작" ahg_item_name="그래프 등 시각자료 자체 제작" ahg_item_price="30">
                  <label for="이미지_그래프 등 시각자료 자체 제작" class="ahg_item_button">
                      <p class="ahg_item_name">그래프 등 시각자료 자체 제작</p>
                      <p class="ahg_item_price"><span>30</span>만 원</p>
                  </label>
              </li>
          </ul>
        </div>
  
        <div class="ahg_Quotation_category">
          <p class="ahg_category_title">기능</p>
          <ul class="ahg_btn_wrap">
              <li>
                  <input type="checkbox" name="기능" id="기능_문의품 접수 기능" ahg_item_name="문의품 접수 기능" ahg_item_price="5">
                  <label for="기능_문의품 접수 기능" class="ahg_item_button">
                      <p class="ahg_item_name">문의품 접수 기능</p>
                      <p class="ahg_item_price"><span>5</span>만 원</p>
                  </label>
              </li>
              <li>
                  <input type="checkbox" name="기능" id="기능_게시판 기능" ahg_item_name="게시판 기능" ahg_item_price="10">
                  <label for="기능_게시판 기능" class="ahg_item_button">
                      <p class="ahg_item_name">게시판 기능</p>
                      <p class="ahg_item_price"><span>10</span>만 원</p>
                  </label>
              </li>
              <li>
                  <input type="checkbox" name="기능" id="기능_회원가입, 로그인 기능" ahg_item_name="회원가입, 로그인 기능" ahg_item_price="5">
                  <label for="기능_회원가입, 로그인 기능" class="ahg_item_button">
                      <p class="ahg_item_name">회원가입, 로그인 기능</p>
                      <p class="ahg_item_price"><span>5</span>만 원</p>
                  </label>
              </li>
              <li>
                  <input type="checkbox" name="기능" id="기능_소셜 로그인 기능" ahg_item_name="소셜 로그인 기능" ahg_item_price="5">
                  <label for="기능_소셜 로그인 기능" class="ahg_item_button">
                      <p class="ahg_item_name">소셜 로그인 기능</p>
                      <p class="ahg_item_price"><span>5</span>만 원</p>
                  </label>
              </li>
              <li>
                  <input type="checkbox" name="기능" id="기능_등급에 따른 권한부여 기능" ahg_item_name="등급에 따른 권한부여 기능" ahg_item_price="10">
                  <label for="기능_등급에 따른 권한부여 기능" class="ahg_item_button">
                      <p class="ahg_item_name">등급에 따른 권한부여 기능</p>
                      <p class="ahg_item_price"><span>10</span>만 원</p>
                  </label>
              </li>
              <li>
                  <input type="checkbox" name="기능" id="기능_인스타그램 연동 기능" ahg_item_name="인스타그램 연동 기능" ahg_item_price="5">
                  <label for="기능_인스타그램 연동 기능" class="ahg_item_button">
                      <p class="ahg_item_name">인스타그램 연동 기능</p>
                      <p class="ahg_item_price"><span>5</span>만 원</p>
                  </label>
              </li>
              <li>
                  <input type="checkbox" name="기능" id="기능_쇼핑몰 기능" ahg_item_name="쇼핑몰 기능" ahg_item_price="10">
                  <label for="기능_쇼핑몰 기능" class="ahg_item_button">
                      <p class="ahg_item_name">쇼핑몰 기능</p>
                      <p class="ahg_item_price"><span>10</span>만 원</p>
                  </label>
              </li>
              <li>
                  <input type="checkbox" name="기능" id="기능_카드 결제 기능" ahg_item_name="카드 결제 기능" ahg_item_price="10">
                  <label for="기능_카드 결제 기능" class="ahg_item_button">
                      <p class="ahg_item_name">카드 결제 기능</p>
                      <p class="ahg_item_price"><span>10</span>만 원</p>
                  </label>
              </li>
              <li>
                  <input type="checkbox" name="기능" id="기능_공유 기능" ahg_item_name="공유 기능" ahg_item_price="5">
                  <label for="기능_공유 기능" class="ahg_item_button">
                      <p class="ahg_item_name">공유 기능</p>
                      <p class="ahg_item_price"><span>5</span>만 원</p>
                  </label>
              </li>
              <li>
                  <input type="checkbox" name="기능" id="기능_알림 기능" ahg_item_name="알림 기능" ahg_item_price="10">
                  <label for="기능_알림 기능" class="ahg_item_button">
                      <p class="ahg_item_name">알림 기능</p>
                      <p class="ahg_item_price"><span>10</span>만 원</p>
                  </label>
              </li>
              <li>
                  <input type="checkbox" name="기능" id="기능_지도 기능" ahg_item_name="지도 기능" ahg_item_price="5">
                  <label for="기능_지도 기능" class="ahg_item_button">
                      <p class="ahg_item_name">지도 기능</p>
                      <p class="ahg_item_price"><span>5</span>만 원</p>
                  </label>
              </li>
              <li>
                  <input type="checkbox" name="기능" id="기능_검색 기능" ahg_item_name="검색 기능" ahg_item_price="5">
                  <label for="기능_검색 기능" class="ahg_item_button">
                      <p class="ahg_item_name">검색 기능</p>
                      <p class="ahg_item_price"><span>5</span>만 원</p>
                  </label>
              </li>
              <li>
                  <input type="checkbox" name="기능" id="기능_예약 기능" ahg_item_name="예약 기능" ahg_item_price="10">
                  <label for="기능_예약 기능" class="ahg_item_button">
                      <p class="ahg_item_name">예약 기능</p>
                      <p class="ahg_item_price"><span>10</span>만 원</p>
                  </label>
              </li>
              <li>
                  <input type="checkbox" name="기능" id="기능_다운로드 기능" ahg_item_name="다운로드 기능" ahg_item_price="5">
                  <label for="기능_다운로드 기능" class="ahg_item_button">
                      <p class="ahg_item_name">다운로드 기능</p>
                      <p class="ahg_item_price"><span>5</span>만 원</p>
                  </label>
              </li>
              <li>
                  <input type="checkbox" name="기능" id="기능_지원 기능" ahg_item_name="지원 기능" ahg_item_price="5">
                  <label for="기능_지원 기능" class="ahg_item_button">
                      <p class="ahg_item_name">지원 기능</p>
                      <p class="ahg_item_price"><span>5</span>만 원</p>
                  </label>
              </li>
          </ul>
        </div>
      
        <div class="ahg_Quotation_category">
          <p class="ahg_category_title">지원 언어</p>
          <ul class="ahg_btn_wrap">
              <li>
                  <input type="radio" name="지원 언어" id="지원 언어_지원 언어 2개" ahg_item_name="지원 언어 2개" ahg_item_price="60">
                  <label for="지원 언어_지원 언어 2개" class="ahg_item_button">
                      <p class="ahg_item_name">지원 언어 2개</p>
                      <p class="ahg_item_price"><span>60</span>만 원</p>
                  </label>
              </li>
              <li>
                  <input type="radio" name="지원 언어" id="지원 언어_지원 언어 3개" ahg_item_name="지원 언어 3개" ahg_item_price="120">
                  <label for="지원 언어_지원 언어 3개" class="ahg_item_button">
                      <p class="ahg_item_name">지원 언어 3개</p>
                      <p class="ahg_item_price"><span>120</span>만 원</p>
                  </label>
              </li>
              <li>
                  <input type="radio" name="지원 언어" id="지원 언어_지원 언어 4개" ahg_item_name="지원 언어 4개" ahg_item_price="180">
                  <label for="지원 언어_지원 언어 4개" class="ahg_item_button">
                      <p class="ahg_item_name">지원 언어 4개</p>
                      <p class="ahg_item_price"><span>180</span>만 원</p>
                  </label>
              </li>
          </ul>
        </div>
  
              <div id="price" class="alert alert-info mt-3">Total Price: <span >0</span> 만원 </div>
      <div>
          <button type="button" id="showTotal">총 견적서 확인</button>
      </div>
          </form>
</div>

<!-- 모달 창 HTML은 아래와 같이 추가합니다 -->
<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
          <h2>예상 견적서</h2>
          <div id="selectedItems"></div>
          <div class="total-price-container">
              <div id="totalPriceWrapper">
                  <h3>Total Price : </h3>
              </div>
              <h3 id="totalPrice"><span></span></h3> <!-- Total Price의 가격을 우측에 정렬 -->
          </div>
    </div>
</div>

<!-- JQuery -->
<script src="https://code.jquery.com/jquery.js"></script>	<!-- calc -->
<script src="js/calc.js"></script>

</body>
</html>
