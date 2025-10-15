package org.clinique_degital.clinique_degital.repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import org.clinique_degital.clinique_degital.model.Doctor;
import org.clinique_degital.clinique_degital.model.Specialty;
import org.clinique_degital.clinique_degital.util.JpaUtil;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public class DoctorRepository {
    public List<Doctor> findAll(){
        EntityManager em = JpaUtil.getEntityManagerFactory().createEntityManager();
        try{
          return  em.createQuery("SELECT d from Doctor d LEFT JOIN FETCH d.specialty ORDER BY d.nom").getResultList();
        }finally {
            em.close();
        }
    }
    public void save(Doctor doctor) {
        EntityManager em = JpaUtil.getEntityManagerFactory().createEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(doctor);
            tx.commit();
        } finally {
            if (tx.isActive()) tx.rollback();
            em.close();
        }
    }

    public void update(Doctor doctor) {
        EntityManager em = JpaUtil.getEntityManagerFactory().createEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.merge(doctor);
            tx.commit();
        } finally {
            if (tx.isActive()) tx.rollback();
            em.close();
        }
    }

    public Optional<Doctor> findByid(UUID id){
        EntityManager entityManager = JpaUtil.getEntityManagerFactory().createEntityManager();
        try{
            Doctor doctor = entityManager.createQuery(
                            "SELECT d FROM Doctor d LEFT JOIN FETCH d.specialty WHERE d.id = :id",
                            Doctor.class)
                    .setParameter("id", id).getSingleResult();
            return Optional.of(doctor);
        }finally {
            entityManager.close();
        }
    }

    public void delete(UUID id){
        EntityManager entityManager = JpaUtil.getEntityManagerFactory().createEntityManager();
        try{
            entityManager.getTransaction().begin();
            Doctor specialityToDelete = entityManager.find(Doctor.class, id);

            if (specialityToDelete != null) {
                entityManager.remove(specialityToDelete);
            }

            entityManager.getTransaction().commit();
        }finally {
            entityManager.close();
        }
    }



}
