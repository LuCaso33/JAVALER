package board;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class MyPostPage extends common.PageVO {
	private List<BoardVO> list;
    private String writer; // 내 게시글 목록 확인을 위해 writer 속성 추가
	
	public List<BoardVO> getList() {
		return list;
	}
	
	public void setList(List<BoardVO> list) {
		this.list = list;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}
}