package org.starworks.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.starworks.domain.BoardVO;
import org.starworks.domain.Criteria;

public interface BoardMapper {
	public List<BoardVO> listNotice();
	public void insertNotice(BoardVO board);
	public void insertNoticeSelectKey(BoardVO board);
	public BoardVO readNotice(Long bno);
	public int deleteNotice(Long bno);
	public int updateNotice(BoardVO board);
	public List<BoardVO> getListWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);
	
}
