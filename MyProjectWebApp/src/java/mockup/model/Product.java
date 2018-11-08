/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mockup.model;

/**
 *
 * @author Student
 */
public class Product {

    private String productCode;
    private String productName;
    private String productLine;
    private double productPrice;

    public Product() {
    }

    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductLine() {
        return productLine;
    }

    public void setProductLine(String productLine) {
        this.productLine = productLine;
    }

    

    public double getproductPrice() {
        return productPrice;
    }

    public void setproductPrice(double msrp) {
        this.productPrice = msrp;
    }
    
}
