package com.bcos.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.bcos.dao.BaseDAO;

public class BaseDAOImpl extends HibernateDaoSupport implements BaseDAO {
	public List getListFromNationSQL(String sql) {
		return getSession().createSQLQuery(sql).list();
	}
}
