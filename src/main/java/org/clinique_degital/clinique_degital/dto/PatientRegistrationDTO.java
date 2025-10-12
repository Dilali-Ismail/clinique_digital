package org.clinique_degital.clinique_degital.dto;

import org.clinique_degital.clinique_degital.model.enums.Sang;

import java.util.Date;

public class PatientRegistrationDTO {

    private String  nom;
    private String email ;
    private String cin;
    private Date naissance;
    private String sexe;
    private String adresse;
    private String telephone;
    private Sang sang;
    private String password ;


    public PatientRegistrationDTO(){

    }
    public PatientRegistrationDTO(String nom , String email , String password , String adresse , String telephone , Sang sang ){
       this.nom = nom;
       this.email = email;
       this.password = password ;
       this.adresse = adresse;
       this.telephone = telephone;
       this.sang = sang ;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

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
