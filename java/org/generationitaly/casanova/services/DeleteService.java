package org.generationitaly.casanova.services;

import org.generationitaly.casanova.persistence.entity.Listing;
import org.generationitaly.casanova.persistence.entity.Immobile;
import org.generationitaly.casanova.persistence.repository.ListingRepository;
import org.generationitaly.casanova.persistence.repository.ImmobileRepository;
import org.generationitaly.casanova.persistence.repositoryImpl.ListingRepositoryImpl;
import org.generationitaly.casanova.persistence.repositoryImpl.ImmobileRepositoryImpl;

public class DeleteService {
    private ListingRepository listingRepo;
    private ImmobileRepository immobileRepo;

    public DeleteService() {
        listingRepo = ListingRepositoryImpl.getInstance();
        immobileRepo = ImmobileRepositoryImpl.getInstance();
    }

    public void delete(String id) {
        Long listingId = Long.parseLong(id);
        Listing listing = listingRepo.findById(listingId);
        
        if (listing != null) {
            // First delete the listing
            listingRepo.delete(listing);
            
            // Then delete the associated building
            Immobile building = listing.getBuilding();
            if (building != null) {
                immobileRepo.delete(building);
            }
        }
    }
}
