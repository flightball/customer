package hxy.inspec.customer.po;

import hxy.inspec.customer.util.Configuration;
import lombok.Data;

@Data
public class Orders {
	private String orderid;//订单号
	private String cusId;//用户信息
	private String qualId;//质检员信息
	private String excedate;//质检日期
	private String date;//下单日期
	private String factoryname;
	private String factoryaddress;
	private String factoryman;
	private String factorytel;
	private String profile;
	private String file;//这个文件是客户下单的时候提交的
	private String fileuuid;
	private String reportfile;
	private String reportfileuuid;
	private int status;
	private String type;//验货类型，不同的类型有不同的价格
	private String fee;//付款多少，或者是是否付款。
	private String cost;
	private String othercost;
	private String profit;
	private String goods;//产品名称
	private String goodsType;//产品类型
	
	
	//下面应该设置全局静态变量，全局设置？
	public String getStatusString() {
		String value="未知";
		switch (this.status) {
		case Configuration.BILL_SUBMITTED:
			value="提交成功";
			break;
		case Configuration.BILL_UNPAY:
			value="提交成功未付款";
			break;
		case Configuration.BILL_PAY:
			value="已付款";
			break;
		case Configuration.BILL_ASSIGNING:
			value="正在分配中";
			break;
		case Configuration.BILL_ASSIGNED:
			value="已分配质检员";
			break;
		case Configuration.BILL_INSPECTOR_CONFIRM:
			value="质检员确认验货";
			break;
		case Configuration.BILL_REPORT_SUBMIT:
			value="报告已提交";
			break;
		case Configuration.BILL_REPORT_VERIFIED:
			value="报告已审核";
			break;
		case Configuration.BILL_REPORT_PASSED:
			value="报告审核通过";
			break;
		default:
			value="未知";
			break;
		}
		return value;
	}
	
	
}
