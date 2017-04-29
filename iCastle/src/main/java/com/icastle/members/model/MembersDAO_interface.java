package com.icastle.members.model;

import java.util.List;

public interface MembersDAO_interface {
	  public void insert(MembersVO membersVO);
      public void update(MembersVO membersVO);
      public void delete(String email);
      public MembersVO findByPrimaryKey(String email);
      public List<MembersVO> getAll();
}