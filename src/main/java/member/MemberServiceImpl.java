package member;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import customer.CustomerVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired private MemberDAO dao;
	
	@Override
	public boolean member_insert(MemberVO vo) {
		return dao.member_insert(vo);
	}

	@Override
	public MemberVO member_select(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO member_login(HashMap<String, String> map) {
		return dao.member_login(map);
	}

	@Override
	public boolean member_id_check(String id) {
		return dao.member_id_check(id);
	}
	
	@Override
	public MemberVO member_detail(String id) {
		return dao.member_detail(id);
	}

	@Override
	public void member_update(MemberVO vo) {
		dao.member_update(vo);
	}
	
	@Override
	public MemberVO findUserByEmail(String email) {
        return dao.findUserByEmail(email);
    }

	@Override
	public boolean member_delete(String id) {
		// TODO Auto-generated method stub
		return false;
	}

}
