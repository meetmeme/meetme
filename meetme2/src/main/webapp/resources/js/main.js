/*$(document).ready(function() {

	$('.articleThumb').click(function() {
		location.href = "event.main";
	});

});*/

function follow(user_num, user_name) {
	if (!$('#userIdCache').val())
		return false;
	$.ajax({
		type : 'get',
		url : 'follow.us',
		data : {
			'following' : user_num,
		},
		dataType : 'json',
		success : function(data) {
			if (data == 1) {
				alert('💡' + user_name + '님을 팔로우 하였습니다💡');
			} else if (data <= 0) {
				alert('💡' + user_name + '님을 이미 팔로우 하고있습니다😅');
			}
		} // end success
	}); // end ajax
}

var minihome_check;
function minihome(user_id, user_num, user_name, check) {
	if (check == 'mh_popup') {
		if (minihome_check == 1) {
			minihome_check = 0;
			return false;
		} else {
			mh_popup(user_id);
		}
	} else if (check == 'follow') {
		follow(user_num, user_name);
		minihome_check = 1;
		if ($('#user_num1').val()<=0) {
			$('#header_nav').children(1).children(1)[0].click();
		}

	}

}

function searchEvent_main(){
	$('.nino-search')[0].click();
}