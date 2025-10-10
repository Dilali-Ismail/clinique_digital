package org.clinique_degital.clinique_degital.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

import java.util.UUID;

@Entity
public class Petient {
    @Id
    @GeneratedValue
    private String CIN;




}
