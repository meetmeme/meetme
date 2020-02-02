 <meta charset="utf-8">
        <title>Meet Me | ${event.EVENT_TITLE}</title>
    	<meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1"> 
		<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>

        <link rel="stylesheet" href="resources/css/bootstrap.min.css">
        <link rel="stylesheet" href="resources/css/font-awesome.css"  type='text/css'>
        <link rel="stylesheet" href="resources/css/animate.css">
        <link rel="stylesheet" href="resources/css/templatemo_misc.css">
        <link rel="stylesheet" href="resources/css/templatemo_style.css">
        <link rel="stylesheet" href="resources/css/event.css">		
        <script src="resources/js/event/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
        <script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
      
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBBCJ1vbVWbRvoI0UuQBbhS_MLsJNEksyE" async defer ></script> 
 		<script src="resources/js/event/vendor/jquery-1.11.0.min.js"></script>
        <script>window.jQuery || document.write('<script src="resources/js/event/vendor/jquery-1.11.0.min.js"><\/script>')</script>
        <script src="resources/js/event/bootstrap.js"></script>
        <script src="resources/js/event/plugins.js"></script>
        <script src="resources/js/event/main.js"></script>        
        <script src="resources/js/event/vendor/jquery.gmap3.min.js"></script>
     <!--  Google Map Init -->      
         <script type="text/javascript">
          jQuery(function($){
                $('#map_canvas').gmap3({
                    marker:{
                        address: '${event.EVENT_LAT}, ${event.EVENT_LNG}' 
                    },
                        map:{
                        options:{
                        zoom: 18,
                        scrollwheel: false,
                        streetViewControl : true
                        }
                    }
                });

                $('body').bind('touchstart', function() {});
            }); 
        </script>