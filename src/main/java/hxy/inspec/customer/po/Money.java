package hxy.inspec.customer.po;

import lombok.Data;

@Data
public class Money {
	private String id;
	private String value;//币种相对人民币价值
	private String rate;//汇率
	private String name;//币种名称
	private String number;//货币原本的数字
	private String unit;//单位
	private String remark;//备注
}
