package org.starworks.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.starworks.domain.BoardAttachVO;
import org.starworks.domain.BoardVO;
import org.starworks.domain.Criteria;
import org.starworks.mapper.BoardAttachMapper;
import org.starworks.mapper.BoardMapper;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class BoardServicelmpl implements BoardService {

	@Autowired
	private BoardMapper mapper;

	@Autowired
	private BoardAttachMapper attachMapper;

	@Transactional
	@Override
	public void registerNotice(BoardVO board) {
		
		log.info("register...." + board);
		mapper.insertNoticeSelectKey(board);

		if (board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}

		board.getAttachList().forEach(attach -> {
			attach.setBno(board.getB_no());
			attachMapper.insertNotice(attach);
		});

	}

	@Override
	public BoardVO getNotice(Long bno) {
		log.info("get...." + bno);

		return mapper.readNotice(bno);
	}

	@Transactional
	@Override
	//서버 측 게시물 수정과 첨부파일
	public boolean modifyNotice(BoardVO board) {
		log.info("서비스들어왔");
		log.info("modify......" + board);
		//기존 첨부된 데이터를 삭제
		attachMapper.deleteAllNotice(board.getB_no());

		boolean modifyResult = mapper.updateNotice(board) == 1;
		
		//첨부파일 데이터를 추가한다
		if (modifyResult && board.getAttachList() != null && board.getAttachList().size() > 0) {

			board.getAttachList().forEach(attach -> {

				attach.setBno(board.getB_no());
				attachMapper.insertNotice(attach);
			});
		}

		return modifyResult;
	}

	@Transactional
	@Override
	public boolean removeNotice(Long bno) {

		log.info("remove...." + bno);

		attachMapper.deleteAllNotice(bno);

		return mapper.deleteNotice(bno) == 1; // 원본글 삭제
	}

//	@Override
//	public List<BoardVO> getList() {
//		
//		log.info("getList.......");
//		
//		return mapper.listNotice();
//	}

	@Override
	public List<BoardVO> listNotice(Criteria cri) {

		log.info("get List with criteria:" + cri);

		return mapper.getListWithPaging(cri);

	}

	@Override
	public int getTotal(Criteria cri) {

		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {

		log.info("get Attach list by bno" + bno);

		return attachMapper.findByBno(bno);
	}

}
