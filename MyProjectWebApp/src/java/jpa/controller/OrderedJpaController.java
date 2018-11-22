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
import jpa.model.Account;
import jpa.model.Orderdetail;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;
import jpa.controller.exceptions.IllegalOrphanException;
import jpa.controller.exceptions.NonexistentEntityException;
import jpa.controller.exceptions.RollbackFailureException;
import jpa.model.Ordered;

/**
 *
 * @author Student
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
            Orderdetail orderdetail = ordered.getOrderdetail();
            if (orderdetail != null) {
                orderdetail = em.getReference(orderdetail.getClass(), orderdetail.getOrderid());
                ordered.setOrderdetail(orderdetail);
            }
            em.persist(ordered);
            if (username != null) {
                username.getOrderedList().add(ordered);
                username = em.merge(username);
            }
            if (orderdetail != null) {
                Ordered oldOrderedOfOrderdetail = orderdetail.getOrdered();
                if (oldOrderedOfOrderdetail != null) {
                    oldOrderedOfOrderdetail.setOrderdetail(null);
                    oldOrderedOfOrderdetail = em.merge(oldOrderedOfOrderdetail);
                }
                orderdetail.setOrdered(ordered);
                orderdetail = em.merge(orderdetail);
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

    public void edit(Ordered ordered) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Ordered persistentOrdered = em.find(Ordered.class, ordered.getOrderid());
            Account usernameOld = persistentOrdered.getUsername();
            Account usernameNew = ordered.getUsername();
            Orderdetail orderdetailOld = persistentOrdered.getOrderdetail();
            Orderdetail orderdetailNew = ordered.getOrderdetail();
            List<String> illegalOrphanMessages = null;
            if (orderdetailOld != null && !orderdetailOld.equals(orderdetailNew)) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("You must retain Orderdetail " + orderdetailOld + " since its ordered field is not nullable.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (usernameNew != null) {
                usernameNew = em.getReference(usernameNew.getClass(), usernameNew.getUsername());
                ordered.setUsername(usernameNew);
            }
            if (orderdetailNew != null) {
                orderdetailNew = em.getReference(orderdetailNew.getClass(), orderdetailNew.getOrderid());
                ordered.setOrderdetail(orderdetailNew);
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
            if (orderdetailNew != null && !orderdetailNew.equals(orderdetailOld)) {
                Ordered oldOrderedOfOrderdetail = orderdetailNew.getOrdered();
                if (oldOrderedOfOrderdetail != null) {
                    oldOrderedOfOrderdetail.setOrderdetail(null);
                    oldOrderedOfOrderdetail = em.merge(oldOrderedOfOrderdetail);
                }
                orderdetailNew.setOrdered(ordered);
                orderdetailNew = em.merge(orderdetailNew);
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

    public void destroy(Integer id) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
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
            List<String> illegalOrphanMessages = null;
            Orderdetail orderdetailOrphanCheck = ordered.getOrderdetail();
            if (orderdetailOrphanCheck != null) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Ordered (" + ordered + ") cannot be destroyed since the Orderdetail " + orderdetailOrphanCheck + " in its orderdetail field has a non-nullable ordered field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            Account username = ordered.getUsername();
            if (username != null) {
                username.getOrderedList().remove(ordered);
                username = em.merge(username);
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
