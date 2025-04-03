package org.generationitaly.casanova.persistence.repositoryImpl;

import java.util.ArrayList;
import java.util.List;

import org.generationitaly.casanova.enums.RoleStatus;
import org.generationitaly.casanova.persistence.entity.RoleApplication;
import org.generationitaly.casanova.persistence.repository.RoleApplicationRepository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.TypedQuery;

/**
 * Singleton implementation of the RoleApplication repository.
 * This class is meant to be used by servlets handling some user dashboards
 * 
 * @author Redi Levendi
 * @version 0.1 Initial Version
 */

public class RoleApplicationRepositoryImpl extends JpaRepositoryImpl<RoleApplication, Long> implements RoleApplicationRepository{
    private static RoleApplicationRepositoryImpl instance;
    private EntityManagerFactory emf = PersistenceUtil.getEntityManagerFactory();
    
    private RoleApplicationRepositoryImpl() {
        super(RoleApplication.class);
    }

    public static RoleApplicationRepositoryImpl getInstance() {
        if (instance == null) instance = new RoleApplicationRepositoryImpl();
        return instance;
    }

    @Override
    public List<RoleApplication> findPending() {
        List<RoleApplication> pending = new ArrayList<>() ;
        EntityManager em = null;

        try {
            em = emf.createEntityManager();
            TypedQuery<RoleApplication> query = em.createQuery("SELECT r FROM RoleApplication r WHERE r.request_status = :status", RoleApplication.class);
            query.setParameter("status", RoleStatus.PENDING);
            pending = query.getResultList();
        } catch (Exception e) {
            System.err.println(e.getMessage());

        } finally {
            if (em != null) em.close();
        }
        if(pending == null)
        	System.out.println("pendin null");
        
        for(RoleApplication x : pending)
        	System.out.println(x.getRequest_status());
        return pending;
    }

    @Override
    public List<RoleApplication> findRejected() {
        List<RoleApplication> rejected = new ArrayList<>() ;
        EntityManager em = null;

        try {
            em = emf.createEntityManager();
            TypedQuery<RoleApplication> query = em.createQuery("FROM RoleApplication WHERE request_status = :status", RoleApplication.class);
            query.setParameter("status", RoleStatus.REJECTED);
            rejected = query.getResultList();
        } catch (Exception e) {
            System.err.println(e.getMessage());

        } finally {
            if (em != null) em.close();
        }
        if(rejected == null)
        	System.out.println("rejected null");
        
        for(RoleApplication x : rejected)
        	System.out.println(x.getRequest_status());
        return rejected;
    }
    
}
