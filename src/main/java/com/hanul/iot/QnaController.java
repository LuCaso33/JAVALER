package com.hanul.iot;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import common.CommonService;
import member.MemberServiceImpl;
import member.MemberVO;
import qna.QnaPage;
import qna.QnaServiceImpl;
import qna.QnaVO;

@Controller
public class QnaController {
	@Autowired private QnaServiceImpl service;
	@Autowired private CommonService common;
	@Autowired private MemberServiceImpl member;
	@Autowired private QnaPage page;
	@Autowired private MemberController memberController;
	
	//글 목록
	@RequestMapping("/list.qna")
	public String list(Model model, HttpSession session, @RequestParam(defaultValue = "1") int curPage, String search, String keyword) {

		session.setAttribute("category", "qna");
		
		//DB에서 글 목록 조회해와 화면에 출력
		page.setCurPage(curPage);
		page.setSearch(search);
		page.setKeyword(keyword);
		model.addAttribute("page", service.qna_list(page));
		
        // 모든 myPost의 id를 리스트로 가져옴
		String userId = (String) session.getAttribute("userId");
		session.setAttribute("myPostIds", memberController.updateMyPostIds(session, userId));
		
		return "qna/list";
	}
	
	//신규 글 작성 화면 요청=========================================================
	@RequestMapping("/new.qna")
	public String qna() {
		return "qna/new";
	}
	
	//신규 글 저장 처리 요청
	@RequestMapping("/insert.qna")
	public String insert(MultipartFile file, QnaVO vo, HttpSession session) {
		//첨부한 파일을 서버 시스템에 업로드하는 처리
		if(!file.isEmpty()) {
			vo.setFilepath(common.upload("qna", file, session));
			vo.setFilename(file.getOriginalFilename());
		}
		
		//세션 로그인 정보로부터 사용자 Id를 받아와서 Writer에 등록 
		vo.setWriter( ((MemberVO) session.getAttribute("login_info")).getId() );
		//화면에서 입력한 정보를 DB에 저장한 후
		service.qna_insert(vo);
		//목록 화면으로 연결
		return "redirect:list.qna";
	}
	
	//QNA 글 상세 화면 요청
	@RequestMapping("/detail.qna")
	public String detail(int id, Model model, HttpSession session) {
		//선택한 QNA 글에 대한 조회수 증가 처리
		service.qna_read(id);
		
		//선택한 QNA 글 정보를 DB에 조회해와 상세 화면에 출력
		model.addAttribute("vo", service.qna_detail(id));
		model.addAttribute("crlf", "\r\n");
		model.addAttribute("page", page);
		
	    // 로그인 정보와 myPostIds를 세션에서 가져옴
	    MemberVO loginInfo = (MemberVO) session.getAttribute("login_info");
	    List<Integer> myPostIds = (List<Integer>) session.getAttribute("myPostIds");

	    // 조건에 따른 상세 화면 접근 허용 여부 확인
	    boolean canAccessDetail = false;
	    if (loginInfo != null) {
	        if ("Y".equals(loginInfo.getAdmin())) {
	            canAccessDetail = true;
	        } else if (myPostIds != null) {
	            if (myPostIds.contains((Integer) service.qna_detail(id).getId()) || myPostIds.contains((Integer) service.qna_detail(id).getRoot() + 1)) {
	                canAccessDetail = true;
	            }
	        }
	    }

	    // 접근 가능 여부를 모델에 추가
	    model.addAttribute("canAccessDetail", canAccessDetail);

	    // 접근 가능 여부에 따라 상세 화면 또는 에러 메시지로 리다이렉트
	    if (canAccessDetail) {
	        return "qna/detail";
	    } else {
	        model.addAttribute("alertMessage", "閲覧できません");
	        return "qna/list";  // 접근 불가 시 리다이렉트할 페이지 (예: 홈 화면)
	    }
		
	} //detail()
	
