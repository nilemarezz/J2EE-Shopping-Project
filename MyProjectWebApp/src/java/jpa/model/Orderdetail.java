/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jpa.model;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Student
 */
@Entity
@Table(name = "ORDERDETAIL")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Orderdetail.findAll", query = "SELECT o FROM Orderdetail o")
    , @NamedQuery(name = "Orderdetail.findByOrderid", query = "SELECT o FROM Orderdetail o WHERE o.orderid = :orderid")
    , @NamedQuery(name = "Orderdetail.findByProductquantity", query = "SELECT o FROM Orderdetail o WHERE o.productquantity = :productquantity")
    , @NamedQuery(name = "Orderdetail.findByProductprice", query = "SELECT o FROM Orderdetail o WHERE o.productprice = :productprice")})
public class Orderdetail implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ORDERID")
    private Integer orderid;
    @Basic(optional = false)
    @NotNull
    @Column(name = "PRODUCTQUANTITY")
    private int productquantity;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "PRODUCTPRICE")
    private BigDecimal productprice;
    @JoinColumn(name = "ORDERID", referencedColumnName = "ORDERID", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Ordered ordered;
    @JoinColumn(name = "PRODUCTCODE", referencedColumnName = "PRODUCTCODE")
    @ManyToOne(optional = false)
    private Product productcode;

    public Orderdetail() {
    }

    public Orderdetail(Integer orderid) {
        this.orderid = orderid;
    }

    public Orderdetail(Integer orderid, int productquantity, BigDecimal productprice) {
        this.orderid = orderid;
        this.productquantity = productquantity;
        this.productprice = productprice;
    }

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public int getProductquantity() {
        return productquantity;
    }

    public void setProductquantity(int productquantity) {
        this.productquantity = productquantity;
    }

    public BigDecimal getProductprice() {
        return productprice;
    }

    public void setProductprice(BigDecimal productprice) {
        this.productprice = productprice;
    }

    public Ordered getOrdered() {
        return ordered;
    }

    public void setOrdered(Ordered ordered) {
        this.ordered = ordered;
    }

    public Product getProductcode() {
        return productcode;
    }

    public void setProductcode(Product productcode) {
        this.productcode = productcode;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderid != null ? orderid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Orderdetail)) {
            return false;
        }
        Orderdetail other = (Orderdetail) object;
        if ((this.orderid == null && other.orderid != null) || (this.orderid != null && !this.orderid.equals(other.orderid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "jpa.model.Orderdetail[ orderid=" + orderid + " ]";
    }
    
}
