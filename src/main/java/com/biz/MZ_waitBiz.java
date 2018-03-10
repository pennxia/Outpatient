package com.biz;

import com.base.BaseBiz;
import com.entity.KQ_wait;
import com.entity.MZ_wait;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface MZ_waitBiz extends BaseBiz<MZ_wait>{

    /**
     * 查询所有 + 分页
     * @param sql
     * @param begin
     * @param end
     * @return
     */
    Map<String, Object> queryMap(String sql, int begin, int end);

    /**
     * 查询所有不带参
     * @return
     */
    List<MZ_wait> queryList();

    /**
     * 查询所有带参
     * @return
     */
    List<MZ_wait> queryLists(String sql, int begin, int end);

    /**
     * 查询单个
     * @param serializable
     * @return
     */
    MZ_wait queryById(Serializable serializable);

    /**
     * 查询最大的编号
     * @return
     */
    public String queryMaxNo();

    /**
     * 增加
     * @param object
     * @return
     */
    boolean insert(Object object);

    /**
     * 修改
     * @param object
     * @return
     */
    boolean update(Object object);

    /**
     * 删除
     * @param object
     * @return
     */
    boolean delete(Object object);

    /**
     * 查询表的总行数
     * @param sql
     * @return
     */
    int getCount(String sql);
}