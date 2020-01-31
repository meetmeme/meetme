$(window).on('load', function() {
	if (!$('#user_num1').val())
		return false;
	$.ajax({
		type : 'post',
		url : 'checkNotification.cm',
		dataType : 'text',
		data : {
			'userNum' : $('#user_num1').val()
		},
		success : function(data) {
			if(data > 0){
				$('#userMenuBox').children().css({"border": "2px solid rgba(243,129,129)"}); 
				$('#userMenuBox').children().addClass('blink');
				$('#noticeModaltag').append("<span class='numOfNotice'>"+data+"</span>");
			}
		} // end success
	}); // end ajax
});
$(function() {

	$('input[id="search-dateRange"]').daterangepicker(
			{
				locale : {
					format : "YYYY/MM/DD"
				},
				opens : 'left'
			},
			function(start, end, label) {
				/*console.log(start + " - " + end);*/
				$('#search-dateStart').val(start.format('YYYY-MM-DD'));
				$('#search-dateEnd').val(end.format('YYYY-MM-DD'));
				/*console.log("A new date selection was made: "
						+ start.format('YYYY-MM-DD') + ' to '
						+ end.format('YYYY-MM-DD'));*/
			});
	/* 검색 자동완성 - event */
	$('#searchEventHashtag').autocomplete({
		source : function(request, response) {
			$.ajax({
				type : 'get',
				url : 'getHashtag.wd',
				dataType : 'json',
				data : {
					'param' : $('#searchEventHashtag').val()
				},
				success : function(data) {
					response($.map(data, function(item) {
						return {
							label : item.HASHTAG_TITLE,
							value : item.HASHTAG_TITLE,
							test : item.HASHTAG_NUM
						}
					}) // end map
					)
				} // end success
			}); // end ajax
		}, // end source
		select : function(event, ui) {
			$('#hashtagNum').val(ui.item.test);
			/*console.log($('#hashtagNum').val());*/
			$('#search-category').focus();
			/*
			 * console.log('2 : ' + ui);//사용자가 오토컴플릿이 만들어준 목록에서 선택을 하면 반환되는 객체
			 * console.log('3 : ' + ui.item.label); //김치 볶음밥label console.log('4 : ' +
			 * ui.item.value); //김치 볶음밥 console.log('5 : ' + ui.item.test); //김치
			 * 볶음밥test
			 */
		},// end select
		focus : function(event, ui) {
			return false; // 한글 에러 방지
		},
		minLength : 1,
		autoFocus : true,
		classes : {
			"ui-autocomplete" : "highlight"
		},
		delay : 500,
		position : {
			my : "right top",
			at : "right bottom"
		},
		close : function(event) { // 자동완성창 닫아질때 호출
			/*console.log(event);*/
		}
	});
	/* 검색 자동완성 - minihome */
	$('#searchMinihomeHashtag').autocomplete({
		source : function(request, response) {
			$.ajax({
				type : 'get',
				url : 'getHashtag.wd',
				dataType : 'json',
				data : {
					'param' : $('#searchMinihomeHashtag').val()
				},
				success : function(data) {
					response($.map(data, function(item) {
						return {
							label : item.HASHTAG_TITLE,
							value : item.HASHTAG_TITLE,
							test : item.HASHTAG_NUM
						}
					}) // end map
					)
				} // end success
			}); // end ajax
		}, // end source
		select : function(event, ui) {
			$('#hashtagNumMinihome').val(ui.item.test);
			/*console.log($('#hashtagNum').val());*/
			$('#name').focus();
			/*console.log('2 : ' + ui);// 사용자가 오토컴플릿이 만들어준 목록에서 선택을 하면 반환되는 객체
			console.log('3 : ' + ui.item.label); // 김치 볶음밥label
			console.log('4 : ' + ui.item.value); // 김치 볶음밥
			console.log('5 : ' + ui.item.test); // 김치 볶음밥test
*/		},// end select
		focus : function(event, ui) {
			return false; // 한글 에러 방지
		},
		minLength : 1,
		autoFocus : true,
		classes : {
			"ui-autocomplete" : "highlight"
		},
		delay : 500,
		position : {
			my : "right top",
			at : "right bottom"
		},
		close : function(event) { // 자동완성창 닫아질때 호출
			/*console.log(event);*/
		}
	});

	$('input[name=searchHashtag]').focus(function() {
		$('input[name=searchHashtag]').val('');
		$('#hashtagNum').val('');
	})

	// MESSAGE 친구 자동완성
	$('#receiver').autocomplete({
		source : function(request, response) {
			$.ajax({
				type : 'get',
				url : 'getFriends.cm',
				dataType : 'json',
				data : {
					'param' : $('#receiver').val()
				},
				success : function(data) {
					response($.map(data, function(item) {
						/*console.log(item);*/
						return {
							label : item.user_name + '<' + item.user_id + '>',
							value : item.user_id,
							test : item.user_num
						}
					}) // end map
					)
				} // end success
			}); // end ajax
		}, // end source
		select : function(event, ui) {
			$('#receiver_num').val(ui.item.test);
			/*console.log('2 : ' + ui);// 사용자가 오토컴플릿이 만들어준 목록에서 선택을 하면 반환되는 객체
			console.log('3 : ' + ui.item.label);
			console.log('4 : ' + ui.item.value);
			console.log('5 : ' + ui.item.test);*/

		},// end select
		focus : function(event, ui) {
			return false; // 한글 에러 방지
		},
		minLength : 1,
		autoFocus : true,
		classes : {
			"ui-autocomplete" : "highlight"
		},
		delay : 500,
		position : {
			my : "right top",
			at : "right bottom"
		},
		close : function(event) { // 자동완성창 닫아질때 호출
			/*console.log(event);*/
		}
	});

	$('#userPopupmenu').hide();
	$('#userMenuBox').click(function() {
		$('#userPopupmenu').toggle();
	});

	$('#search-minihome').hide();
	$('#searchType-minihome').click(function() {
		$('#search-minihome').show();
		$('#search-event').hide();
	});
	$('#searchType-event').click(function() {
		$('#search-event').show();
		$('#search-minihome').hide();
	});

	$(window).scroll(function() {
		if ($('#userPopupmenu').attr("style"))
			if ($('#userPopupmenu').attr("style").indexOf('none') < 0) {
				$('#userPopupmenu').hide();
			}
	})

	// 검색 - 해시태그 관련
	$('input[name=searchHashtag]').blur(function searchEvent() {
		if ($('input[name=searchHashtag]').val() != '') {
			if ($('#hashtagNum').val() == '') { // 없는 해시태그 입력한 것
				$.ajax({
					type : 'get',
					url : 'searchHashtag.wd',
					data : {
						'param' : $('input[name=searchHashtag]').val()
					},
					dataType : 'text',
					success : function(data) {
						if (data > 0) {
							$('#hashtagNum').val(data);
						} else {
							$('input[name=searchHashtag]').focus();
						}
					} // end success
				}); // end ajax
			}
		}
	});

	// 검색 창 누르면 카테고리 가져옴
	$('#searchIcon').click(
			function() {
				if (!$('#nino-searchForm').attr('class:contains("open")')) {
					$.ajax({
						type : 'get',
						url : 'getCategory.wd',
						data : {},
						dataType : 'json',
						success : function(data) {
							var selectList = "";
							$.each(data, function(index, item) {
								selectList = selectList + '<option value="'
										+ item.CATEGORY_NUM + '_'
										+ item.CATEGORY_NAME + '">'
										+ item.CATEGORY_NAME + '</option>';
							})
							/*console.log($('#search-category').next());*/
							$('#search-category').append(selectList);
						} // end success
					}); // end ajax
				}
			})

	// 알람 삭제
	$(document).on('click', '.deleteNotice', function() {
		$.ajax({
			type : 'post',
			url : 'deleteNotice.cm',
			dataType : 'json',
			data : {
				'notice_num' : $(this).next().val()
			},
			success : function(data) {
				if (data == 1) {
					getNotificationDiv();
				}
			} // end success
		}); // end ajax
	});
	
	// notice close
	$(document).on('click', '.closeNotice', function() {
		window.location.reload();
	});

	// 유저 메뉴 알람 누르면 알람 가져오기
	$('#noticeModaltag').click(function() {
		getNotificationDiv();
	});

	function getNotificationDiv() {
		$
				.ajax({
					type : 'get',
					url : 'getNotification.cm',
					data : {},
					dataType : 'json',
					success : function(data) {
						if (data.length < 0) {
							$('#noticeModal')
									.append('<h3>NO NOTIFICATION</h3>');
						} else {
							var htmldata = ""
							$('#noticeModal').empty();
							$
									.each(
											data,
											function(index, item) {
												htmldata = htmldata
														+ '<div class="modal-subcontent">'
														+ '	<button type="button" class="close white-text deleteNotice">'
														+ '		<span aria-hidden="true">&times;</span>'
														+ '	</button>'
														+ '	<input type="hidden" value="'
														+ item.NOTICE_NUM
														+ '">'
														+ '	<h5 class="modal-subtitle">'
														+ '		<strong>'
														+ item.NOTICE_TITLE
														+ '</strong> <i>'
														+ item.NOTICE_DATE
														+ '</i>'
														+ '	</h5>'
														+ '	<div class="modal-subbody">'
														+ '		<p>'
														+ item.NOTICE_CONTENT
														+ '</p>' + '	</div>'
														+ '</div>'
											})
							/*console.log(htmldata);*/
							$('#noticeModal').append(htmldata);
						}
					} // end success
				}); // end ajax
	}
});

function check() {
	if (!$('#receiver_num').val()) {
		$('#receiver').val('누구한테 보내실 건가요? 🤔');
		return false;
	} else {
		return true;
	}
}

function checkPw() {
	if ($("#setpassword").val() == $("#setpasswordch").val())
		return true;
	else
		alert('비밀번호를 확인해주세요.');
	return false;

}