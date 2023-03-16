package kr.co.mirak.pay;

import java.util.List;

import kr.co.mirak.cart.CartVO;

public interface PayMapper {
	List<PayVO> getAdminPayList();

	List<PayVO> getPayListDetail(String group_id);

	PayVO info(int id);

	int insert(PayVO vo);

	int update(PayVO vo);

	int delete(int id);

	List<CartVO> cartCheckList(String myid);
}
