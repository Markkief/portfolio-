package org.generationitaly.casanova.persistence.dto;

import java.util.List;

import org.generationitaly.casanova.persistence.entity.Favourite;
import org.generationitaly.casanova.persistence.entity.Immobile;
import org.generationitaly.casanova.persistence.entity.Listing;
import org.generationitaly.casanova.persistence.entity.User;

/**
 * This UserProfileDTO provides a cleaner way for the servlets to access
 * multiple datasets that are returned by multiple different queries
 * 
 * @author Redi Levendi
 * @version 0.3 Changed dependency to Listing
 */
public class UserProfileDTO {
    private List<Listing> listingList;
    private List<Favourite> favouritesList;

    public UserProfileDTO(List<Listing> listingList, List<Favourite> favouritesList) {
        this.listingList = listingList;
        this.favouritesList = favouritesList;
    }

    public List<Listing> getListingList() {
        return listingList;
    }

    public void setListingList(List<Listing> listingList) {
        this.listingList = listingList;
    }

    public List<Favourite> getFavouritesList() {
        return favouritesList;
    }

    public void setFavouritesList(List<Favourite> favouritesList) {
        this.favouritesList = favouritesList;
    }

    
    
}
