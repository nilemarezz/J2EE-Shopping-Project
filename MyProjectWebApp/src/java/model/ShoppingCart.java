/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import jpa.model.Product;

//import sit.int303.mockup.model.Product;

/**
 *
 * @author INT303
 */
public class ShoppingCart implements Serializable {
    
    private Map<String, LineItem> cart;
    
    public ShoppingCart() {
        cart = new HashMap();
    }
    
    public void add(Product p) {
        LineItem line = cart.get(p.getProductcode());
        if (line == null) {
            cart.put(p.getProductcode(), new LineItem(p));
        } else {
            if(line.getQuantity() > p.getQuantityinstock()){
                return;
            }
            line.setQuantity(line.getQuantity() + 1);
        }
    }
    
    public void minus(Product p) {
        LineItem line = cart.get(p.getProductcode());
        if(line.getQuantity() <= 1 ){
            return;
        }else{
        line.setQuantity(line.getQuantity() -1);
        }
    }
    
    public void remove(Product p) {
        this.remove(p.getProductcode());
    }
    
    public void remove(String productCode) {
        cart.remove(productCode);
    }
    
    public BigDecimal getTotalPrice(){
        BigDecimal sum = BigDecimal.ZERO ;
        Collection<LineItem> lineItems = cart.values();
        for (LineItem lineItem : lineItems) {
            sum = sum.add( lineItem.getTotalPrice());
        }
        return sum;
    }
    
    public int getTotalQuantity(){
        int sum =0;
        Collection<LineItem> lineItems = cart.values();
        for (LineItem lineItem : lineItems) {
            sum += lineItem.getQuantity();
        }
        return sum;
    }
    
    public List<LineItem> getLineItems(){
        return new ArrayList(cart.values());
    }
}
