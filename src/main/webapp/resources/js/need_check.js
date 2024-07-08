/**
 * 입력 항목에 입력되어 있는지 여부를 반환하는 함수
 */
function necessary(){
	var need = true;
	var isChecked = false;
	var isPeriodSelected = false;
	var isBudgetSelected = false;
	
	$('.need').each(function(){
		if( $(this).val()=='' ){
			alert( $(this).attr('title') + ' 입력하세요!' );
			$(this).focus();
			need = false;
			return need;
		}
	});
	
	if (!need) return need;

   // Check checkboxes
    $('.need[type="checkbox"]').each(function(){
        if ($(this).is(':checked')) {
            isChecked = true;
            return false; // Break out of the loop
        }
    });

    if (!isChecked) {
        alert('옵션을 하나 이상 선택하세요!');
        return false;
    }

    // Check radio buttons for budget
    $('.need[name="budget"]').each(function(){
        if ($(this).is(':checked')) {
            isBudgetSelected = true;
            return false; // Break out of the loop
        }
    });

    if (!isBudgetSelected) {
        alert('예산을 선택하세요!');
        return false;
    }

	// Check radio buttons for period
    $('.need[name="limitDate"]').each(function(){
        if ($(this).is(':checked')) {
            isPeriodSelected = true;
            return false; // Break out of the loop
        }
    });

    if (!isPeriodSelected) {
        alert('기간을 선택하세요!');
        return false;
    }

    return true; 
}

//엔터를 누를 경우
$('[name=title]').on('keypress', function(e) {
	if(e.keyCode == 13) {
		if(necessary()) {$('form').submit(); }
		else {return false;}
	}
});