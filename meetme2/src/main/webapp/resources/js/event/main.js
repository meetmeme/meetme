jQuery(document).ready(function($) {

	'use strict';


	/************** Toggle *********************/
    // Cache selectors
    var lastId,
        topMenu = $(".menu-first"),
        topMenuHeight = 50,
        // All list items
        menuItems = topMenu.find("a"),
        // Anchors corresponding to menu items
        scrollItems = menuItems.map(function(){
          
          if($(this).hasClass('external')) {
            return;
          }
            
          var item = $($(this).attr("href"));
          if (item.length) { return item; }
        });

    // Bind click handler to menu items
    // so we can get a fancy scroll animation
    menuItems.click(function(e){
      var href = $(this).attr("href"),
          offsetTop = href === "#" ? 0 : $(href).offset().top-topMenuHeight+1;
      $('html, body').stop().animate({ 
          scrollTop: offsetTop
      }, 300);
      e.preventDefault();
    });

    // Bind to scroll
    $(window).scroll(function(){
       // Get container scroll position
       var fromTop = $(this).scrollTop()+topMenuHeight;
       
       // Get id of current scroll item
       var cur = scrollItems.map(function(){
         if ($(this).offset().top < fromTop)
           return this;
       });
       // Get the id of the current element
       cur = cur[cur.length-1];
       var id = cur && cur.length ? cur[0].id : "";
       
       if (lastId !== id) {
           lastId = id;
           // Set/remove active class
           menuItems
             .parent().removeClass("active")
             .end().filter("[href=#"+id+"]").parent().addClass("active");
       }                   
    });



    $(window).scroll(function(){
         $('.main-header').toggleClass('scrolled', $(this).scrollTop() > 1);
     });



    $('a[href="#top"]').click(function(){
        $('html, body').animate({scrollTop: 0}, 'slow');
        return false;
    });


    $('.flexslider').flexslider({
      slideshow: true,
      slideshowSpeed: 3000,  
      animation: "fade",
      directionNav: false,
    });


    $('.toggle-menu').click(function(){
        $('.menu-first').toggleClass('show');
        // $('.menu-first').slideToggle();
    });

    $('.menu-first li a').click(function(){
      $('.menu-first').removeClass('show');
    });

//    $('#writeBtn').click(function(){
//    	$.ajax({
//			type : "post",
//			url : "writeComment.event",
//			data : {"content" : $('#writeChat').val(),
//					"event_num" : $('#event_num').val()
//				},
//			success : function(result){
//				$('#content').val('');
////				if(result == 1){
////					getList();
////				}
//				alert('등록되었습니다.');
//				window.location.reload();
//			}
//		});
//    });
    
    $('.chat').scrollTop($('.chat')[0].scrollHeight);
    
    
  // 수정
    var num;
    $('.comUpdate').click(function(){
		var before = $(this).prev().val(); //선택한 내용을 가져옵니다.
		$('#writeChat').focus().val(before); //textarea에 수정 전 내용을 보여줍니다.
		num = $(this).next().val(); //수정할 댓글 번호를 저장합니다.
		$('#writeBtn').text("수정"); //등록 버튼의 라벨을 '수정완료'로 변경합니다.
	})
	
	// 삭제
	$('.comDelete').click(function(){
		var result = confirm("댓글을 삭제하시겠어요?");
		if(result){
			var num = $(this).prev().val(); //댓글번호 
			console.log("com num = "+ num);
			
			$.ajax({
				type : "post",
				url : "comDelete.event",
				data : {"num" : num},
				success : function(result) {
					
					if(result == 1) {
						window.location.reload();
					}
				}
			});			
			
		    alert("삭제되었습니다.");
		    
		}else{
		    return false;
		}
	});	
    
    //등록 또는 수정완료 버튼 클릭한 경우
	//버튼의 라벨이 '등록'인 경우는 댓글을 추가하는 경우
	//버튼의 라벨이 '수정완료'인 경우는 댓글을 수정하는 경우
	$('#writeBtn').click(function(){		
		var buttonText = $('#writeBtn').text(); //버튼의 라벨로 add할지 update 할지 파악
		var content = $('#writeChat').val();
		var url, data, mess;
		if(buttonText == "등록") { //댓글 추가하는 경우
			url = "writeComment.event";
			data = {"content" : $('#writeChat').val(),
					"event_num" : $('#event_num').val()
					};
			mess = "등록되었습니다.";
		} else {				//댓글 수정하는 경우
			url = "comUpdate.event";
			data = {"num" : num,
					"content" : content};
			mess = "수정되었습니다.";
			$('#write').text('등록'); //다시 등록으로 변경
			
		}
		
		$.ajax({
			type : "post",
			url : url,
			data : data,
			success : function(result){
				$('#content').val('');
				alert(mess);
				window.location.reload();
			}
		});
	});

    /************** LightBox *********************/
      $(function(){
        $('[data-rel="lightbox"]').lightbox();
      });
      
     // 상단 이동시 사라짐. 하단바 이동
  	$(window).scroll(function(){
		if ($(this).scrollTop() > 300) {
			$('#foot').fadeIn();
		} else {
			$('#foot').fadeOut();
		}
	});
      
   // Get the modal
      var modal = document.getElementById('eventModal');
      var btn = document.getElementById("attend");
      var span = document.getElementById("close");    
      $('#payModal').hide();    
      // 참석하기
      $('#attend').click(function() {
          modal.style.display = "block";
          $('body').css("overflow", "hidden");
      });
      // 참석취소하기
      $('#cancel').click(function() {
          modal.style.display = "block";
          $('body').css("overflow", "hidden");
      });
      
      // 창닫기
      $('#close').click(function() {
          modal.style.display = "none";
          $('body').css("overflow", "scroll");
      });
      window.onclick = function(){
    	  modal.style.display = "none";
          $('body').css("overflow", "scroll");        
      };
      
      // 창넘어가기
      $('#yes_pay').click(function() {  
    	  var price = $('#price').text();
    	  var event_num = $('#event_num').val();
    	  
    	  IMP.init('imp32223549');
          IMP.request_pay({        	 
      	    pg : 'kakao',
      	    pay_method : 'card',
      	    merchant_uid : 'merchant_' + new Date().getTime(),
      	    name : 'MeetMe',
      	    amount :price,
      	    buyer_email : 'test@gmail.com',
      	    buyer_name : 'mm',
      	    buyer_tel : '010-1234-5678',
      	    buyer_addr : 'mm',
      	    buyer_postcode : '123-456'
      	}, function(rsp) {
      	    if ( rsp.success ) {
      	        var msg = '결제가 완료되었습니다.'; 
      	        location.href='Attend.event?event='+ event_num;	
      	    } else {
      	        var msg = '결제에 실패하였습니다.';
      	        msg += '에러내용 : ' + rsp.error_msg;
      	    }
      	    alert(msg);      	   
      	});    	  
    	  IMP.request_pay(kakaopay, callback)
      });
      
      var pmodal = document.getElementById('payModal');
     
      $('#close').click(function() {
          pmodal.style.display = "none";
      });
      window.onclick = function(event) {
          if (event.target == pmodal) {
              pmodal.style.display = "none";
          }
      }
      
});