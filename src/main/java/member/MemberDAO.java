package member;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import customer.CustomerVO;

@Repository
public class MemberDAO implements MemberService {
	@Autowired private SqlSession sql; //이미 만들어둔 SqlSession을 이용하기 위해 Autowired를 사용한다
	
	@Override
	public boolean member_insert(MemberVO vo) {
		return sql.insert("member.mapper.join", vo) == 0 ? false : true;
	}

	@Override
	public MemberVO member_select(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO member_login(HashMap<String, String> map) {
		return sql.selectOne("member.mapper.login", map);
	}

	@Override
	public boolean member_id_check(String id) {
		return (Integer) sql.selectOne("member.mapper.id_check", id) == 0 ? true : false;
	}
	
	@Override
	public MemberVO member_detail(String id) {
		return sql.selectOne("member.mapper.detail", id);
	}

	@Override
	public void member_update(MemberVO vo) {
		sql.update("member.mapper.update", vo);
	}
	
	@Override
	public MemberVO findUserByEmail(String email) {
        return sql.selectOne("member.mapper.findUserByEmail", email);
    }

	@Override
	public boolean member_delete(String id) {
		// TODO Auto-generated method stub
		return false;
	}

}
