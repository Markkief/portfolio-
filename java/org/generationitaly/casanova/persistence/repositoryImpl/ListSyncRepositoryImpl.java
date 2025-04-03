package org.generationitaly.casanova.persistence.repositoryImpl;

import org.generationitaly.casanova.persistence.entity.Immobile;
import org.generationitaly.casanova.persistence.entity.Listing;
import org.generationitaly.casanova.persistence.repository.ListSyncRepository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;

public class ListSyncRepositoryImpl implements ListSyncRepository {

	
	private static ListSyncRepositoryImpl instance;
	
	public ListSyncRepositoryImpl() {}

	public static ListSyncRepositoryImpl getInstance() {
	if (instance == null)
	 instance = new ListSyncRepositoryImpl();
	return instance;
	 }

	@Override
	public void save(Immobile immobile, Listing listing) {
	EntityManagerFactory emf = PersistenceUtil.getEntityManagerFactory();
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			em.persist(immobile);
			listing.setUser(em.merge(listing.getUser()));
			listing.setBuilding(em.merge(listing.getBuilding()));
			em.persist(listing);
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
}
