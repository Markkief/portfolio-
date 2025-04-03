package org.generationitaly.casanova.persistence.repositoryImpl;


import java.util.List;

import org.generationitaly.casanova.persistence.dto.ImmLisDTO;
import org.generationitaly.casanova.persistence.entity.Immobile;
import org.generationitaly.casanova.persistence.entity.Listing;
import org.generationitaly.casanova.persistence.repository.ImmLisRepository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;

public class ImmLisRepositoryImpl implements ImmLisRepository{

	private static ImmLisRepositoryImpl instance;
	@Override
	public List<ImmLisDTO> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	//Probabilmente va aggiunto find per lista
	public void update(ImmLisDTO ImmLis) {
		Listing lis = ImmLis.getLi(); 
		EntityManagerFactory emf = PersistenceUtil.getEntityManagerFactory();
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			Immobile manageIm = em.merge(ImmLis.getIm());
			lis.setBuilding(manageIm);
			em.merge(lis);
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive())
				tx.rollback();
		} finally {
			if (em != null)
				em.close();
			
		}	
	}
	
	public static ImmLisRepositoryImpl getInstance() {
		  if (instance == null) instance = new ImmLisRepositoryImpl();
	        return instance;
	}

}
