<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<title>Elen - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<jsp:include page="/WEB-INF/views/myhome/mnavi.jsp" />
<jsp:include page="/WEB-INF/views/myhome/delete_board_modal.jsp" />

<style>
tr.center-block {
	text-align: center
}


label {
	font-weight: bold
}

#upfile {
	display: none
}

img {
	width: 20px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
	%>
	<input type="hidden" name="id" value="<%=id%>">
	<div id="colorlib-page">
		<div id="colorlib-main">
			<div class="container">
				<form action="BoardModifyAction.mh" method="post" name="modifyform"
					enctype="multipart/form-data">
					<input type="hidden" name="id" value="<%=id%>">
					<input type="hidden" name="BOARD_NUM"
						value="${boarddata.BOARD_NUM }"> <input type="hidden"
						name="BOARD_ORIGINAL" value="${boarddata.BOARD_ORIGINAL}">
					<input type="hidden" name="BOARD_PHOTO"
						value="${boarddata.BOARD_PHOTO}"> <input type="hidden"
						name="before_file" value="${boarddata.BOARD_PHOTO}">
					<h1>게시글 수정</h1>
					<div class="form-group">
						<label for="board_id">글쓴이</label> <input name="BOARD_ID"
							id="board_id" value="${boarddata.BOARD_ID }" readOnly type="text"
							size="10" maxlength="30" class="form-control"
							placeholder="Enter_board_name">

					</div>

					<div class="form-group">
						<label for="board_title">제목</label> <input name="BOARD_TITLE"
							id="board_title" type="text" size="50" maxlength="100"
							class="form-control" placeholder="Enter_board_subject"
							value="${boarddata.BOARD_TITLE }">

					</div>
					<div class="form-group">
						<label for="board_content">내용</label>
						<textarea name="BOARD_CONTENT" id="board_content" cols="67"
							rows="10" class="form-control">${boarddata.BOARD_CONTENT }</textarea>


					</div>

					<!-- 파일이 첨부되어 있으면 -->
					<div class="form-group read">
						<label for="board_file">파일 첨부</label> <label for="upfile">
							<img src="image/attach.png" alt="파일첨부">
						</label> <input type="file" id="upfile" name="uploadfile"> <span
							id="filevalue">${boarddata.BOARD_ORIGINAL }</span> <img
							src="resources/image/remove.png" alt="파일삭제" width="10px"
							class="remove">
					</div>


					<div class="form-group">
						<button type="submit" class="btn btn-primary">수정</button>
						<button type="reset" class="btn btn-info"
							onClick="histoty.go(-1)">취소</button>
						<button type="button" id="delete" class="btn btn-danger"
						data-target="#layerpop3" data-toggle="modal">삭제</button>
					</div>


				</form>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/myhome/mscript.jsp" />
</body>
<script>
	$(document).ready(function() {

		var check = 0;

		$(document).submit(function() {
			if ($.trim($("textarea").val()) == "") {
				alert("내용을 입력하세요");
				$("textarea").focus();
				return false;
			}

			if (check == 0) {
				value = $("#filevalue").text();
				html = "<input type='text' value='" + value + "'name='check'";
				$(this).append(html);
			}
		}); //submit end

		show();
		function show() {
			//파일 이름이 있는 경우 remove 이미지를 보이게 하고 없는 경우는 보이지 않게
			if ($('#filevalue').text() == '') {
				$(".remove").css('display', 'none');
			} else {
				$(".remove").css('display', 'inline-block');
			}
		}

		$("#upfile").change(function() {
			check++;
			var inputfile = $(this).val().split('\\');
			$('#filevalue').text(inputfile[inputfile.length - 1]);
			show();
		});

		//remove이미지 클릭하면 파일명을 ''로 변경하고 remove이미지 보이지 않게 함
		$(".remove").click(function() {
			$('#filevalue').text('');
			$(this).css('display', 'none');
		})

	}); //ready end
</script>

</html>