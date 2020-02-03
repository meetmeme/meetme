package com.meet.me.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.meet.me.domain.Board;
import com.meet.me.domain.Comment;
import com.meet.me.domain.MyHome;
import com.meet.me.domain.User;
import com.meet.me.service.MyHomeService;
import com.meet.me.service.UserService;


@Controller
public class MyhomeBoardController {

	@Autowired
	MyHomeService mhservice;

	@Autowired
	UserService userservice;

	//글쓰기페이지
	@GetMapping(value = "/BoardWrite.mh")
	public ModelAndView boardwrite(@RequestParam("id") String m_id, HttpSession session, ModelAndView mv, HttpServletRequest request) throws Exception {
		String user_id = (String) session.getAttribute("user_id1");
		int user_num = (int) session.getAttribute("user_num1");
		MyHome mh_info = mhservice.getinfo(m_id);
		User userinfo = userservice.user_info(user_id);
		
		if (userinfo == null) {
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "정보수집 실패");
			return mv;
		} else {
			mv.setViewName("myhome/mboard_write");
			mv.addObject("userinfo", userinfo);
			mv.addObject("mh_info", mh_info);
		}
		return mv;
	}
	
	//글쓰기
	@PostMapping("/BoardAddAction.mh")
	public String bbs_write_ok(HttpSession session, ModelAndView mv, Board board, HttpServletRequest request) throws Exception {

		String user_id = (String) session.getAttribute("user_id1");
		int user_num = (int) session.getAttribute("user_num1");
		User userinfo = userservice.user_info(user_id);
		//int result1 = mhservice.board_insert(board);
		
		MultipartFile uploadfile = board.getUploadfile();

		if (!uploadfile.isEmpty()) {
			String fileName = uploadfile.getOriginalFilename(); // 원래 파일 명
			board.setBOARD_ORIGINAL(fileName); // 원래 파일명 저장

			Calendar c = Calendar.getInstance();
			int year = c.get(Calendar.YEAR);
			int month = c.get(Calendar.MONTH);
			int date = c.get(Calendar.DATE);

			String saveFolder = request.getSession().getServletContext().getRealPath("resources") + "/upload/";
			String homedir = saveFolder + year + "-" + month + "-" + date;

			File path1 = new File(homedir);
			if (!(path1.exists())) { // 이 파일의 경로가 존재하는지 확인
				path1.mkdir(); // 없을 경우 경로 만들기
			}

			Random r = new Random();
			int random = r.nextInt(100000000);

			int index = fileName.lastIndexOf(".");
			String fileExtension = fileName.substring(index + 1); // 확장자만 따로 뻄
			String refileName = "bbs" + year + month + date + random + "." + fileExtension;
			String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
			uploadfile.transferTo(new File(saveFolder + fileDBName));

			// 바뀐 파일명으로 저장
			board.setBOARD_PHOTO(fileDBName);
		}
		mv.addObject("userinfo", userinfo);
		mhservice.insertBoard(board); // 저장 메서드 호출

		return "redirect:mboard.mh?id=" + user_id;
	}

	@RequestMapping(value = "/mboard.mh")
	public ModelAndView boardlist(@RequestParam("id") String u_id, @RequestParam(value = "page", required = false, defaultValue = "1") int page,
			ModelAndView model) throws Exception {


		int limit = 3; // 한 화면에 보여줄 갯수

		// 총 리스트 수를 받아옵니다.
		int listcount = mhservice.getListCount(u_id); // 총 리스트 수

		int maxpage = (listcount + limit - 1) / limit;
		int startpage = ((page - 1) / 10) * 10 + 1;
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage)
			endpage = maxpage;
		
		model.setViewName("myhome/mboard");
		
		int board_user_num = userservice.user_info(u_id).getUser_num();
		List<Board> boardlist = mhservice.boardlist(page, limit, u_id);
		List<Comment> commentlist = mhservice.getCommentList(board_user_num);
		
		model.addObject("page", page);
		model.addObject("maxpage", maxpage);
		model.addObject("startpage", startpage);
		model.addObject("endpage", endpage);
		model.addObject("limit", limit);
		model.addObject("boardlist", boardlist);
		model.addObject("commentlist", commentlist);
		model.addObject("listcount", listcount);
		return model;
	}

	@GetMapping("BoardModifyView.mh")
	public ModelAndView BoardModifyView(int num, ModelAndView mv, HttpServletRequest request) throws Exception {
		Board board = mhservice.getDetail(num);
		// 글 내용 불러오기 실패한 경우입니다.
		if (board == null) {
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "(수정)상세보기 실패");
			return mv;
		}

		// 수정 폼 페이지로 이동할 때 원문 글 내용을 보여주기 때문에 board 객체를
		// ModelAndView 객체에 저장합니다.
		mv.addObject("boarddata", board);
		// 글 수정 폼 페이지로 이동하기 위해 경로를 설정합니다.
		mv.setViewName("myhome/mboard_modify");
		return mv;
	}

	@PostMapping("BoardModifyAction.mh")
	public ModelAndView BoardModifyAction(@RequestParam("id") String m_id, Board board, String before_file, ModelAndView mv, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		MultipartFile uploadfile = board.getUploadfile();
		String saveFolder = request.getSession().getServletContext().getRealPath("resources") + "/upload/";

		if (uploadfile != null && !uploadfile.isEmpty()) { // 파일 변경한 경우
			String fileName = uploadfile.getOriginalFilename(); // 원래 파일
			board.setBOARD_ORIGINAL(fileName);
			String fileDBName = fileDBName(fileName, saveFolder);

			// transferTo(File path):업로드한 파일을 매개변수의 경로에 저장합니다.
			uploadfile.transferTo(new File(saveFolder + fileDBName));

			// 바뀐 파일명으로 저장
			board.setBOARD_PHOTO(fileDBName);
		}

		int result = mhservice.boardModify(board);
		if (result == 0) {
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "게시판 수정실패");
		} else {// 수정 성공의 경우
			String url = "redirect:mboard.mh?id=" + m_id;

			// 수정한 글 내용을 보여주기 위해 글 내용 보기 페이지로 이동하기 위해 경로를 설정합니다.
			mv.setViewName(url);
		}
		return mv;
	}

	@PostMapping("BoardDeleteAction.mh")
	public String BoardDeleteAction(int num, HttpSession session, HttpServletResponse response) throws Exception {

		// 비밀번호 일치하는 경우 삭제 처리 합니다.
		int result = mhservice.boardDelete(num);
		String user_id = (String) session.getAttribute("user_id1");
		// 삭제 처리 성공한 경우 - 글 목록 보기 요청을 전송하는 부분입니다.
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('삭제되었습니다.');");
		out.println("location.href='mboard.mh?id=" + user_id + "'");
		out.println("</script>");
		out.close();
		return null;
	}


	private String fileDBName(String fileName, String saveFolder) {
		// 새로운 폴더 이름 : 오늘 년+월+일
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR); // 오늘 년도 구합니다.
		int month = c.get(Calendar.MONTH) + 1; // 오늘 월 구합니다.
		int date = c.get(Calendar.DATE); // 오늘 일 구합니다.

		String homedir = saveFolder + year + "-" + month + "-" + date;
		File path1 = new File(homedir);
		if (!(path1.exists())) { // 이 파일의 경로가 존재하는지 확인
			path1.mkdir(); // 없을 경우 새로운 폴더를 생성
		}

		// 난수를 구합니다. 사용자가 올린 파일의 이름이 중복되면 안되니까
		Random r = new Random();
		int random = r.nextInt(100000000);

		/* 확장자 구하기 시작 //// 원래 파일의 형식이 .png / .jpg / 같은 형식일거니까 */
		int index = fileName.lastIndexOf(".");
		/*
		 * 문자열에서 특정 문자열의 위치 값을 반환한다. indexOf가 처음 발견되는 문자열에 대한 index를 반환하는 반면,
		 * lastIndexOf는 마지막으로 발견되는 문자열의 index를 반환합니다. (파일명에 점이 여러개 있을 경우 맨 마지막에 발견되는
		 * 문자열의 위치를 리턴합니다.)
		 */


		String fileExtension = fileName.substring(index + 1); // 확장자만 따로 뻄
		/* 확장자 구하기 끝 */
		// 새로운 파일명을 저장
		String refileName = "bbs" + year + month + date + random + "." + fileExtension;
		// 오라클 디비에 저장될 파일명
		String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
		return fileDBName;
	}

	
	@PostMapping("CommentDelete.mh")
	public void CommentDelete(int num , HttpServletResponse resp) throws IOException {
		int result = mhservice.commentsDelete(num);
		resp.getWriter().print(result);
	}
	
	@PostMapping("CommentUpdate.mh")
	public void CommentUpdate(Comment c, HttpServletResponse res) throws IOException {
	
		int result = mhservice.commentUpdate(c);
		res.getWriter().print(result);
		
	}
	
	@RequestMapping("CommentAdd.mh")
	public void CommentAdd(@RequestParam(value="board_num", required=false) int board_num,
			@RequestParam(value="board_user_num", required=false) int board_user_num,
			HttpSession session, String content, HttpServletResponse response) throws Exception {
		int user_num = (int) session.getAttribute("user_num1");
		Comment c = new Comment();
		c.setUSER_NUM(user_num);
		c.setBOARD_USER_NUM(board_user_num);
		c.setCOMMENT_CONTENT(content);
		c.setBOARD_NUM(board_num);
		int result = mhservice.commentsInsert(c);
		response.getWriter().print(result);
	}

	
}