	//첨부 파일 다운로드 요청
	@ResponseBody @RequestMapping("/download.qna")
	public void download(int id, HttpSession session, HttpServletResponse response) {
		QnaVO vo = service.qna_detail(id);
		common.download(vo.getFilename(), vo.getFilepath(), session, response);
	} // download()
	
	//QNA 글 삭제 처리 요청
	@RequestMapping("/delete.qna")
	public String delete(int id, HttpSession session) {
		//선택한 QNA 글에 첨부한 파일이 있다면 서버의 물리적 영역에서 해당 파일도 삭제한다
		QnaVO vo = service.qna_detail(id);
		if(vo.getFilepath() != null) {
			File file = new File(session.getServletContext().getRealPath("resources") + vo.getFilepath());
			if( file.exists() ) { file.delete(); }
		}
		
		//선택한 QNA 글을 DB에서 삭제한 후 목록 화면으로 연결
		service.qna_delete(id);
		
		return "redirect:list.qna";
	} //delete()
	
	//QNA 글 수정 화면 요청
	@RequestMapping("/modify.qna")
	public String modify(int id, Model model) {
		//선택한 QNA 글 정보를 DB에서 조회해와 수정 화면에 출력
		model.addAttribute("vo", service.qna_detail(id));
		return "qna/modify";
	} //modify()
	
	//QNA 글 수정 처리 요청
	@RequestMapping("/update.qna")
	public String update(QnaVO vo, MultipartFile file, HttpSession session, String attach) {
		//원래 글의 첨부 파일 관련 정보를 조회
		QnaVO qna = service.qna_detail(vo.getId());
		String uuid = session.getServletContext().getRealPath("resources") + qna.getFilepath();
		
		//파일을 첨부한 경우 - 없었는데 첨부 / 있던 파일을 바꿔서 첨부
		if(!file.isEmpty()) {
			vo.setFilename(file.getOriginalFilename());
			vo.setFilepath(common.upload("qna", file, session));
			
			//원래 있던 첨부 파일은 서버에서 삭제
			if(qna.getFilename() != null) {
				File f = new File(uuid);
				if (f.exists()) { f.delete(); }
			}
		} else {
			//원래 있던 첨부 파일을 삭제됐거나 원래부터 첨부 파일이 없었던 경우
			if(attach.isEmpty()) {
				//원래 있던 첨부 파일은 서버에서 삭제
				if(qna.getFilename() != null) {
					File f = new File(uuid);
					if (f.exists()) { f.delete(); }
				}
				

			} else { //원래 있던 첨부 파일을 그대로 사용하는 경우
				vo.setFilename(qna.getFilename());
				vo.setFilepath(qna.getFilepath());
			}
		}
		
		//화면에서 변경한 정보를 DB에 저장한 후 상세 화면으로 연결
		service.qna_update(vo);
		
		return "redirect:detail.qna?id=" + vo.getId();
	} //update()
	
	//답글 쓰기 화면 요청==================================================================
	@RequestMapping("/reply.qna")
	public String reply(Model model, int id) {
		//원글의 정보를 답글 쓰기 화면에서 알 수 있도록 한다.
		model.addAttribute("vo", service.qna_detail(id));
		
		return "qna/reply";
	} //reply()
	
	//신규 답글 저장 처리 요청==============================================================
	@RequestMapping("/reply_insert.qna")
	public String reply_insert(QnaVO vo, HttpSession session, MultipartFile file) {
		if(!file.isEmpty()) {
			vo.setFilename(file.getOriginalFilename());
			vo.setFilepath(common.upload("qna", file, session));
		}
		vo.setWriter(((MemberVO) session.getAttribute("login_info")).getId());
		
		//화면에서 입력한 정보를 DB에 저장한 후 목록 화면으로 연결
		service.qna_reply_insert(vo);
		return "redirect:list.qna";
	} //reply_insert()
}
