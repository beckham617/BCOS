package com.bcos.bo;

import java.util.List;

import com.bcos.po.Series;

public interface SeriesManageBO extends BaseBO {
	public List<Series> queryAll(Long brandId,Long usageId);
	public List<Series> queryListByParameters(Long brandId,Long usageId,Long clientId);
	public Series editSeries(String id);
	public void saveSeries(Series series);
	public boolean isUsed(Long id);
}
