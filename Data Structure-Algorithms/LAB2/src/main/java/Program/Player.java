/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Program;

/**
 *
 * @author User
 */
public class Player {
    
    private String email;
    private long point;

    public Player() {
    }
    
    public Player(String email) {
        this.email = email;
    }

    public Player(String email, long point) {
        this.email = email;
        this.point = point;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public long getPoint() {
        return point;
    }

    public void setPoint(long point) {
        this.point = point;
    }
    
    @Override
    public String toString() {
        return "(" + this.getEmail() + ", " + this.getPoint() + ")";
    }
}
