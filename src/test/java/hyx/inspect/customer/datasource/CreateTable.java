package hyx.inspect.customer.datasource;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import hxy.inspec.customer.datasource.ConnectionUtil;
import hxy.inspec.customer.util.ApplicationStartListener;
import hxy.inspec.customer.util.Configuration;


public class CreateTable {
	private final static Logger logger = LoggerFactory.getLogger(ApplicationStartListener.class);

	public static void main(String args[]) {

		logger.info("应用开始启动，正在新建一个用于保存文件的文件夹，在当前系统用户的目录下");
		//再当前用户的目录下面新建一个文件夹，然后从中获取文件
		String fileSaveRootPath = "file";
		File fileFolder= new File(fileSaveRootPath);
		if (!fileFolder.exists()) {
			fileFolder.mkdirs();
		}
		//获取当前目录的绝对路径
		Configuration.FILE_ROOT_DIR=fileFolder.getAbsolutePath();
		
		logger.info("启动应用，开始数据库建表！注意修改java文件的代码，这个是建表的密码");
		Connection connection = ConnectionUtil.getConnection();
		String sql = "create table IF NOT EXISTS  orders (orderid int not null primary key  AUTO_INCREMENT,  `custel` VARCHAR(45) NULL, `qualtel` VARCHAR(45) NULL,  `excedate` VARCHAR(45) NULL,  `date` VARCHAR(45) NULL,\n"
				+ "  `factoryname` VARCHAR(45) NULL,\n" + "  `factoryaddress` VARCHAR(45) NULL,\n"
				+ "  `factoryman` VARCHAR(45) NULL,`factorytel` VARCHAR(45) NULL,`profile` VARCHAR(45) NULL,`file` VARCHAR(45) NULL,`reportfile` VARCHAR(45) NULL,`status` VARCHAR(45) NULL,`fee` VARCHAR(45) NULL,`cost` VARCHAR(45) NULL,`othercost` VARCHAR(45) NULL,`profit` VARCHAR(45) NULL)default charset=utf8; ";
		PreparedStatement preparedStatement = ConnectionUtil.getPreparedStatement(connection, sql);
		try {
			int flag= preparedStatement.executeUpdate();
			logger.info("新建表的标记"+flag);
		} catch (SQLException e) {
			e.printStackTrace();
			logger.error("数据库连接失败！");
		}
		/*
		String sql0 = "create table IF NOT EXISTS  net_bean (id int not null primary key  AUTO_INCREMENT, `ttkduserid` VARCHAR(45) NULL, `netName` VARCHAR(45) NULL,`netType` VARCHAR(45) NULL ,`netTel` VARCHAR(45) NULL ,`netPasswd` VARCHAR(45) NULL ,`netAddress` VARCHAR(45) NULL ,`netProfile` VARCHAR(45) NULL ,`round` VARCHAR(5) NULL )default charset=utf8; ";
		PreparedStatement preparedStatement0 = ConnectionUtil.getPreparedStatement(connection, sql0);
		try {
			logger.info("尝试新建user表");
			preparedStatement0.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			logger.error("数据库连接失败！");
		}
		
		String sql1 = "create table IF NOT EXISTS  net_type_and_province (id int not null primary key  AUTO_INCREMENT, `ttkduserid` VARCHAR(45) NULL, `netType` VARCHAR(45) NULL,`province` VARCHAR(45) NULL,`ceiling` VARCHAR(45) NULL,`floor` VARCHAR(45) NULL,`price` VARCHAR(45) NULL,`added` VARCHAR(45) NULL,`profile` VARCHAR(45) NULL  )default charset=utf8; ";
		PreparedStatement preparedStatement1 = ConnectionUtil.getPreparedStatement(connection, sql1);
		try {
			logger.info("尝试新建netTypeAndProvince表");
			 preparedStatement1.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			logger.error("数据库连接失败！");
		}

		String sql2 = "create table IF NOT EXISTS  transfer_bill (id int not null primary key  AUTO_INCREMENT,`ttkduserid` VARCHAR(45) NOT NULL,\n"
				+ "  `number` VARCHAR(15) NULL,\n" + "  `netName` VARCHAR(120) NULL,\n"
				+ "  `province` VARCHAR(100) NULL,\n" + "  `weight` VARCHAR(100) NULL,\n"
				+ "  `cost` VARCHAR(10) NULL,`date` VARCHAR(20) NULL)";
		PreparedStatement preparedStatement2 = ConnectionUtil.getPreparedStatement(connection, sql2);
		try {
			logger.info("尝试新建transferBill表");
			int resultSet1 = preparedStatement2.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		String sql3 = "create table IF NOT EXISTS  net_to_type (id int not null primary key  AUTO_INCREMENT, `ttkduserid` VARCHAR(45) NULL, `netType` VARCHAR(45) NULL ,`netProfile` VARCHAR(45) NULL )default charset=utf8; ";
		PreparedStatement preparedStatement3 = ConnectionUtil.getPreparedStatement(connection, sql3);
		try {
			logger.info("尝试新建net_to_type表");
			int resultSet0 = preparedStatement3.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			logger.error("数据库连接失败！");
		}

		/*
		 * String sql3 =
		 * "create table IF NOT EXISTS  result_bill (id int not null primary key  AUTO_INCREMENT,`ttkduserid` VARCHAR(45) NOT NULL,\n"
		 * + "  `number` VARCHAR(15) NULL,\n" + "  `netName` VARCHAR(120) NULL,\n" +
		 * "  `province` VARCHAR(100) NULL,\n" + "  `weight` VARCHAR(100) NULL,\n" +
		 * "  `cost` VARCHAR(10) NULL, PRIMARY KEY (`id`))"; PreparedStatement
		 * preparedStatement3 = ConnectionUtil.getPreparedStatement(connection, sql3);
		 * try { logger.info("尝试新建transferBill表"); int resultSet1 =
		 * preparedStatement3.executeUpdate(); } catch (SQLException e) {
		 * e.printStackTrace(); }
		 * 
		 */
		finally {
			ConnectionUtil.close(preparedStatement, connection);
		}

	
	}

}
