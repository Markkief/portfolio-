package org.generationitaly.casanova.persistence.repositoryImpl;

import java.util.List;

import org.generationitaly.casanova.persistence.repository.JpaRepository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

public class JpaRepositoryImpl<T, PK> implements JpaRepository<T, PK>{

	protected final EntityManagerFactory emf = PersistenceUtil.getEntityManagerFactory();
	protected final Class<T> entityClass;
	protected final String entityName;

	JpaRepositoryImpl(Class<T> entityClass) {
		super();
		this.entityClass = entityClass;
		this.entityName = entityClass.getSimpleName();
	}

	@Override
	public void save(T entity) {
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			em.persist(entity);
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

	@Override
	public void update(T entity) {
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			em.merge(entity);
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

	@Override
	public void delete(T entity) {
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			T mergedEntity = em.merge(entity);
			em.remove(mergedEntity);
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

	@Override
	public void deleteById(PK primaryKey) {
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			T entity = em.find(entityClass, primaryKey);
			if (entity != null)
				em.remove(entity);
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

	@Override
	public T findById(PK primaryKey) {
		T entity = null;
		EntityManager em = null;
		try {
			em = emf.createEntityManager();
			entity = em.find(entityClass, primaryKey);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		} finally {
			if (em != null)
				em.close();
		}
		return entity;
	}

	@Override
	public List<T> findAll() {
		List<T> entities = null;
		EntityManager em = null;
		try {
			em = emf.createEntityManager();
			entities = em.createQuery("FROM " + entityName, entityClass).getResultList();
		} catch (Exception e) {
			System.err.println(e.getMessage());
		} finally {
			if (em != null)
				em.close();
		}
		return entities;
	}


}
