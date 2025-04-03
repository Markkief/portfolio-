package org.generationitaly.casanova.persistence.repositoryImpl;

import org.generationitaly.casanova.persistence.entity.ImmagineImmobile;
import org.generationitaly.casanova.persistence.repository.ImmagineRepository;
import org.generationitaly.casanova.persistence.repository.JpaRepository;

public class ImmagineRepositoryImpl extends JpaRepositoryImpl<ImmagineImmobile, Long> implements ImmagineRepository{

	private static ImmagineRepositoryImpl instance;
	
	ImmagineRepositoryImpl() {
		super(ImmagineImmobile.class);
		// TODO Auto-generated constructor stub
	}

	public static ImmagineRepositoryImpl getInstance() {
		if (instance == null)
			instance = new ImmagineRepositoryImpl();
		return instance;
	}
}
