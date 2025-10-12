package org.clinique_degital.clinique_degital.mapper;

import org.clinique_degital.clinique_degital.dto.PatientRegistrationDTO;
import org.clinique_degital.clinique_degital.model.Patient;
import org.clinique_degital.clinique_degital.model.User;
import org.clinique_degital.clinique_degital.model.enums.Role;
import org.eclipse.tags.shaded.org.apache.xalan.transformer.DecimalToRoman;

public class UserMapper {

    public static Patient fromdtoToEntity(PatientRegistrationDTO dto){
        Patient patient = new Patient();
        patient.setNom(dto.getNom());
        patient.setEmail(dto.getEmail());
        patient.setRole(Role.PATIENT);
        patient.setActif(true);
        patient.setCin(dto.getCin());
        patient.setAdresse(dto.getAdresse());
        patient.setNaissance(dto.getNaissance());
        patient.setSexe(dto.getSexe());
        patient.setSang(dto.getSang());
        patient.setTelephone(dto.getTelephone());
        return patient;
    }

}
