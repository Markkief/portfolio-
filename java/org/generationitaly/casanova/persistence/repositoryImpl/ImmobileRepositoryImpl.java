package org.generationitaly.casanova.persistence.repositoryImpl;

import java.util.ArrayList;
import java.util.List;

import org.generationitaly.casanova.persistence.entity.Immobile;
import org.generationitaly.casanova.persistence.entity.SearchImmobileDTO;
import org.generationitaly.casanova.persistence.repository.ImmobileRepository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Join;
import jakarta.persistence.criteria.JoinType;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;

public class ImmobileRepositoryImpl extends JpaRepositoryImpl<Immobile, Long> implements ImmobileRepository {

	private static ImmobileRepositoryImpl instance;

	ImmobileRepositoryImpl() {
		super(Immobile.class);
		// TODO Auto-generated constructor stub
	}

	public static ImmobileRepositoryImpl getInstance() {
		if (instance == null)
			instance = new ImmobileRepositoryImpl();
		return instance;
	}

	@Override
	public List<Immobile> search(SearchImmobileDTO searchImmobile) {
		List<Immobile> immobili = null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			CriteriaBuilder cb = em.getCriteriaBuilder();

			CriteriaQuery<Immobile> query = cb.createQuery(Immobile.class);

			Root<Immobile> root = query.from(Immobile.class);
			//Join<Object, Object> join = root.join("listing", JoinType.INNER);
			//join.get
			List<Predicate> predicates = new ArrayList<>();

			if (searchImmobile.getIdMediazione() != null)
				predicates.add(cb.equal(root.get("listing").get("mediazioneImmobile").get("idMediazione"), searchImmobile.getIdMediazione()));
				
			if (searchImmobile.getIdProvincia() != null)
				predicates.add(cb.equal(root.get("provincia").get("idProvincia"), searchImmobile.getIdProvincia()));

			if (searchImmobile.getIdComune() != null)
				predicates.add(cb.equal(root.get("comune").get("idComune"), searchImmobile.getIdComune()));
			
			if (searchImmobile.getIdTipologia() != null)
				predicates.add(cb.equal(root.get("tipologiaImmobile").get("id"), searchImmobile.getIdTipologia()));

			if (searchImmobile.getIdStatoImmobile() != null)
				predicates.add(cb.equal(root.get("listing").get("statoImmobile").get("idStatoImmobile"),searchImmobile.getIdStatoImmobile()));

			if (searchImmobile.getPrezzoMin() != null)
				predicates.add(cb.greaterThanOrEqualTo(root.get("listing").get("prezzo"), searchImmobile.getPrezzoMin()));

			if (searchImmobile.getPrezzoMax() != null)
				predicates.add(cb.greaterThanOrEqualTo(root.get("listing").get("prezzo"), searchImmobile.getPrezzoMin()));

			if (searchImmobile.getSuperficieMin() != null)
				predicates.add(cb.greaterThanOrEqualTo(root.get("superficie"), searchImmobile.getSuperficieMin()));

			if (searchImmobile.getSuperficieMax() != null)
				predicates.add(cb.lessThanOrEqualTo(root.get("superficie"), searchImmobile.getSuperficieMax()));

			query.select(root).where(cb.and(predicates.toArray(new Predicate[0])));

			immobili = em.createQuery(query).getResultList();
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive())
				tx.rollback();
		} finally {
			if (em != null)
				em.close();

		}
		return immobili;
	}
}
