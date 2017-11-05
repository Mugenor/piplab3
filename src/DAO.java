import org.postgresql.ds.PGConnectionPoolDataSource;

import javax.annotation.PreDestroy;
import javax.sql.PooledConnection;
import javax.sql.RowSet;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DAO {
    private final PGConnectionPoolDataSource pooledDataSource = new PGConnectionPoolDataSource();
    private PooledConnection pooledConnection = null;

    public DAO() throws ClassNotFoundException, SQLException{
            Class.forName("org.postgresql.Driver");
            pooledDataSource.setUrl("jdbc:postgresql://localhost:5432/postgres");
            pooledConnection = pooledDataSource.getPooledConnection("postgres", "qwerty");
    }

    public void addPoint(Point point) throws SQLException{
        Connection connection = pooledConnection.getConnection();
        Statement statement = connection.createStatement();
        statement.execute("insert into point(x, y, r, ishitted) VALUES (" + point.getX() + ", " + point.getY() + ", "
                + point.getR() + ", " + point.isHitted() + ")");
        statement.close();
        connection.close();
    }
    @PreDestroy
    public void destroy()throws SQLException{
        pooledConnection.close();
    }
    public List<Point> getAllPoints() throws SQLException{
        List<Point> points = new ArrayList<>();
        Connection connection = pooledConnection.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select * from point");
        while (resultSet.next()) {
            points.add(new Point(resultSet.getDouble("x"), resultSet.getDouble("y"), resultSet.getDouble("r")));
        }
        resultSet.close();
        statement.close();
        connection.close();
        return points;
    }
}
