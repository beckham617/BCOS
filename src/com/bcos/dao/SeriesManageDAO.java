package com.bcos.dao;

import java.util.List;

import com.bcos.po.Series;

public interface SeriesManageDAO extends BaseDAO {
	public List<Series> queryAll(Long brandId,Long usageId);
	public List<Series> queryListByParameters(Long brandId,Long usageId,Long clientId);
	public void saveSeries(Series series);
	public Series editSeries(String id);
	public boolean isUsed(Long id);
}
