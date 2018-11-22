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
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;
import jpa.controller.exceptions.IllegalOrphanException;
import jpa.controller.exceptions.NonexistentEntityException;
import jpa.controller.exceptions.PreexistingEntityException;
import jpa.controller.exceptions.RollbackFailureException;
import jpa.model.Account;

/**
 *
 * @author Student
 */
public class AccountJpaController implements Serializable {

    public AccountJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Account account) throws PreexistingEntityException, RollbackFailureException, Exception {
        if (account.getOrderedList() == null) {
            account.setOrderedList(new ArrayList<Ordered>());
        }
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            List<Ordered> attachedOrderedList = new ArrayList<Ordered>();
            for (Ordered orderedListOrderedToAttach : account.getOrderedList()) {
                orderedListOrderedToAttach = em.getReference(orderedListOrderedToAttach.getClass(), orderedListOrderedToAttach.getOrderid());
                attachedOrderedList.add(orderedListOrderedToAttach);
            }
            account.setOrderedList(attachedOrderedList);
            em.persist(account);
            for (Ordered orderedListOrdered : account.getOrderedList()) {
                Account oldUsernameOfOrderedListOrdered = orderedListOrdered.getUsername();
                orderedListOrdered.setUsername(account);
                orderedListOrdered = em.merge(orderedListOrdered);
                if (oldUsernameOfOrderedListOrdered != null) {
                    oldUsernameOfOrderedListOrdered.getOrderedList().remove(orderedListOrdered);
                    oldUsernameOfOrderedListOrdered = em.merge(oldUsernameOfOrderedListOrdered);
                }
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findAccount(account.getUsername()) != null) {
                throw new PreexistingEntityException("Account " + account + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Account account) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Account persistentAccount = em.find(Account.class, account.getUsername());
            List<Ordered> orderedListOld = persistentAccount.getOrderedList();
            List<Ordered> orderedListNew = account.getOrderedList();
            List<String> illegalOrphanMessages = null;
            for (Ordered orderedListOldOrdered : orderedListOld) {
                if (!orderedListNew.contains(orderedListOldOrdered)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Ordered " + orderedListOldOrdered + " since its username field is not nullable.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            List<Ordered> attachedOrderedListNew = new ArrayList<Ordered>();
            for (Ordered orderedListNewOrderedToAttach : orderedListNew) {
                orderedListNewOrderedToAttach = em.getReference(orderedListNewOrderedToAttach.getClass(), orderedListNewOrderedToAttach.getOrderid());
                attachedOrderedListNew.add(orderedListNewOrderedToAttach);
            }
            orderedListNew = attachedOrderedListNew;
            account.setOrderedList(orderedListNew);
            account = em.merge(account);
            for (Ordered orderedListNewOrdered : orderedListNew) {
                if (!orderedListOld.contains(orderedListNewOrdered)) {
                    Account oldUsernameOfOrderedListNewOrdered = orderedListNewOrdered.getUsername();
                    orderedListNewOrdered.setUsername(account);
                    orderedListNewOrdered = em.merge(orderedListNewOrdered);
                    if (oldUsernameOfOrderedListNewOrdered != null && !oldUsernameOfOrderedListNewOrdered.equals(account)) {
                        oldUsernameOfOrderedListNewOrdered.getOrderedList().remove(orderedListNewOrdered);
                        oldUsernameOfOrderedListNewOrdered = em.merge(oldUsernameOfOrderedListNewOrdered);
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
                String id = account.getUsername();
                if (findAccount(id) == null) {
                    throw new NonexistentEntityException("The account with id " + id + " no longer exists.");
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
            Account account;
            try {
                account = em.getReference(Account.class, id);
                account.getUsername();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The account with id " + id + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            List<Ordered> orderedListOrphanCheck = account.getOrderedList();
            for (Ordered orderedListOrphanCheckOrdered : orderedListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Account (" + account + ") cannot be destroyed since the Ordered " + orderedListOrphanCheckOrdered + " in its orderedList field has a non-nullable username field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            em.remove(account);
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

    public List<Account> findAccountEntities() {
        return findAccountEntities(true, -1, -1);
    }

    public List<Account> findAccountEntities(int maxResults, int firstResult) {
        return findAccountEntities(false, maxResults, firstResult);
    }

    private List<Account> findAccountEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Account.class));
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

    public Account findAccount(String id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Account.class, id);
        } finally {
            em.close();
        }
    }

    public int getAccountCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Account> rt = cq.from(Account.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
