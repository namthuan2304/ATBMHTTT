package vn.edu.hcmuaf.fit.dao;

import org.jdbi.v3.core.mapper.RowMapper;

import java.util.List;
import java.util.Map;

public interface GenericDAO<T> {

    <T> List<T> query(String sql, Class<T> bean, Object... parameters);

    <T> T insert(String sql, Class<T> bean, Object... parameters);

    boolean update(String sql, Object... parameters);

    Integer count(String sql, Object... parameters);

    <K, V> Map<K, V> queryForMap(String sql, RowMapper<Map.Entry<K, V>> rowMapper, boolean mergeValues, Object... parameters);

}