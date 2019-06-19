package hxy.inspec.customer.po;

import lombok.Data;

@Data
public class Account {
	private String id;
	private String userId;// 用户的id
	private String operate;// 加减
	private String value;// 值
	private String surplus;// 账户剩余
	private String time;// 操作时间
	private String type;// 类别：提现，充值，还是消费,消费可能是一句话。依据类别来显示
	private String file;// 证明，提现或者充值都会有凭证图片，文件名
	private String fileUuid;// 证明，提现或者充值都会有凭证图片，文件的uuid，下载定位
	private String adminId;// 操作的管理员
	private String notes;// 备注
	private String status;

	public String getStatusString() {
		String s = null;
		switch (status) {
		case "0":
			s = "待审核";
			break;
		case "1":
			s = "已通过";
			break;
		case "2":
			s = "已拒绝";
			break;
		default:
			break;
		}
		return s;
	}
	public String getTypeString() {
		String s = null;
		switch (type) {
		case "1":
			s = "充值";
			break;
		case "2":
			s = "提现";
			break;
		case "3":
			s = "消费";
			break;
		case "4":
			s = "收益";
			break;
		default:
			break;
		}
		return s;
	}
	public String getOperateString() {
		String s = null;
		switch (operate) {
		case "1":  // 1 是 +
			s = "+";
			break;
		case "2": // 2 是 -
			s = "-";
			break;
		default:
			break;
		}
		return s;
	}
}
