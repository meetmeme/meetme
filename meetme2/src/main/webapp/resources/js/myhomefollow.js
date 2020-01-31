/*$(document).ready(function() {

	$('.articleThumb').click(function() {
		location.href = "event.main";
	});

});*/

function follow(user_num, user_name) {
	console.log("도는지 보자");
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
