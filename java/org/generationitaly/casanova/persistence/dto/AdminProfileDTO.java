package org.generationitaly.casanova.persistence.dto;

import java.util.List;

import org.generationitaly.casanova.persistence.entity.Listing;
import org.generationitaly.casanova.persistence.entity.RoleApplication;
import org.generationitaly.casanova.persistence.entity.User;

/**
 * This AdminProfileDTO provides a cleaner way for servlets to access
 * multiple datasets that are returned by multiple different queries
 * 
 * @author Redi Levendi
 * @version 0.2 Cleaned redundant data
 */
public class AdminProfileDTO {
    private List<RoleApplication> applicationsList;
    private List<Listing> pendingList;
    private List<RoleApplication> rejectedAppList;

    public AdminProfileDTO() {}

    

    public AdminProfileDTO(List<RoleApplication> applicationsList, List<Listing> pendingList,
            List<RoleApplication> rejectedAppList) {
        this.applicationsList = applicationsList;
        this.pendingList = pendingList;
        this.rejectedAppList = rejectedAppList;
    }



    public List<RoleApplication> getApplicationsList() {
        return applicationsList;
    }
    public void setApplicationsList(List<RoleApplication> applicationsList) {
        this.applicationsList = applicationsList;
    }
    public List<RoleApplication> getRejectedAppList() {
        return rejectedAppList;
    }
    public void setRejectedAppList(List<RoleApplication> rejectedAppList) {
        this.rejectedAppList = rejectedAppList;
    }
    public List<Listing> getPendingList() {
        return pendingList;
    }
    public void setPendingList(List<Listing> pendingList) {
        this.pendingList = pendingList;
    }

    
}
