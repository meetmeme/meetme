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

</head>
<body>
<%
String id = request.getParameter("id"); 
%>
	<div id="colorlib-page">
		<div id="colorlib-main">
			<div class="container">
				<section class="ftco-section">
					<form action="BoardAddAction.mh" method="post"
						enctype="multipart/form-data" name="boardform">
						<input type="hidden" name="id" value="<%=id %>">
						<input type="hidden" name="MYHOME_NUM" value="${mh_info.myhome_num}">
						<h1>게시글 작성</h1>
						<div class="form-group">
							<label for="board_name">글쓴이</label> <input name="BOARD_ID"
								id="BOARD_ID" value="${userinfo.user_id}" readOnly type="text" size="10"
								maxlength="30" class="form-control"
								placeholder="Enter_board_name">

						</div>
						<div class="form-group">
							<label for="board_subject">제목</label> <input name="BOARD_TITLE"
								id="BOARD_TITLE" type="text" size="50" maxlength="100"
								class="form-control" placeholder="Enter_board_subject">

						</div>
						<div class="form-group">
							<label for="board_content">내용</label>
							<textarea name="BOARD_CONTENT" id="BOARD_CONTENT" cols="67"
								rows="10" class="form-control"></textarea>


						</div>

						<div class="form-group">
							<label for="board_file">파일 첨부</label> <label for="upfile">
								<img src="resources/image/attach.png" alt="사막">
							</label> <input type="file" id="upfile" name="uploadfile"> <span
								id="filevalue"></span>
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-primary">등록</button>
							<button type="reset" class="btn btn-danger">취소</button>
						</div>

					</form>
				</section>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/myhome/mscript.jsp" />
<!-- 	<script>
		$('button').click(function() {
			location.href = "BoardWrite.mh";
		});
	</script> -->
</body>
</html>