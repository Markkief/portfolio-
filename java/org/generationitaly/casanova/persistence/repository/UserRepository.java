package org.generationitaly.casanova.persistence.repository;

import org.generationitaly.casanova.persistence.entity.User;

/**
 * Repository interface for User table.
 * This interface provides CRUD methods and authentication for users
 * 
 * @author Redi Levendi
 * @version 0.1 Initial Version
 */

public interface UserRepository extends JpaRepository<User, Long>{
    /**
     * Finds and entity based on the username
     * @param username of the entity to search for
     * @return the entity with the searched username or {@code null}
     */
    User findByUsername(String username);
}
