/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jpa.controller;

import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.transaction.UserTransaction;
import jpa.controller.exceptions.NonexistentEntityException;
import jpa.controller.exceptions.RollbackFailureException;
import jpa.model.Account;
import jpa.model.Ordered;
import jpa.model.Product;

/**
 *
 * @author Nile
 */
public class OrderedJpaController implements Serializable {

    public OrderedJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Ordered ordered) throws RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Account username = ordered.getUsername();
            if (username != null) {
                username = em.getReference(username.getClass(), username.getUsername());
                ordered.setUsername(username);
            }
            Product productcode = ordered.getProductcode();
            if (productcode != null) {
                productcode = em.getReference(productcode.getClass(), productcode.getProductcode());
                ordered.setProductcode(productcode);
            }
            em.persist(ordered);
            if (username != null) {
                username.getOrderedList().add(ordered);
                username = em.merge(username);
            }
            if (productcode != null) {
                productcode.getOrderedList().add(ordered);
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

    public void edit(Ordered ordered) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Ordered persistentOrdered = em.find(Ordered.class, ordered.getOrderid());
            Account usernameOld = persistentOrdered.getUsername();
            Account usernameNew = ordered.getUsername();
            Product productcodeOld = persistentOrdered.getProductcode();
            Product productcodeNew = ordered.getProductcode();
            if (usernameNew != null) {
                usernameNew = em.getReference(usernameNew.getClass(), usernameNew.getUsername());
                ordered.setUsername(usernameNew);
            }
            if (productcodeNew != null) {
                productcodeNew = em.getReference(productcodeNew.getClass(), productcodeNew.getProductcode());
                ordered.setProductcode(productcodeNew);
            }
            ordered = em.merge(ordered);
            if (usernameOld != null && !usernameOld.equals(usernameNew)) {
                usernameOld.getOrderedList().remove(ordered);
                usernameOld = em.merge(usernameOld);
            }
            if (usernameNew != null && !usernameNew.equals(usernameOld)) {
                usernameNew.getOrderedList().add(ordered);
                usernameNew = em.merge(usernameNew);
            }
            if (productcodeOld != null && !productcodeOld.equals(productcodeNew)) {
                productcodeOld.getOrderedList().remove(ordered);
                productcodeOld = em.merge(productcodeOld);
            }
            if (productcodeNew != null && !productcodeNew.equals(productcodeOld)) {
                productcodeNew.getOrderedList().add(ordered);
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
                Integer id = ordered.getOrderid();
                if (findOrdered(id) == null) {
                    throw new NonexistentEntityException("The ordered with id " + id + " no longer exists.");
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
            Ordered ordered;
            try {
                ordered = em.getReference(Ordered.class, id);
                ordered.getOrderid();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The ordered with id " + id + " no longer exists.", enfe);
            }
            Account username = ordered.getUsername();
            if (username != null) {
                username.getOrderedList().remove(ordered);
                username = em.merge(username);
            }
            Product productcode = ordered.getProductcode();
            if (productcode != null) {
                productcode.getOrderedList().remove(ordered);
                productcode = em.merge(productcode);
            }
            em.remove(ordered);
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

    public List<Ordered> findOrderedEntities() {
        return findOrderedEntities(true, -1, -1);
    }

    public List<Ordered> findOrderedEntities(int maxResults, int firstResult) {
        return findOrderedEntities(false, maxResults, firstResult);
    }

    private List<Ordered> findOrderedEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Ordered.class));
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

    public Ordered findOrdered(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Ordered.class, id);
        } finally {
            em.close();
        }
    }

    public int getOrderedCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Ordered> rt = cq.from(Ordered.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
