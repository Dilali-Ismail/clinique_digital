package org.clinique_degital.clinique_degital.dto;

import java.util.UUID;

public class SpecialtyDTO {
    private UUID id;
    private String nom;
    private String description;
    private UUID departmentId;
    private String departmentName;

    public SpecialtyDTO(){

    }
    public SpecialtyDTO(UUID id, String nom, String description, UUID departmentId, String departmentName) {
        this.id = id;
        this.nom = nom;
        this.description = description;
        this.departmentId = departmentId;
        this.departmentName = departmentName;
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

    public UUID getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(UUID departmentId) {
        this.departmentId = departmentId;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }
}
