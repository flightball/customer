package hxy.inspec.customer.service;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import hxy.inspec.customer.dao.DataStatisticDao;
import hxy.inspec.customer.po.DataStatistic;

public class DataStatisticService {

	private final static Logger logger = LoggerFactory.getLogger(DataStatistic.class);

	public boolean Insert(DataStatistic dataStatistic) throws IOException {
		DataStatisticDao dataStatisticDao = new DataStatisticDao();
		dataStatisticDao.insert(dataStatistic);
		return false;
	}

	public DataStatistic select() {
		DataStatisticDao dataStatisticDao = new DataStatisticDao();
		DataStatistic dataStatistic = null;
		try {
			dataStatistic = dataStatisticDao.select();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return dataStatistic;
	}

	public boolean update(DataStatistic dataStatistic) throws IOException {

		DataStatisticDao dataStatisticDao = new DataStatisticDao();
		dataStatisticDao.update(dataStatistic);

		return false;

	}

}
