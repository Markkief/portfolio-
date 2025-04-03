package org.generationitaly.casanova.services;

import org.generationitaly.casanova.persistence.dto.UserProfileDTO;
import org.generationitaly.casanova.persistence.repository.FavouriteRepository;
import org.generationitaly.casanova.persistence.repository.ListingRepository;
import org.generationitaly.casanova.persistence.repository.RoleApplicationRepository;
import org.generationitaly.casanova.persistence.repository.UserRepository;
import org.generationitaly.casanova.persistence.repositoryImpl.FavouritesRepositoryImpl;
import org.generationitaly.casanova.persistence.repositoryImpl.ListingRepositoryImpl;
import org.generationitaly.casanova.persistence.repositoryImpl.RoleApplicationRepositoryImpl;
import org.generationitaly.casanova.persistence.repositoryImpl.UserRepositoryImpl;

/**
 * This service class is meant to populate the UserProfileDTO
 * needed by the /profile servlet
 * 
 * @author Redi Levendi
 * @version 0.0.2 Added implementation
 */
public class UserProfileService {
    UserProfileDTO profile;
    ListingRepository repoLst;
    FavouriteRepository repoFav;
    UserRepository repoUsr;
    

    public UserProfileService(String user, Long id) {
        repoLst = ListingRepositoryImpl.getInstance();
        repoFav = FavouritesRepositoryImpl.getInstance();
        repoUsr = UserRepositoryImpl.getInstance();
            profile = new UserProfileDTO(
            repoLst.findByUser(user),
            repoFav.findAllByUser(id)
        );
    }

    public UserProfileDTO getProfile() {
        return profile;
    }
}
