package kr.co.mirak.pay;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import kr.co.mirak.cart.CartVO;
import kr.co.mirak.product.ProductVO;

public interface PayService {	
	List<PayVO> getAdminPayList(CriteriaP criP);
	List<PayVO> getPayListDetail(String group_id);
	int updatePayments(PayVO payVO);
	public int getTotal();
	List<PayVO> getProductInfo(String group_id);
	List<PayVO> getClientPayList(HttpSession session);
	PayVO info(int id);
	int updateStateConfirm(String group_id);
	int delete(int id);
	List<CartVO> cartCheckList(HttpSession session);
	List<PayVO> adaptPayVO(PayStringVO payStringVO, HttpSession session);
	List<ProductVO> payFromProduct(ProductVO productVO, String cart_cnt, Date cart_start, String cart_day);
	int updateDetailInfo(PayVO payVO);
}
