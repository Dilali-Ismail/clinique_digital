package org.clinique_degital.clinique_degital.model;

import jakarta.persistence.*;
import org.clinique_degital.clinique_degital.model.enums.Sang;

import java.sql.Date;
import java.util.UUID;

@Entity
@PrimaryKeyJoinColumn(name = "user_id")
public class Petient extends User {

    @Column(unique = true, length = 20)
    private String cin;

    @Temporal(TemporalType.DATE)
    private Date naissance;

    @Column(length = 10)
    private String sexe;

    private String adresse;

    @Column(length = 20)
    private String telephone;

    @Column(length = 5)
    private Sang sang;




}
