package edu.ahu.hs.platAppoint.db;

import java.sql.ResultSet;
import java.sql.SQLException;

public interface ResultSetHandler<T> {
	public T handle(ResultSet rs) throws SQLException;
}
