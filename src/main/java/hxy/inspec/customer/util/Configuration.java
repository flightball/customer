package hxy.inspec.customer.util;

//静态变量类
public class Configuration {
	public static String FILE_ROOT_DIR = "";// 用于存储文件目录,这个目录不可以采用应用下的目录，因为应用一旦更新就没了。
	public static String IMAGE_URL = "";
	public static String MYSQL_HOST = "";
	public static String MYSQL_PASSWD = "";
	public static String MYSQL_USER = "";
	public  static final int BILL_SUBMITTED = 1;//订单已提交
	public  static final int BILL_UNPAY = 2;//订单未付款
	public  static final int BILL_PAY = 3;//订单已经付款
	public  static final int BILL_ASSIGNING = 4;//订单已经付款
	public  static final int BILL_ASSIGNED = 5;//验货员已接单
	public  static final int BILL_INSPECTOR_CONFIRM = 6;//验货员已接单
	public  static final int BILL_REPORT_SUBMIT = 7;//验货员已接单
	public  static final int BILL_REPORT_VERIFIED = 8;//验货员已接单
	public  static final int BILL_REPORT_PASSED = 9;//验货员已接单
	public  static final int BILL_REPORT_UNPASSED = 10;//验货员已接单
	public  static final int BILL_TEMP = 11;//验货员已接单
}