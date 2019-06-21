package hxy.inspec.customer.po;

import lombok.Data;

@Data
public class User {
	private String cusid;
	private String custel;
	private String cusname;
	private String cuspasswd;
//	private String province;
//	private String city;
	private String email;
	private String cusgrade;//等级，与信用相关
	private String cusvip;
	private String cusaddress;// 地址
	private String cusdate;// 注册日期
	private String custrade;//行业
	private String cusMoney;//钱包实际余额，扣款用实际余额扣
	private String cusTempMoney;//钱包变化后的余额。充值用临时余额冲。
//思路：如果是订单付款，用实际余额与单价比较，同时也会减临时余额，到达一致。
	//充钱的时候，实际金额不变，临时余额增加，等待管理员审核通过，管理员系统会修改实际金额，临时金额不变。
	//提现的时候，实际金额减少，临时余额也减少。提现可以取消
	private String cusOrders;//订单数

}
