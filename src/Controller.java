import javax.annotation.PostConstruct;
import javax.faces.component.UIInput;
import javax.faces.context.FacesContext;
import javax.faces.event.AjaxBehaviorEvent;
import javax.faces.event.ValueChangeEvent;
import java.sql.SQLException;
import java.util.List;

public class Controller {
    private DAO dao;
    private List<Point> points;
    private Point point;
    private UIInput pseudoR;

    public UIInput getPseudoR() {
        return pseudoR;
    }

    public void setPseudoR(UIInput pseudoR) {
        this.pseudoR = pseudoR;
    }

    public void addPoint(AjaxBehaviorEvent event){
        try {
            System.out.println("points: " + points);
            points.add(point);
            dao.addPoint(point);
            point = new Point(point.getX(), point.getY(), point.getR());
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public Point getPoint() {
        return point;
    }

    public void setPoint(Point point) {
        System.out.println("controller.setPoint: " + point);
        this.point = point;
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

   /* public void rChanged(ValueChangeEvent vce){
        System.out.println("rChanged");
        String oldVal = vce.getOldValue().toString();
        if(oldVal!=null){
            String newVal = vce.getNewValue().toString();
            System.out.println(newVal);
            point.setR(Double.parseDouble(newVal));
            pseudoR.setValue(newVal);
            FacesContext.getCurrentInstance().getRenderResponse();
        }
    }*/

    @PostConstruct
    public void initList(){
        try {
            point.setR(1.0);
            points = dao.getAllPoints();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
}
