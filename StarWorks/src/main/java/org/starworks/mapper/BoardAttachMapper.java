package org.starworks.mapper;

import java.util.List;

import org.starworks.domain.BoardAttachVO;



public interface BoardAttachMapper {

	public void insertNotice(BoardAttachVO vo);

	public void deleteNotice(String uuid);

	public List<BoardAttachVO> findByBno(Long bno);

	public void deleteAllNotice(Long bno);

	public List<BoardAttachVO> getOldFiles();
	
	

}