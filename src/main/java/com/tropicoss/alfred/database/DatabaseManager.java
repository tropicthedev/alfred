package com.tropicoss.alfred.database;

import com.tropicoss.alfred.Alfred;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseManager {
    private Connection connection;

    public DatabaseManager() throws SQLException {
    }

    private void checkDatabaseTables() throws SQLException {
        DatabaseMetaData metaData = connection.getMetaData();


    }

    public Connection getConnection() {
        if (connection == null) {
            try {
                this.connection = DriverManager.getConnection(
                        String.format("jdbc:sqlite:%s",
                                Alfred.fabricLoader.getConfigDir().resolve("alfred/alfred.db")
                        )
                );
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }
        return this.connection;
    }

}
