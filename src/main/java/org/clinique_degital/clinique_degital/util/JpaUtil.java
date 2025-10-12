package org.clinique_degital.clinique_degital.util;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;


public class JpaUtil {
    private static EntityManagerFactory emf ;

    static{
     try{
         emf = Persistence.createEntityManagerFactory("cliniquePU");
     }catch (Throwable ex){
         System.err.println("Initial EntityManagerFactory creation failed." + ex);
     }

    }
    public static EntityManagerFactory getEntityManagerFactory(){
        return emf;
    }

}
