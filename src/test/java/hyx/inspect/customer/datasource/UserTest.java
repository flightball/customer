package hyx.inspect.customer.datasource;

import hxy.inspec.customer.po.User;
import hxy.inspec.customer.service.UserService;

public class UserTest {


	public static void main(String[] args) {
		User user = new User();
		user.setCusgrade("2");
		UserService userService = new UserService();
		userService.insert(user);
		
		
	}



}
