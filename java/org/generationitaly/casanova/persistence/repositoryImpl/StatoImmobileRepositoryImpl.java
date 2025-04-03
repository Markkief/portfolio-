package org.generationitaly.casanova.persistence.repositoryImpl;

import org.generationitaly.casanova.persistence.entity.StatoImmobile;
import org.generationitaly.casanova.persistence.repository.StatoImmobileRepository;

public class StatoImmobileRepositoryImpl extends JpaRepositoryImpl<StatoImmobile, Long> implements StatoImmobileRepository{

	private static StatoImmobileRepositoryImpl instance;
	
	StatoImmobileRepositoryImpl() {
		super(StatoImmobile.class);
		// TODO Auto-generated constructor stub
	}
	
	public static StatoImmobileRepositoryImpl getInstance() {
		if (instance == null)
			instance = new StatoImmobileRepositoryImpl();
		return instance;
	}

}
