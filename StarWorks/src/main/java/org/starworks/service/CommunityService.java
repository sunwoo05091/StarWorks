package org.starworks.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.starworks.domain.CommunityVO;
import org.starworks.domain.Reply;
import org.starworks.domain.Search;

public interface CommunityService {

	List<CommunityVO> listCommunity();
	
	  int insertCommunityTrade(CommunityVO community); 
	  CommunityVO detailCommunityTrade(int cm_no); 
	  int updateCommunityTrade(CommunityVO community);
//	  int deleteCommunityTrade(CommunityVO community); 
//	  int countTrade(Search search); 
//	  int countClub(Search search); 
//	  int countCarfull(Search search);
//	  
//	  int insertReply(Reply reply); List<Reply> listReply(int cm_no);
//	  
//	  List<CommunityVO> listCommunityClub(Search search, RowBounds row);
//	  int insertCommunityClub(CommunityVO community); 
//	  int updateCommunityClub(CommunityVO community);
//	  
//	  List<CommunityVO> listCommunityCarfull(Search search, RowBounds row);
//	  int insertCommunityCarfull(CommunityVO community); 
//	  int updateCommunityCarfull(CommunityVO community);
//	  
//	  List<CommunityVO> noticeCommunity();
//	  
//	  int insertNoticeTrade(CommunityVO community); 
//	  int insertNoticeClub(CommunityVO community); 
//	  int insertNoticeCarfull(CommunityVO community);
}
