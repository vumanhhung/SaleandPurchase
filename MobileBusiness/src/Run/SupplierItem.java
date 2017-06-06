/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Run;

/**
 *
 * @author Dell
 */
public class SupplierItem {
    private int supID;
    private String supName;

    public SupplierItem(String supName, int supID) {
        this.supID = supID;
        this.supName = supName;
    }
    
    @Override
    public String toString()
    {
        return supName;
    }
    

    public int getSupID() {
        return supID;
    }

    public String getSupName() {
        return supName;
    }
    
    
}
