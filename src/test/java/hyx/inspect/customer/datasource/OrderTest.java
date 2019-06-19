package hyx.inspect.customer.datasource;

import hxy.inspec.customer.po.Orders;
import hxy.inspec.customer.service.OrderService;

public class OrderTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Orders order = new Orders();
		order.setCusId("1");
//		order.setQualtel("1");
//		order.setCost("1");
//		order.setDate("1");
//		order.setExcedate("1");
//		order.setFactoryaddress("1");
//		order.setFactoryman("1");
//		order.setFactoryname("1");
//		order.setFactorytel("1");
//		order.setFile("1");
//		order.setReportfile("1");
//		order.setProfile("1");
//		order.setStatus("1");

		OrderService orderService = new OrderService();
		if (orderService.insert(order)){
			System.out.println("成功");
		}

	}

}
