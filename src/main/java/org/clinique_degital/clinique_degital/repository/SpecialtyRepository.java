package org.clinique_degital.clinique_degital.repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import org.clinique_degital.clinique_degital.model.Speciality;
import org.clinique_degital.clinique_degital.util.JpaUtil;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public class SpecialtyRepository {
    public List<Speciality> findAll() {
        EntityManager em = JpaUtil.getEntityManagerFactory().createEntityManager();
        try {
            // OPTIMISATION : Charger le département en même temps pour éviter des requêtes multiples plus tard
            return em.createQuery("SELECT s FROM Speciality s LEFT JOIN FETCH s.department ORDER BY s.nom", Speciality.class).getResultList();
        } finally {
            em.close();
        }
    }

    public void save(Speciality specialty) {
        EntityManager em = JpaUtil.getEntityManagerFactory().createEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(specialty);
            tx.commit();
        } finally {
            if (tx.isActive()) tx.rollback();
            em.close();
        }
    }

    public void update(Speciality specialty) {
        EntityManager em = JpaUtil.getEntityManagerFactory().createEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.merge(specialty);
            tx.commit();
        } finally {
            if (tx.isActive()) tx.rollback();
            em.close();
        }
    }

    public Optional<Speciality> findByid(UUID id){
        EntityManager entityManager = JpaUtil.getEntityManagerFactory().createEntityManager();
        try{
            Speciality specialty = entityManager.createQuery(
                            "SELECT s FROM Speciality s LEFT JOIN FETCH s.department WHERE s.id = :id",
                            Speciality.class)
                    .setParameter("id", id)
                    .getSingleResult();
           return Optional.of(specialty);
        }finally {
            entityManager.close();
        }
    }

    public void delete(UUID id){
        EntityManager entityManager = JpaUtil.getEntityManagerFactory().createEntityManager();
        try{
            entityManager.getTransaction().begin();
            Speciality specialityToDelete = entityManager.find(Speciality.class, id);

            if (specialityToDelete != null) {
                entityManager.remove(specialityToDelete);
            }

            entityManager.getTransaction().commit();
        }finally {
            entityManager.close();
        }
    }
}
