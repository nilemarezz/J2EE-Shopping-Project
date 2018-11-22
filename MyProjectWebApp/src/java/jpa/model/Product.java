/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jpa.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;


/**
 *
 * @author Nile
 */
@Entity
@Table(name = "PRODUCT")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Product.findAll", query = "SELECT p FROM Product p")
    , @NamedQuery(name = "Product.findByProductcode", query = "SELECT p FROM Product p WHERE p.productcode = :productcode")
    , @NamedQuery(name = "Product.findByProductname", query = "SELECT p FROM Product p WHERE lower(p.productname) like :productname"  + " OR lower(p.productline.productline) like :productname")
    , @NamedQuery(name = "Product.findByProductauthor", query = "SELECT p FROM Product p WHERE p.productauthor = :productauthor")
    , @NamedQuery(name = "Product.findByProductpublisher", query = "SELECT p FROM Product p WHERE p.productpublisher = :productpublisher")
    , @NamedQuery(name = "Product.findByQuantityinstock", query = "SELECT p FROM Product p WHERE p.quantityinstock = :quantityinstock")
    , @NamedQuery(name = "Product.findByProductprice", query = "SELECT p FROM Product p WHERE p.productprice = :productprice")})
public class Product implements Serializable {

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "productcode")
    private List<Orderdetail> orderdetailList;

   

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "productcode")
   

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(name = "PRODUCTCODE")
    private String productcode;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 80)
    @Column(name = "PRODUCTNAME")
    private String productname;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Column(name = "PRODUCTDESCRIPTION")
    private String productdescription;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 120)
    @Column(name = "PRODUCTAUTHOR")
    private String productauthor;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 70)
    @Column(name = "PRODUCTPUBLISHER")
    private String productpublisher;
    @Basic(optional = false)
    @NotNull
    @Column(name = "QUANTITYINSTOCK")
    private short quantityinstock;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "PRODUCTPRICE")
    private BigDecimal productprice;
    @JoinColumn(name = "PRODUCTLINE", referencedColumnName = "PRODUCTLINE")
    @ManyToOne(optional = false)
    private Productline productline;

    public Product() {
    }

    public Product(String productcode) {
        this.productcode = productcode;
    }

    public Product(String productcode, String productname, String productdescription, String productauthor, String productpublisher, short quantityinstock, BigDecimal productprice) {
        this.productcode = productcode;
        this.productname = productname;
        this.productdescription = productdescription;
        this.productauthor = productauthor;
        this.productpublisher = productpublisher;
        this.quantityinstock = quantityinstock;
        this.productprice = productprice;
    }

    public String getProductcode() {
        return productcode;
    }

    public void setProductcode(String productcode) {
        this.productcode = productcode;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public String getProductdescription() {
        return productdescription;
    }

    public void setProductdescription(String productdescription) {
        this.productdescription = productdescription;
    }

    public String getProductauthor() {
        return productauthor;
    }

    public void setProductauthor(String productauthor) {
        this.productauthor = productauthor;
    }

    public String getProductpublisher() {
        return productpublisher;
    }

    public void setProductpublisher(String productpublisher) {
        this.productpublisher = productpublisher;
    }

    public short getQuantityinstock() {
        return quantityinstock;
    }

    public void setQuantityinstock(short quantityinstock) {
        this.quantityinstock = quantityinstock;
    }

    public BigDecimal getProductprice() {
        return productprice;
    }

    public void setProductprice(BigDecimal productprice) {
        this.productprice = productprice;
    }

    public Productline getProductline() {
        return productline;
    }

    public void setProductline(Productline productline) {
        this.productline = productline;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (productcode != null ? productcode.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Product)) {
            return false;
        }
        Product other = (Product) object;
        if ((this.productcode == null && other.productcode != null) || (this.productcode != null && !this.productcode.equals(other.productcode))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "jpa.model.Product[ productcode=" + productcode + " ]";
    }

    @XmlTransient
    public List<Orderdetail> getOrderdetailList() {
        return orderdetailList;
    }

    public void setOrderdetailList(List<Orderdetail> orderdetailList) {
        this.orderdetailList = orderdetailList;
    }

    

    
    
}
