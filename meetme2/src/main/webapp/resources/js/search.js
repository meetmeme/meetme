function searchEventLoginCheck(event_num) {
	if ($('#user_num1').val() <= 0) {
		$('#header_nav').children(1).children(1)[0].click();
	}
	else{
		location.href='event.main?event='+event_num;
	}
}
