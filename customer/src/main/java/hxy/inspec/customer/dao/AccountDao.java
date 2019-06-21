package hxy.inspec.customer.dao;

import java.io.IOException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import hxy.inspec.customer.datasource.DataConnection;
import hxy.inspec.customer.po.Account;
import hxy.inspec.customer.po.Orders;

public class AccountDao {
	private final static Logger logger = LoggerFactory.getLogger(AccountDao.class);
	public int insert(Account user) throws IOException {
		SqlSession sqlSession = DataConnection.getSqlSession();
		int flag = sqlSession.insert("Account.insert", user);
		sqlSession.commit();
		sqlSession.close();
		logger.info("插入后结果：" + flag);
		return flag;
	}
	public List<Account> selectAllByUserId(String id) throws IOException {
		SqlSession sqlSession = DataConnection.getSqlSession();
		List<Account> goodsList = sqlSession.selectList("Account.findOrdersByUserId", id);
		logger.info("查询结果条数"+goodsList.size());
		sqlSession.commit();
		sqlSession.close();
		return goodsList;
	
	}
	public List<Account> selectAllByTel(String tel) {
		return null;
	}
}
