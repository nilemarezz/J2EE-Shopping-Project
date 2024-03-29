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
import jpa.model.Historyorder;
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
 * @author Nile
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
        if (account.getHistoryorderList() == null) {
            account.setHistoryorderList(new ArrayList<Historyorder>());
        }
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            List<Historyorder> attachedHistoryorderList = new ArrayList<Historyorder>();
            for (Historyorder historyorderListHistoryorderToAttach : account.getHistoryorderList()) {
                historyorderListHistoryorderToAttach = em.getReference(historyorderListHistoryorderToAttach.getClass(), historyorderListHistoryorderToAttach.getOrderid());
                attachedHistoryorderList.add(historyorderListHistoryorderToAttach);
            }
            account.setHistoryorderList(attachedHistoryorderList);
            em.persist(account);
            for (Historyorder historyorderListHistoryorder : account.getHistoryorderList()) {
                Account oldUsernameOfHistoryorderListHistoryorder = historyorderListHistoryorder.getUsername();
                historyorderListHistoryorder.setUsername(account);
                historyorderListHistoryorder = em.merge(historyorderListHistoryorder);
                if (oldUsernameOfHistoryorderListHistoryorder != null) {
                    oldUsernameOfHistoryorderListHistoryorder.getHistoryorderList().remove(historyorderListHistoryorder);
                    oldUsernameOfHistoryorderListHistoryorder = em.merge(oldUsernameOfHistoryorderListHistoryorder);
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
            List<Historyorder> historyorderListOld = persistentAccount.getHistoryorderList();
            List<Historyorder> historyorderListNew = account.getHistoryorderList();
            List<String> illegalOrphanMessages = null;
            for (Historyorder historyorderListOldHistoryorder : historyorderListOld) {
                if (!historyorderListNew.contains(historyorderListOldHistoryorder)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Historyorder " + historyorderListOldHistoryorder + " since its username field is not nullable.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            List<Historyorder> attachedHistoryorderListNew = new ArrayList<Historyorder>();
            for (Historyorder historyorderListNewHistoryorderToAttach : historyorderListNew) {
                historyorderListNewHistoryorderToAttach = em.getReference(historyorderListNewHistoryorderToAttach.getClass(), historyorderListNewHistoryorderToAttach.getOrderid());
                attachedHistoryorderListNew.add(historyorderListNewHistoryorderToAttach);
            }
            historyorderListNew = attachedHistoryorderListNew;
            account.setHistoryorderList(historyorderListNew);
            account = em.merge(account);
            for (Historyorder historyorderListNewHistoryorder : historyorderListNew) {
                if (!historyorderListOld.contains(historyorderListNewHistoryorder)) {
                    Account oldUsernameOfHistoryorderListNewHistoryorder = historyorderListNewHistoryorder.getUsername();
                    historyorderListNewHistoryorder.setUsername(account);
                    historyorderListNewHistoryorder = em.merge(historyorderListNewHistoryorder);
                    if (oldUsernameOfHistoryorderListNewHistoryorder != null && !oldUsernameOfHistoryorderListNewHistoryorder.equals(account)) {
                        oldUsernameOfHistoryorderListNewHistoryorder.getHistoryorderList().remove(historyorderListNewHistoryorder);
                        oldUsernameOfHistoryorderListNewHistoryorder = em.merge(oldUsernameOfHistoryorderListNewHistoryorder);
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
            List<Historyorder> historyorderListOrphanCheck = account.getHistoryorderList();
            for (Historyorder historyorderListOrphanCheckHistoryorder : historyorderListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Account (" + account + ") cannot be destroyed since the Historyorder " + historyorderListOrphanCheckHistoryorder + " in its historyorderList field has a non-nullable username field.");
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
