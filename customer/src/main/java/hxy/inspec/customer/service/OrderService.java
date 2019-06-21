package hxy.inspec.customer.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cglib.reflect.FastClass;

import hxy.inspec.customer.dao.OrdersDao;
import hxy.inspec.customer.datasource.DataConnection;
import hxy.inspec.customer.po.Orders;

public class OrderService {

	private final static Logger logger = LoggerFactory.getLogger(OrderService.class);

	// 插入订单
	public boolean insert(Orders order) {
		OrdersDao orderDao = new OrdersDao();
		try {
			int flag = orderDao.insert(order);
			if (flag == 1) {
				return true;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}

	public List<Orders> selectAllByTel(String tel) throws IOException {
		OrdersDao ordersDao = new OrdersDao();
		List<Orders> list = ordersDao.selectAllByTel(tel);
		return list;
	}
	public List<Orders> selectAllByCusId(String tel) throws IOException {
		OrdersDao ordersDao = new OrdersDao();
		List<Orders> list = ordersDao.selectAllByCusId(tel);
		return list;
	}
	

	public List<Orders> findByPage(HashMap<String, Object> tel) throws IOException {
		OrdersDao ordersDao = new OrdersDao();
		List<Orders> list = ordersDao.findByPage(tel);
		return list;
	}
	
	public List<Orders> findOrdersByStatusJudge(HashMap<String, Object> tel) throws IOException {
		OrdersDao ordersDao = new OrdersDao();
		List<Orders> list = ordersDao.findOrdersByStatusJudge(tel);
		return list;
	}
	
	

	public List<Orders> selectAllByIdAndStatus(HashMap<String, Object> tel) throws IOException {
		OrdersDao ordersDao = new OrdersDao();
		List<Orders> list = ordersDao.selectAllByIdAndStatus(tel);
		return list;
	}

	public Orders selectAllById(String ordersId) throws IOException {
		OrdersDao ordersDao = new OrdersDao();
		Orders list = ordersDao.selectAllById(ordersId);
		return list;
	}

	public boolean updateInspector(Orders order) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean updateStatus(Orders orders) {
		// TODO Auto-generated method stub
		OrdersDao ordersDao = new OrdersDao();
		int flag = ordersDao.updateStatus(orders);
		if (flag == 1) {
			return true;
		} else
			return false;

	}

	public void updateReport(Orders orders) {
		// TODO Auto-generated method stub

	}

}
