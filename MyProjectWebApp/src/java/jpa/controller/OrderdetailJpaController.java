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
import jpa.model.Ordered;
import jpa.model.Product;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;
import jpa.controller.exceptions.IllegalOrphanException;
import jpa.controller.exceptions.NonexistentEntityException;
import jpa.controller.exceptions.RollbackFailureException;
import jpa.model.Orderdetail;

/**
 *
 * @author Student
 */
public class OrderdetailJpaController implements Serializable {

    public OrderdetailJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Orderdetail orderdetail) throws IllegalOrphanException, RollbackFailureException, Exception {
        List<String> illegalOrphanMessages = null;
        Ordered orderedOrphanCheck = orderdetail.getOrdered();
        if (orderedOrphanCheck != null) {
            Orderdetail oldOrderdetailOfOrdered = orderedOrphanCheck.getOrderdetail();
            if (oldOrderdetailOfOrdered != null) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("The Ordered " + orderedOrphanCheck + " already has an item of type Orderdetail whose ordered column cannot be null. Please make another selection for the ordered field.");
            }
        }
        if (illegalOrphanMessages != null) {
            throw new IllegalOrphanException(illegalOrphanMessages);
        }
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Ordered ordered = orderdetail.getOrdered();
            if (ordered != null) {
                ordered = em.getReference(ordered.getClass(), ordered.getOrderid());
                orderdetail.setOrdered(ordered);
            }
            Product productcode = orderdetail.getProductcode();
            if (productcode != null) {
                productcode = em.getReference(productcode.getClass(), productcode.getProductcode());
                orderdetail.setProductcode(productcode);
            }
            em.persist(orderdetail);
            if (ordered != null) {
                ordered.setOrderdetail(orderdetail);
                ordered = em.merge(ordered);
            }
            if (productcode != null) {
                productcode.getOrderdetailList().add(orderdetail);
                productcode = em.merge(productcode);
            }
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

    public void edit(Orderdetail orderdetail) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Orderdetail persistentOrderdetail = em.find(Orderdetail.class, orderdetail.getOrderid());
            Ordered orderedOld = persistentOrderdetail.getOrdered();
            Ordered orderedNew = orderdetail.getOrdered();
            Product productcodeOld = persistentOrderdetail.getProductcode();
            Product productcodeNew = orderdetail.getProductcode();
            List<String> illegalOrphanMessages = null;
            if (orderedNew != null && !orderedNew.equals(orderedOld)) {
                Orderdetail oldOrderdetailOfOrdered = orderedNew.getOrderdetail();
                if (oldOrderdetailOfOrdered != null) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("The Ordered " + orderedNew + " already has an item of type Orderdetail whose ordered column cannot be null. Please make another selection for the ordered field.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (orderedNew != null) {
                orderedNew = em.getReference(orderedNew.getClass(), orderedNew.getOrderid());
                orderdetail.setOrdered(orderedNew);
            }
            if (productcodeNew != null) {
                productcodeNew = em.getReference(productcodeNew.getClass(), productcodeNew.getProductcode());
                orderdetail.setProductcode(productcodeNew);
            }
            orderdetail = em.merge(orderdetail);
            if (orderedOld != null && !orderedOld.equals(orderedNew)) {
                orderedOld.setOrderdetail(null);
                orderedOld = em.merge(orderedOld);
            }
            if (orderedNew != null && !orderedNew.equals(orderedOld)) {
                orderedNew.setOrderdetail(orderdetail);
                orderedNew = em.merge(orderedNew);
            }
            if (productcodeOld != null && !productcodeOld.equals(productcodeNew)) {
                productcodeOld.getOrderdetailList().remove(orderdetail);
                productcodeOld = em.merge(productcodeOld);
            }
            if (productcodeNew != null && !productcodeNew.equals(productcodeOld)) {
                productcodeNew.getOrderdetailList().add(orderdetail);
                productcodeNew = em.merge(productcodeNew);
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
                Integer id = orderdetail.getOrderid();
                if (findOrderdetail(id) == null) {
                    throw new NonexistentEntityException("The orderdetail with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Integer id) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Orderdetail orderdetail;
            try {
                orderdetail = em.getReference(Orderdetail.class, id);
                orderdetail.getOrderid();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The orderdetail with id " + id + " no longer exists.", enfe);
            }
            Ordered ordered = orderdetail.getOrdered();
            if (ordered != null) {
                ordered.setOrderdetail(null);
                ordered = em.merge(ordered);
            }
            Product productcode = orderdetail.getProductcode();
            if (productcode != null) {
                productcode.getOrderdetailList().remove(orderdetail);
                productcode = em.merge(productcode);
            }
            em.remove(orderdetail);
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

    public List<Orderdetail> findOrderdetailEntities() {
        return findOrderdetailEntities(true, -1, -1);
    }

    public List<Orderdetail> findOrderdetailEntities(int maxResults, int firstResult) {
        return findOrderdetailEntities(false, maxResults, firstResult);
    }

    private List<Orderdetail> findOrderdetailEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Orderdetail.class));
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

    public Orderdetail findOrderdetail(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Orderdetail.class, id);
        } finally {
            em.close();
        }
    }

    public int getOrderdetailCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Orderdetail> rt = cq.from(Orderdetail.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
