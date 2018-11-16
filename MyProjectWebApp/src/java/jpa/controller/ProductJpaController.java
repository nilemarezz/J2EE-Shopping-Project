/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jpa.controller;

import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import jpa.model.Productline;
import jpa.model.Ordered;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;
import jpa.controller.exceptions.IllegalOrphanException;
import jpa.controller.exceptions.NonexistentEntityException;
import jpa.controller.exceptions.PreexistingEntityException;
import jpa.controller.exceptions.RollbackFailureException;
import jpa.model.Product;

/**
 *
 * @author Nile
 */
public class ProductJpaController implements Serializable {

    public ProductJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Product product) throws PreexistingEntityException, RollbackFailureException, Exception {
        if (product.getOrderedList() == null) {
            product.setOrderedList(new ArrayList<Ordered>());
        }
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Productline productline = product.getProductline();
            if (productline != null) {
                productline = em.getReference(productline.getClass(), productline.getProductline());
                product.setProductline(productline);
            }
            List<Ordered> attachedOrderedList = new ArrayList<Ordered>();
            for (Ordered orderedListOrderedToAttach : product.getOrderedList()) {
                orderedListOrderedToAttach = em.getReference(orderedListOrderedToAttach.getClass(), orderedListOrderedToAttach.getOrderid());
                attachedOrderedList.add(orderedListOrderedToAttach);
            }
            product.setOrderedList(attachedOrderedList);
            em.persist(product);
            if (productline != null) {
                productline.getProductList().add(product);
                productline = em.merge(productline);
            }
            for (Ordered orderedListOrdered : product.getOrderedList()) {
                Product oldProductcodeOfOrderedListOrdered = orderedListOrdered.getProductcode();
                orderedListOrdered.setProductcode(product);
                orderedListOrdered = em.merge(orderedListOrdered);
                if (oldProductcodeOfOrderedListOrdered != null) {
                    oldProductcodeOfOrderedListOrdered.getOrderedList().remove(orderedListOrdered);
                    oldProductcodeOfOrderedListOrdered = em.merge(oldProductcodeOfOrderedListOrdered);
                }
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findProduct(product.getProductcode()) != null) {
                throw new PreexistingEntityException("Product " + product + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Product product) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Product persistentProduct = em.find(Product.class, product.getProductcode());
            Productline productlineOld = persistentProduct.getProductline();
            Productline productlineNew = product.getProductline();
            List<Ordered> orderedListOld = persistentProduct.getOrderedList();
            List<Ordered> orderedListNew = product.getOrderedList();
            List<String> illegalOrphanMessages = null;
            for (Ordered orderedListOldOrdered : orderedListOld) {
                if (!orderedListNew.contains(orderedListOldOrdered)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Ordered " + orderedListOldOrdered + " since its productcode field is not nullable.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (productlineNew != null) {
                productlineNew = em.getReference(productlineNew.getClass(), productlineNew.getProductline());
                product.setProductline(productlineNew);
            }
            List<Ordered> attachedOrderedListNew = new ArrayList<Ordered>();
            for (Ordered orderedListNewOrderedToAttach : orderedListNew) {
                orderedListNewOrderedToAttach = em.getReference(orderedListNewOrderedToAttach.getClass(), orderedListNewOrderedToAttach.getOrderid());
                attachedOrderedListNew.add(orderedListNewOrderedToAttach);
            }
            orderedListNew = attachedOrderedListNew;
            product.setOrderedList(orderedListNew);
            product = em.merge(product);
            if (productlineOld != null && !productlineOld.equals(productlineNew)) {
                productlineOld.getProductList().remove(product);
                productlineOld = em.merge(productlineOld);
            }
            if (productlineNew != null && !productlineNew.equals(productlineOld)) {
                productlineNew.getProductList().add(product);
                productlineNew = em.merge(productlineNew);
            }
            for (Ordered orderedListNewOrdered : orderedListNew) {
                if (!orderedListOld.contains(orderedListNewOrdered)) {
                    Product oldProductcodeOfOrderedListNewOrdered = orderedListNewOrdered.getProductcode();
                    orderedListNewOrdered.setProductcode(product);
                    orderedListNewOrdered = em.merge(orderedListNewOrdered);
                    if (oldProductcodeOfOrderedListNewOrdered != null && !oldProductcodeOfOrderedListNewOrdered.equals(product)) {
                        oldProductcodeOfOrderedListNewOrdered.getOrderedList().remove(orderedListNewOrdered);
                        oldProductcodeOfOrderedListNewOrdered = em.merge(oldProductcodeOfOrderedListNewOrdered);
                    }
                }
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                String id = product.getProductcode();
                if (findProduct(id) == null) {
                    throw new NonexistentEntityException("The product with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(String id) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Product product;
            try {
                product = em.getReference(Product.class, id);
                product.getProductcode();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The product with id " + id + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            List<Ordered> orderedListOrphanCheck = product.getOrderedList();
            for (Ordered orderedListOrphanCheckOrdered : orderedListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Product (" + product + ") cannot be destroyed since the Ordered " + orderedListOrphanCheckOrdered + " in its orderedList field has a non-nullable productcode field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            Productline productline = product.getProductline();
            if (productline != null) {
                productline.getProductList().remove(product);
                productline = em.merge(productline);
            }
            em.remove(product);
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Product> findProductEntities() {
        return findProductEntities(true, -1, -1);
    }

    public List<Product> findProductEntities(int maxResults, int firstResult) {
        return findProductEntities(false, maxResults, firstResult);
    }

    private List<Product> findProductEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Product.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Product findProduct(String id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Product.class, id);
        } finally {
            em.close();
        }
    }

    public int getProductCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Product> rt = cq.from(Product.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    public List <Product> findByProductName(String ProductName){
        EntityManager em = getEntityManager();
        try{
            Query query = em.createNamedQuery("Product.findByProductname");
            query.setParameter("productname", "%" + ProductName.toLowerCase()+"%");
            return query.getResultList();
        }finally{
            em.close();
        }
    }
    
}
