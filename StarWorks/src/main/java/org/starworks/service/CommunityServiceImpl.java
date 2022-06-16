package org.starworks.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.starworks.domain.CommunityVO;
import org.starworks.domain.Reply;
import org.starworks.domain.Search;
import org.starworks.mapper.CommunityMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Service
@AllArgsConstructor
@Log4j
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	CommunityMapper mapper;
	
	@Override
	public List<CommunityVO> listCommunity() {
		// TODO Auto-generated method stub
		return mapper.listCommunity();
	}

	@Override
	public int insertCommunityTrade(CommunityVO community) {
		
		
		return mapper.insertCommunityTrade(community);
	}

	@Override
	public CommunityVO detailCommunityTrade(int cm_no) {
		
		return mapper.detailCommunityTrade(cm_no);
	}

	@Override
	public int updateCommunityTrade(CommunityVO community) {
		
		return mapper.updateCommunityTrade(community);
	}

	
	 

}
