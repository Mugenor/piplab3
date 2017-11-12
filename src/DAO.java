import org.icefaces.ace.component.sliderentry.SliderEntry;
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
    public DAO(){
        try {
            Class.forName("org.postgresql.Driver");
            pooledDataSource.setUrl("jdbc:postgresql://localhost:5432/postgres");
            pooledConnection = pooledDataSource.getPooledConnection("postgres", "qwerty");
        }catch (ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }
    }
    public void addPoint(Point point) throws SQLException{
        System.out.println("DAO.addPoint: " + point);
        Connection connection = pooledConnection.getConnection();
        Statement statement = connection.createStatement();
        statement.execute("insert into point(x, y, r, ishitted) VALUES (" + point.getX() + ", " + point.getY() + ", "
                + point.getR() + ", " + point.isHitted() + ")");
        statement.close();
        connection.close();
    }
    @PreDestroy
    public void destroy(){
        try {
            pooledConnection.close();
        }catch (SQLException e){
            e.printStackTrace();
        }
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
