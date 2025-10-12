package org.clinique_degital.clinique_degital.model;

import jakarta.persistence.*;
import org.clinique_degital.clinique_degital.model.enums.Sang;

import java.util.Date;

@Entity
@PrimaryKeyJoinColumn(name = "user_id")
public class Patient extends User {

    @Column(unique = true, length = 20)
    private String cin;

    @Temporal(TemporalType.DATE)
    private Date naissance;

    @Column(length = 10)
    private String sexe;

    private String adresse;

    @Column(length = 20)
    private String telephone;

    @Enumerated(EnumType.STRING)
    @Column(length = 20)
    private Sang sang;

    public String getCin() {
        return cin;
    }

    public void setCin(String cin) {
        this.cin = cin;
    }

    public Date getNaissance() {
        return naissance;
    }

    public void setNaissance(Date naissance) {
        this.naissance = naissance;
    }

    public String getSexe() {
        return sexe;
    }

    public void setSexe(String sexe) {
        this.sexe = sexe;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public Sang getSang() {
        return sang;
    }

    public void setSang(Sang sang) {
        this.sang = sang;
    }
}

