package com.bcos.dao;

import java.util.List;

import com.bcos.po.Brand;

public interface BrandManageDAO extends BaseDAO {
	public List<Brand> queryAll();
	public Brand editBrand(String id);
	public void saveBrand(Brand brand);
	public boolean isUsed(Long id);
	public List<Brand> queryListByClient(Long clientId);
}
