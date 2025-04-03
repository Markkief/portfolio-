package org.generationitaly.casanova.persistence.repository;

import java.util.List;

import org.generationitaly.casanova.persistence.entity.RoleApplication;
import org.generationitaly.casanova.persistence.entity.User;

public interface RoleApplicationRepository extends JpaRepository<RoleApplication, Long>{
	 List<RoleApplication> findPending();
	 List<RoleApplication> findRejected();
}
