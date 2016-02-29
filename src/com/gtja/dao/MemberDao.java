package com.gtja.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gtja.entity.Member;

@Repository
public interface MemberDao {
	public List<Member> findAll();

}
