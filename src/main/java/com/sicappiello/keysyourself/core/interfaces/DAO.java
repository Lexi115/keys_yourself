package com.sicappiello.keysyourself.core.interfaces;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public interface DAO<T> {

    T getById(int id);

    List<T> getAll();

    int save(T entity);

    int update(T entity);

    int saveOrUpdate(T entity);

    int delete(T entity);

    int delete(int id);

    List<T> fetch(ResultSet rs) throws SQLException;
}
