package org.generationitaly.casanova.persistence.repositoryImpl;

import org.generationitaly.casanova.persistence.entity.User;
import org.generationitaly.casanova.persistence.repository.UserRepository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.TypedQuery;

/**
 * Singleton implementation of the User repository
 * 
 * @author Redi Levendi
 * @version 0.1 Initial Version
 */
public class UserRepositoryImpl extends JpaRepositoryImpl<User, Long> implements UserRepository{
    private static UserRepositoryImpl instance;
    private EntityManagerFactory emf = PersistenceUtil.getEntityManagerFactory();

    private UserRepositoryImpl() {
        super(User.class);
    }

    public static UserRepositoryImpl getInstance() {
        if (instance == null) instance = new UserRepositoryImpl();
        return instance;
    }

    @Override
    public User findByUsername(String username) {
        User user = null;
        EntityManager em = null;

        try {
            em = emf.createEntityManager();
            TypedQuery<User> query = em.createQuery("FROM User WHERE username = :username", User.class);
            query.setParameter("username", username);
            user = query.getSingleResult();
        } catch (Exception e ) {
            System.err.println(e.getMessage());
        } finally {
            if (em != null) em.close();
        }
        return user;
    }

    
}
