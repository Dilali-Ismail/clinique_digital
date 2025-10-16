package org.clinique_degital.clinique_degital.repository;

import jakarta.persistence.Entity;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import org.clinique_degital.clinique_degital.model.Availability;
import org.clinique_degital.clinique_degital.model.Department;
import org.clinique_degital.clinique_degital.model.Specialty;
import org.clinique_degital.clinique_degital.util.JpaUtil;

import javax.management.AttributeValueExp;
import java.nio.file.attribute.AttributeView;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

public class AvailabilityRepository {

    public List<Availability> findByDoctorId(UUID doctorId, LocalDate startDate, LocalDate endDate){
        EntityManager entityManager = JpaUtil.getEntityManagerFactory().createEntityManager();

        try{
          return  entityManager.createQuery("SELECT a FROM Availability a where a.doctor.id = :doctorId AND a.jour BETWEEN :startDate AND :endDate ORDER BY a.heureDebut",Availability.class)
                    .setParameter("doctorId",doctorId)
                    .setParameter("startDate", startDate)
                   .setParameter("endDate", endDate).getResultList();
        }finally {
            entityManager.close();
        }
    }

    public void save(Availability availability) {
        EntityManager em = JpaUtil.getEntityManagerFactory().createEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(availability);
            tx.commit();
        } finally {
            if (tx.isActive()) tx.rollback();
            em.close();
        }
    }

    public void update(Availability availability) {
        EntityManager em = JpaUtil.getEntityManagerFactory().createEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.merge(availability);
            tx.commit();
        } finally {
            if (tx.isActive()) tx.rollback();
            em.close();
        }
    }

    public Optional<Availability> findbyid(UUID id){
        EntityManager entityManager = JpaUtil.getEntityManagerFactory().createEntityManager();
        try{
            Availability availability = entityManager.find(Availability.class,id);
            return Optional.ofNullable(availability);
        }finally {
            entityManager.close();
        }
    }

    public void delete(UUID id){
        EntityManager entityManager = JpaUtil.getEntityManagerFactory().createEntityManager();
        try{
            entityManager.getTransaction().begin();
            Availability availabilityTodelete = entityManager.find(Availability.class, id);

            if (availabilityTodelete != null) {
                entityManager.remove(availabilityTodelete);
            }

            entityManager.getTransaction().commit();
        }finally {
            entityManager.close();
        }
    }
}
