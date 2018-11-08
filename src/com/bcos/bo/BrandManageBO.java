package com.bcos.bo;

import java.util.List;

import com.bcos.po.Brand;


public interface BrandManageBO extends BaseBO {
	public List<Brand> queryAll();
	public Brand editBrand(String id);
	public void saveBrand(Brand brand);
	public boolean isUsed(Long id);
	public List<Brand> queryListByClient(Long clientId);
}
