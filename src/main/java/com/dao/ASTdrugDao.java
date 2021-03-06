package com.dao;

import com.base.BaseDao;
import com.entity.ASTdrug;
import org.apache.ibatis.annotations.Param;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface ASTdrugDao extends BaseDao<ASTdrug> {

    List<ASTdrug> resultMap(String param,int begin,int end);

    Map<String, Object> queryMap(String sql, int begin, int end);

    List<ASTdrug> queryList();

    List<ASTdrug> queryLists(String sql, int begin, int end);

    ASTdrug queryById(Serializable serializable);

    Map<String,Object> getByid(Serializable serializable);


    boolean insert(Object object);

    boolean update(Object object);

    boolean delete(Object object);

    int getCount(@Param("param1") String sql);

    String queryMaxNo();
}
