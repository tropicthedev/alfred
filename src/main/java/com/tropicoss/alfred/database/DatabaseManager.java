package com.tropicoss.alfred.database;

import com.tropicoss.alfred.Alfred;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseManager {
    private final Connection connection = DriverManager.getConnection(
            String.format("jdbc:sqlite:%s",
                    Alfred.fabricLoader.getConfigDir().resolve("alfred/alfred.db")
            )
    );

    public DatabaseManager() throws SQLException {
    }

    private void checkDatabaseTables() throws SQLException {
        DatabaseMetaData metaData = connection.getMetaData();


    }
}
