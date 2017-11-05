import java.io.Serializable;

public class Point implements Serializable {
    private double x;
    private double y;
    private double r;
    private boolean isHitted;
    public Point(){}
    public Point(double x, double y, double r){
        this.x = x;
        this.y = y;
        this.r = r;
        checkHitted();
    }
    public boolean checkHitted(){
        if((y<=(x/2.0 + r/2.0) && y>=0.0 && x<=0.0)
                || (x>=-r && x<=0.0 && y>=-r/2.0 && y<=0.0)
                || (x>=0.0 && y<=0.0 && (x*x+y*y)<=r*r)) {
            isHitted = true;
        } else {
            isHitted = false;
        }
        return isHitted;
    }

    public double getX() {
        return x;
    }

    public void setX(double x) {
        this.x = x;
    }

    public double getY() {
        return y;
    }

    public void setY(double y) {
        this.y = y;
    }

    public double getR() {
        return r;
    }

    public void setR(double r) {
        this.r = r;
    }

    public boolean isHitted() {
        return isHitted;
    }
    public String toString(){
        return "[\"x\":" + x +
                ", \"y\":" + y +
                ", \"r\":" + r +
                ", \"isHitted\":" + isHitted + "]";
    }
}
