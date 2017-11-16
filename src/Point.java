import javax.faces.component.UIComponent;
import javax.faces.component.UIInput;
import javax.faces.event.ValueChangeEvent;
import java.io.Serializable;

public class Point implements Serializable {
    private double x;
    private double y;
    private double r;
    private boolean hitted;
    public Point(){}
    public Point(double x, double y, double r){
        this.x = x;
        this.y = y;
        this.r = r;
        checkHitted();
    }
    public boolean checkHitted(){
        System.out.println("checkHitted: " + this);
        if((y<=(x/2.0 + r/2.0) && y>=0.0 && x<=0.0)
                || (x>=-r && x<=0.0 && y>=-r/2.0 && y<=0.0)
                || (x>=0.0 && y<=0.0 && (x*x+y*y)<=r*r)) {
            hitted = true;
        } else {
            hitted = false;
        }
        return hitted;
    }
    public double getX() {
        System.out.println("getX: " + this);
        return x;
    }

    public void setX(double x) {
        this.x = x;
        System.out.println("setX: " + this);
    }

    public double getY() {
        System.out.println("getY: " + this);
        return y;
    }

    public void setY(double y) {
        System.out.println("setY: " + this);
        this.y = y;
    }

    public double getR() {
        System.out.println("getR: " + this);
        return r;
    }

    public void setR(double r) {
        System.out.println("setR: " + this);
        this.r = r;
    }

    public boolean isHitted() {
        System.out.println("isHitted: " + this);
        return hitted;
    }
    public String toString(){
        return "[\"x\":" + x +
                ", \"y\":" + y +
                ", \"r\":" + r +
                ", \"isHitted\":" + hitted + "]";
    }
}
