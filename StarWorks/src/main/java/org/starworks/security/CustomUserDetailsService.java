package org.starworks.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.starworks.domain.EmpVO;
import org.starworks.mapper.MemberMapper;
import org.starworks.security.domain.CustomUser;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		log.warn("Load User By UserName: " + username);
		
		EmpVO vo = memberMapper.read(username);
		
		log.warn("queried by member mapper: " + vo);
		
		return vo == null ? null : new CustomUser(vo);
	}

}
