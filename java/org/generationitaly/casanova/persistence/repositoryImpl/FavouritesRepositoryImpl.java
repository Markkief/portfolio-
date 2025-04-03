package org.generationitaly.casanova.persistence.repositoryImpl;

import java.util.ArrayList;
import java.util.List;

import org.generationitaly.casanova.enums.ListingStatus;
import org.generationitaly.casanova.persistence.entity.Favourite;
import org.generationitaly.casanova.persistence.entity.Listing;
import org.generationitaly.casanova.persistence.repository.FavouriteRepository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class FavouritesRepositoryImpl  extends JpaRepositoryImpl<Favourite, Integer> implements FavouriteRepository{
    private static FavouritesRepositoryImpl instance;

    private FavouritesRepositoryImpl() {
        super(Favourite.class);
    }

    public static FavouritesRepositoryImpl getInstance() {
        if (instance == null) instance = new FavouritesRepositoryImpl();
        return instance;
    }

        @Override
    public List<Favourite> findAllByUser(Long id) {
    	 List<Favourite> fav = new ArrayList<>();
         EntityManager em = null;
         

         try {
             em = emf.createEntityManager();
             TypedQuery<Favourite> query = em.createQuery("FROM Favourite f WHERE f.id_utente.user_id = :utente", Favourite.class);
             query.setParameter("utente", id );
             fav = query.getResultList();
         } catch (Exception e) {
             System.err.println(e.getMessage());
         } finally {
             if (em != null) em.close();
         }

         return fav;
     }
    
}
