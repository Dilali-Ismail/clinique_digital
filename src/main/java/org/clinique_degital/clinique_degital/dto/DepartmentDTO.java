package org.clinique_degital.clinique_degital.dto;

import java.lang.reflect.Constructor;
import java.util.UUID;

public class DepartmentDTO {
    private UUID id;
    private String nom;
    private String description;

    public  DepartmentDTO(){

    }

    public DepartmentDTO( String nom, String description) {
        this.nom = nom;
        this.description = description;
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
