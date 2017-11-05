import javax.annotation.PostConstruct;
import java.sql.SQLException;
import java.util.List;

public class Controller {
    private DAO dao;
    private List<Point> points;
    public void addPoint(Point point) throws SQLException{
        points.add(point);
        dao.addPoint(point);
    }

    public DAO getDao() {
        return dao;
    }

    public void setDao(DAO dao) {
        this.dao = dao;
    }

    public List<Point> getPoints() {
        return points;
    }

    public void setPoints(List<Point> points) {
        this.points = points;
    }
    @PostConstruct
    public void initList() throws SQLException{
        points = dao.getAllPoints();
    }
}
