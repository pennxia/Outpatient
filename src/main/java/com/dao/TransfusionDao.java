package com.dao;

import com.base.BaseDao;
import com.entity.Transfusion;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface TransfusionDao extends BaseDao<Transfusion> {


    Map<String, Object> queryMap(String sql, int begin, int end);

    List<Transfusion> queryList();

    List<Transfusion> queryLists(String sql, int begin, int end);

    Transfusion queryById(Serializable serializable);

    boolean insert(Object object);

    boolean update(Object object);

    boolean delete(Object object);

    int getCount(String sql);

    int queryMaxNo();
}