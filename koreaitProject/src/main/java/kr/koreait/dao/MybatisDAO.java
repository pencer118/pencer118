package kr.koreait.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.koreait.vo.MemberVO;
import kr.koreait.vo.ManagerVO;

public interface MybatisDAO {

	void insert(MemberVO memberVO);

	int selectCount();

	ArrayList<MemberVO> selectList(HashMap<String, Integer> hmap);

	void registeManager(ManagerVO managerVO);

	void deleteMember(int idx);

	int selectIdx();

	void updateMember(MemberVO memberVO);

}
