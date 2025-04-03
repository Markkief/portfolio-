package org.generationitaly.casanova.services;

import org.generationitaly.casanova.persistence.entity.Favourite;
import org.generationitaly.casanova.persistence.entity.Listing;
import org.generationitaly.casanova.persistence.entity.User;
import org.generationitaly.casanova.persistence.repository.FavouriteRepository;
import org.generationitaly.casanova.persistence.repository.ListingRepository;
import org.generationitaly.casanova.persistence.repository.UserRepository;
import org.generationitaly.casanova.persistence.repositoryImpl.FavouritesRepositoryImpl;
import org.generationitaly.casanova.persistence.repositoryImpl.ListingRepositoryImpl;
import org.generationitaly.casanova.persistence.repositoryImpl.UserRepositoryImpl;

public class FavouritesService {
    FavouriteRepository repo;
    ListingRepository listingRepo;
    UserRepository userRepo;

    public FavouritesService() {
        repo = FavouritesRepositoryImpl.getInstance();
        listingRepo = ListingRepositoryImpl.getInstance();
        userRepo = UserRepositoryImpl.getInstance();
    }

    public void favourite(Long listingId, Long userId) {
        Listing listing = listingRepo.findById(listingId);
        User user = userRepo.findById(userId);
        if (listing != null && user != null) {
            Favourite favourite = new Favourite();
            favourite.setListing(listing);
            favourite.setId_utente(user);
            repo.save(favourite);
        }
    }

    public void unfavourite(Integer likeId) {
        Favourite favourite = repo.findById(likeId);
        if (favourite != null) {
            repo.delete(favourite);
        }
    }
}
