/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jpa.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Student
 */
@Entity
@Table(name = "ORDERED")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Ordered.findAll", query = "SELECT o FROM Ordered o")
    , @NamedQuery(name = "Ordered.findByOrderid", query = "SELECT o FROM Ordered o WHERE o.orderid = :orderid")
    , @NamedQuery(name = "Ordered.findByOrderdate", query = "SELECT o FROM Ordered o WHERE o.orderdate = :orderdate")
    , @NamedQuery(name = "Ordered.findByTotalprice", query = "SELECT o FROM Ordered o WHERE o.totalprice = :totalprice")
    , @NamedQuery(name = "Ordered.findByTotalquantity", query = "SELECT o FROM Ordered o WHERE o.totalquantity = :totalquantity")})
public class Ordered implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ORDERID")
    private Integer orderid;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ORDERDATE")
    @Temporal(TemporalType.DATE)
    private Date orderdate;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "TOTALPRICE")
    private BigDecimal totalprice;
    @Basic(optional = false)
    @NotNull
    @Column(name = "TOTALQUANTITY")
    private int totalquantity;
    @JoinColumn(name = "USERNAME", referencedColumnName = "USERNAME")
    @ManyToOne(optional = false)
    private Account username;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "ordered")
    private Orderdetail orderdetail;

    public Ordered() {
    }

    public Ordered(Integer orderid) {
        this.orderid = orderid;
    }

    public Ordered(Integer orderid, Date orderdate, BigDecimal totalprice, int totalquantity) {
        this.orderid = orderid;
        this.orderdate = orderdate;
        this.totalprice = totalprice;
        this.totalquantity = totalquantity;
    }

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public Date getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(Date orderdate) {
        this.orderdate = orderdate;
    }

    public BigDecimal getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(BigDecimal totalprice) {
        this.totalprice = totalprice;
    }

    public int getTotalquantity() {
        return totalquantity;
    }

    public void setTotalquantity(int totalquantity) {
        this.totalquantity = totalquantity;
    }

    public Account getUsername() {
        return username;
    }

    public void setUsername(Account username) {
        this.username = username;
    }

    public Orderdetail getOrderdetail() {
        return orderdetail;
    }

    public void setOrderdetail(Orderdetail orderdetail) {
        this.orderdetail = orderdetail;
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
        if (!(object instanceof Ordered)) {
            return false;
        }
        Ordered other = (Ordered) object;
        if ((this.orderid == null && other.orderid != null) || (this.orderid != null && !this.orderid.equals(other.orderid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "jpa.model.Ordered[ orderid=" + orderid + " ]";
    }
    
}
