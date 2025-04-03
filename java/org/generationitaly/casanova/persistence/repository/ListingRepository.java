package org.generationitaly.casanova.persistence.repository;

import java.util.List;


import org.generationitaly.casanova.persistence.entity.Listing;

/**
 * Provides a contract for implementations that execute queries in the Listing entity
 * 
 * @author Redi Levendi
 * @version 0.1 Initial Version
 */
public interface ListingRepository extends JpaRepository<Listing, Long>{
    List<Listing> findFavouriteByUsername(String username);
    List<Listing> findAllByPending();
    List<Listing> findByUser(String user);
}
