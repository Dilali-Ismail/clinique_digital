package org.clinique_degital.clinique_degital.repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import org.clinique_degital.clinique_degital.model.Department;
import org.clinique_degital.clinique_degital.util.JpaUtil;

import java.util.List;

public class DepartmentRepository {
    public List<Department> findAll(){
        EntityManager entityManager = JpaUtil.getEntityManagerFactory().createEntityManager();
        try{
            return entityManager.createQuery("SELECT d FROM Department d ORDER BY d.nom", Department.class).getResultList();
        }finally {
             entityManager.close();
        }
    }
    public void save(Department department) {
        EntityManager em = JpaUtil.getEntityManagerFactory().createEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(department);
            tx.commit();
        } finally {
            if (tx.isActive()) tx.rollback();
            em.close();
        }
    }




   }
