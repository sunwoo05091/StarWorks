package org.starworks.service;

import java.util.List;

import org.starworks.domain.BoardAttachVO;
import org.starworks.domain.BoardVO;
import org.starworks.domain.Criteria;



public interface BoardService {
	public void registerNotice(BoardVO board);
	public BoardVO getNotice(Long bno);
	public boolean modifyNotice(BoardVO board);
	public boolean removeNotice(Long bno);
	
	public List<BoardVO> listNotice(Criteria cri);
	public int getTotal(Criteria cri);
	public List<BoardAttachVO> getAttachList(Long bno);
}
