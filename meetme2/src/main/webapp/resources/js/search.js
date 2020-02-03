function searchEvent(event_num) {
	if (!$('#userIdCache').val()) {
		$('#header_nav').children(1).children(1)[0].click();
		return false;
	}
	else{
		location.href="event.main?event="+event_num
	}
}
