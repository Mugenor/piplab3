import org.postgresql.ds.PGConnectionPoolDataSource;

import javax.sql.PooledConnection;
import java.sql.SQLException;

public class DAO {
    private final PGConnectionPoolDataSource pooledDataSource = new PGConnectionPoolDataSource();
    private PooledConnection pooledConnection = null;

    public DAO(String url, String username, String password){
        pooledDataSource.setUrl(url);
        try {
            pooledConnection = pooledDataSource.getPooledConnection(username, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Class.forName("org.postgresql.Driver");
    }
}
