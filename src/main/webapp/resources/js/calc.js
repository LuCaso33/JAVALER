jQuery(document).ready(function ($) {
    // 라디오 버튼과 체크박스의 변경 이벤트를 모두 처리합니다.
    $("input[type=radio], input[type=checkbox]").change(function() {
        var totalPrice = 0;
        
        // 선택된 라디오 버튼과 체크박스를 모두 포함하여 각각의 값을 계산합니다.
        $('input[type=radio]:checked, input[type=checkbox]:checked').each(function() {
            totalPrice += parseInt($(this).attr('ahg_item_price'), 10);
        });

        // 계산된 총 가격을 화면에 표시합니다.
        $("#price span").text(totalPrice);    
    });
});
