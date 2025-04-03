package org.generationitaly.casanova.services;

import org.generationitaly.casanova.persistence.entity.Listing;
import org.generationitaly.casanova.persistence.repository.ListingRepository;
import org.generationitaly.casanova.persistence.repositoryImpl.ListingRepositoryImpl;

public class GetService {
    ListingRepository repo;

    public GetService() {
        repo = ListingRepositoryImpl.getInstance();
    }

    public Listing get(Long id) {
        return repo.findById(id);
    }
}
