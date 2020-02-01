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


    /************** LightBox *********************/
      $(function(){
        $('[data-rel="lightbox"]').lightbox();
      });
      
      
      
   // Get the modal
      var modal = document.getElementById('eventModal');
      var btn = document.getElementById("attend");
      var span = document.getElementById("close");    
      $('#payModal').hide();    
      // 참석하기
      $('#attend').click(function() {
          modal.style.display = "block";
      });
      // 참석취소하기
      $('#cancel').click(function() {
          modal.style.display = "block";
      });
      
      // 창닫기
      $('#close').click(function() {
          modal.style.display = "none";
      });
      window.onclick = function(event) {
          if (event.target == modal) {
              modal.style.display = "none";
          }
      }
      
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
/*

IMP.request_pay({
    pg : 'kakaopay',
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : 'MeetMe',
    amount : '${event.EVENT_NUM}',
    buyer_email : '${u.USER_EMAIL}',
    buyer_name : 'a' ,
    buyer_tel : 'a' ,
    buyer_addr : 'a',
    buyer_postcode : '123105',
    //m_redirect_url : 'http://www.naver.com'
}, function(rsp) {
    if ( rsp.success ) {
        //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
        jQuery.ajax({
            url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
            type: 'POST',
            dataType: 'json',
            data: {
                imp_uid : rsp.imp_uid
                //기타 필요한 데이터가 있으면 추가 전달
            }
        }).done(function(data) {
            //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
            if ( everythings_fine ) {
                msg = '결제가 완료되었습니다.';
                msg += '\n고유ID : ' + rsp.imp_uid;
                msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                msg += '\결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
                
                alert(msg);
            } else {
                //[3] 아직 제대로 결제가 되지 않았습니다.
                //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
            }
        });
        //성공시 이동할 페이지
        location.href='Attend.event?event='+$(event.EVENT_NUM);
    } else {
        msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
        //실패시 이동할 페이지
        location.href="main.net";
        alert(msg);
    }
});*/
