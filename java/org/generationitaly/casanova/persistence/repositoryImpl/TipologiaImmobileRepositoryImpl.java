package org.generationitaly.casanova.persistence.repositoryImpl;

import org.generationitaly.casanova.persistence.entity.TipologiaImmobile;
import org.generationitaly.casanova.persistence.repository.TipologiaImmobileRepository;

public class TipologiaImmobileRepositoryImpl extends JpaRepositoryImpl<TipologiaImmobile, Long> implements TipologiaImmobileRepository{

	private static TipologiaImmobileRepositoryImpl instance;
	
	TipologiaImmobileRepositoryImpl() {
		super(TipologiaImmobile.class);
		// TODO Auto-generated constructor stub
	}

	public static TipologiaImmobileRepositoryImpl getInstance() {
		if (instance == null)
			instance = new TipologiaImmobileRepositoryImpl();
		return instance;
	}
}
