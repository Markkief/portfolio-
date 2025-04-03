package org.generationitaly.casanova.persistence.repositoryImpl;

import java.util.ArrayList;
import java.util.List;

import org.generationitaly.casanova.enums.ListingStatus;
import org.generationitaly.casanova.persistence.entity.Listing;
import org.generationitaly.casanova.persistence.entity.User;
import org.generationitaly.casanova.persistence.repository.ListingRepository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.TypedQuery;

public class ListingRepositoryImpl extends JpaRepositoryImpl<Listing, Long> implements ListingRepository{
    private static ListingRepositoryImpl instance;
    private EntityManagerFactory emf = PersistenceUtil.getEntityManagerFactory();

    public ListingRepositoryImpl() {
        super(Listing.class);
    }

    public static ListingRepositoryImpl getInstance() {
        if (instance == null) instance = new ListingRepositoryImpl();
        return instance;
    }

    // TODO Queries wont work without eager load
    @Override
    public List<Listing> findAllByPending() {
        List<Listing> pending = new ArrayList<>();
        EntityManager em = null;

        try {
            em = emf.createEntityManager();
            TypedQuery<Listing> query = em.createQuery("FROM Listing WHERE status = :status", Listing.class);
          query.setParameter("status", ListingStatus.PENDING);
            pending = query.getResultList();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        } finally {
            if (em != null) em.close();
        }

        return pending;
    }

    @Override
    public List<Listing> findFavouriteByUsername(String username) {
    	 List<Listing> fav = new ArrayList<>();
         EntityManager em = null;
         

         try {
             em = emf.createEntityManager();
             TypedQuery<Listing> query = em.createQuery("FROM Preferiti WHERE id_utente = :utente", Listing.class);
             query.setParameter("utente", ListingStatus.PENDING );
             fav = query.getResultList();
         } catch (Exception e) {
             System.err.println(e.getMessage());
         } finally {
             if (em != null) em.close();
         }

         return fav;
     }

    @Override
    public List<Listing> findByUser(String user) {
        List<Listing> listings = new ArrayList<>();
        EntityManager em = null;

        try {
            em = emf.createEntityManager();
            TypedQuery<Listing> query = em.createQuery("FROM Listing l WHERE l.user.username = :user", Listing.class);
            query.setParameter("user", user);
            listings = query.getResultList();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        } finally {
            if (em != null) em.close();
        }
        return listings;
    }

    
    

}
