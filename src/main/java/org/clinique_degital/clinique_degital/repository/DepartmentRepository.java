package org.clinique_degital.clinique_degital.repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import org.clinique_degital.clinique_degital.model.Department;
import org.clinique_degital.clinique_degital.util.JpaUtil;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

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
    public Optional<Department> findbyid(UUID id){
        EntityManager entityManager = JpaUtil.getEntityManagerFactory().createEntityManager();
        try{
            Department department = entityManager.find(Department.class,id);
            return Optional.ofNullable(department);
        }finally {
            entityManager.close();
        }
    }

    public void update(Department departement){
        EntityManager entityManager = JpaUtil.getEntityManagerFactory().createEntityManager();
        try{
            entityManager.getTransaction().begin();
            entityManager.merge(departement);
            entityManager.getTransaction().commit();
        }finally {
            entityManager.close();
        }
    }

    public void delete(UUID id){
        EntityManager entityManager = JpaUtil.getEntityManagerFactory().createEntityManager();
        try{
            entityManager.getTransaction().begin();
            Department departmentToDelete = entityManager.find(Department.class, id);

            if (departmentToDelete != null) {
                entityManager.remove(departmentToDelete);
            }

            entityManager.getTransaction().commit();
        }finally {
            entityManager.close();
        }
    }




   }
