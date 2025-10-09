package org.clinique_degital.clinique_degital.repository;

import jakarta.persistence.Embeddable;
import jakarta.persistence.Entity;
import jakarta.persistence.EntityManager;
import org.clinique_degital.clinique_degital.model.User;
import org.clinique_degital.clinique_degital.util.JpaUtil;

import java.util.Optional;

public class UserRepository {


    public void save(User user){
        EntityManager em = JpaUtil.getEntityManagerFactory().createEntityManager();
        em.getTransaction().begin();
        em.persist(user);
        em.getTransaction().commit();
        em.close();
    }

    public Optional<User> findUserByEmail(String email){
        EntityManager em = JpaUtil.getEntityManagerFactory().createEntityManager();
        em.getTransaction().begin();
        try{
            User user = em.createQuery("SELECT u from User u where u.email = :email ",User.class)
                    .setParameter("email",email)
                    .getSingleResult();

            return Optional.of(user);
        }catch(Exception e){

            return Optional.empty();
        }finally {
            em.close();
        }



    }
}