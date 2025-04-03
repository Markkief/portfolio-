package org.generationitaly.casanova.services;

import org.generationitaly.casanova.enums.ListingStatus;
import org.generationitaly.casanova.persistence.entity.Listing;
import org.generationitaly.casanova.persistence.repository.ListingRepository;
import org.generationitaly.casanova.persistence.repositoryImpl.ListingRepositoryImpl;

public class StatusChangeService {
    ListingRepository repo;

    public StatusChangeService() {
        repo = ListingRepositoryImpl.getInstance();
    }

    public void update(ListingStatus status, Long id) {
        Listing managed = repo.findById(id);
        managed.setStatus(status);
        repo.update(managed);
    }
}
