package org.generationitaly.casanova.persistence.dto;

import java.util.List;

import org.generationitaly.casanova.persistence.entity.Listing;
import org.generationitaly.casanova.persistence.entity.User;

/**
 * This RevisorProfileDTO provides a cleaner way for servlets to access
 * multiple datasets that are returned by multiple different queries
 * 
 * @author Redi Levendi
 * @version 0.1 Initial Version
 */
public class RevisorProfileDTO {
    private List<Listing> pendingList;

    public RevisorProfileDTO(List<Listing> pending) {
        this.pendingList = pending;
    }

	public List<Listing> getPendingList() {
		return pendingList;
	}

	public void setPendingList(List<Listing> pendingList) {
		this.pendingList = pendingList;
	}

    
    
}
