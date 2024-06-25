package com.hanul.iot;

import java.io.File;
import java.util.HashMap;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import common.CommonService;
import customer.CustomerVO;
import member.MemberServiceImpl;
import member.MemberVO;
import notice.NoticeVO;
import qna.QnaVO;

@Controller
public class MemberController {
	@Autowired private MemberServiceImpl service;
	@Autowired private CommonService common;
	@Autowired private JavaMailSender mailSender;
	
	//로그인 요청
	@ResponseBody @RequestMapping("/login")
	public String login(String id, String pw, HttpSession session) {
		//화면에서 입력한 아이디와 비밀번호가 일치하는 회원 정보가 DB에 있는지 확인하여
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("id", id);
		map.put("pw", pw);
		MemberVO vo = service.member_login(map);

		//세션에 사용자 ID 저장
		session.setAttribute("userId", vo.getId());
		//일치하는 회원 정보가 있다면 회원 정보를 세션에 담는다
		session.setAttribute("login_info", vo);
		
		return vo == null ? "false" : "true";
	}
	
	//로그아웃 요청
	@ResponseBody @RequestMapping("/logout")
	public void logout(HttpSession session) {
		session.removeAttribute("login_info");
	}
	
	//회원가입 화면 요청
	@RequestMapping("/member")
	public String member(HttpSession session) {
		session.setAttribute("category", "join");
		
		return "member/join";
	}
	

	//아이디 중복확인 요청
	@ResponseBody @RequestMapping("/id_check")
	public boolean id_check(String id) {
		return service.member_id_check(id);
	}
	
	//회원가입 처리 요청
	//RequestMapping에 한글이 깨지지않게 utf-8 설정
	@ResponseBody @RequestMapping(value= "/join", produces= "text/html; charset= utf-8")
	public String join(MemberVO vo, HttpServletRequest request, HttpSession session) {
		String msg = "<script type='text/javascript'>";
		//화면에서 입력한 정보를 DB에 저장한 후 홈 화면으로 연결
		if(service.member_insert(vo)) {
			//메일 전송
			common.sendEmail(vo.getEmail(), vo.getName(), session);
			msg += "alert('회원가입을 축하드립니다!'); location='" + request.getContextPath() + "'";
		} else {
			msg += "alert('회원가입에 실패했습니다!'); history.go(-1)";
		}
		msg += "</script>";
		return msg;
	}
	
    // 공통 메소드: 세션에서 ID를 가져와서 사용자 정보를 조회하고 모델에 추가
    private void addMemberInfoToModel(HttpSession session, Model model) {
        String id = (String) session.getAttribute("userId");
        if (id != null) {
            MemberVO vo = service.member_detail(id);
            model.addAttribute("vo", vo);
        }
    }

    // 마이페이지 -> 회원정보
    @RequestMapping("memberInfo")
    public String myInfo(HttpSession session, Model model) {
        addMemberInfoToModel(session, model);
        return "member/memberInfo";
    }

    // 회원정보 -> 회원정보수정
    @RequestMapping("memberModify")
    public String mModify(HttpSession session, Model model) {
        addMemberInfoToModel(session, model);
        return "member/memberModify";
    }
    
    // 회원정보 수정 처리 요청
    @ResponseBody
    @RequestMapping(value = "memberUpdate", produces = "text/html; charset=utf-8", method = RequestMethod.POST)
    public String update(MemberVO vo, HttpSession session, HttpServletRequest request) {
        String id = (String) session.getAttribute("userId");

        // 사용자가 수정한 정보를 vo에 설정
        vo.setId(id);
        service.member_update(vo);

        // JavaScript를 사용하여 alert를 표시하고 첫 페이지로 리디렉션
        String msg = "<script type='text/javascript'>";
        msg += "alert('수정되었습니다!'); location='" + request.getContextPath() + "';";
        msg += "</script>";

        return msg;
    }
    
    // 마이페이지 -> 회원정보
    @RequestMapping("findUser")
    public String findUser() {
        return "member/findUser";
    }
    
    // 아이디와 비밀번호 찾기 요청 처리
    @ResponseBody
    @RequestMapping(value = "/findUser", method = RequestMethod.POST, produces = "text/html; charset=utf-8")
    public String findUser(@RequestParam("email") String email) {
        MemberVO user = service.findUserByEmail(email);
        String msg = "<script type='text/javascript'>";
        if (user != null) {
            msg += "alert('User ID: " + user.getId() + "\\nPassword: " + user.getPw() + "');";
        } else {
            msg += "alert('User not found');";
        }
        msg += "history.go(-1);"; // 이전 페이지로 돌아가기
        msg += "</script>";
        return msg;
    }
    

    
	//이메일 인증을 위한 전송 요청
	@RequestMapping(value = "member/mailCheck", method =  RequestMethod.GET )	
	@ResponseBody
	public String mailCheck(String email) throws Exception{ //반환값이 있기에 메서드 타입도 String
		System.out.println("이메일 데이터 전송 확인");  //확인용
		System.out.println("인증 이메일 : " + email);  
		
		//인증번호 생성
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		System.out.println("인증번호 :"+ checkNum);
		
		
		//이메일 전송 내용
		String setFrom = "zealot_s@naver.com"; //발신 이메일
		String toMail = email;         //받는 이메일
		String title = "글로벌인 회원가입 인증을 위한 이메일 입니다.";
		String content = 
						"인증 번호는 " + checkNum + "입니다." + 
						"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		//이메일 전송 코드
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);
		}catch(Exception e) {
			e.printStackTrace();
		}
		String num = Integer.toString(checkNum); // ajax를 뷰로 반환시 데이터 타입은 String 타입만 가능
		return num; // String 타입으로 변환 후 반환
	}
}

/* 이클립스 디버깅
		F5 해당 라인 시작, 함수가 있다면 함수 속으로 들어간다.
		F6 해당 라인 시작, 함수가 있어도 들어가지 않고 결과만 가지고 현재 라인 끝까지 실행.
		F7 현재 함수의 끝까지 실행하여 현재 함수를 벗어난다.
		F8 다음 브레이크 포인트까지 한번엔 실행

*/