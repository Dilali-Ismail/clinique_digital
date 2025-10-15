package org.clinique_degital.clinique_degital.mapper;

import org.clinique_degital.clinique_degital.dto.DoctorDTO;
import org.clinique_degital.clinique_degital.model.Doctor;
import org.clinique_degital.clinique_degital.model.Specialty;
import org.clinique_degital.clinique_degital.model.enums.Role;
import org.clinique_degital.clinique_degital.util.PasswordUtil;

public class DoctorMapper {

    public static DoctorDTO toDto(Doctor entity){
        DoctorDTO dto = new DoctorDTO();
        dto.setId(entity.getId());
        dto.setNom(entity.getNom());
        dto.setEmail(entity.getEmail());
        dto.setMatricule(entity.getMatricule());
        dto.setTitre(entity.getTitre());
        if (entity.getSpecialty() != null) {
            dto.setSpecialtyId(entity.getSpecialty().getId());
            dto.setSpecialtyName(entity.getSpecialty().getNom());
        }

        return dto;
    }

    public static Doctor toEntity(DoctorDTO dto, Specialty specialty){
        Doctor entity = new Doctor();;
        if (dto.getId() != null) {
            entity.setId(dto.getId());
        }else {
            if (dto.getPassword() != null && !dto.getPassword().isEmpty()) {
                entity.setPassword(PasswordUtil.hashPassword(dto.getPassword()));
            }
        }

        entity.setNom(dto.getNom());
        entity.setEmail(dto.getEmail());
        entity.setRole(Role.DOCTOR);
        entity.setActif(true);
        entity.setMatricule(dto.getMatricule());
        entity.setTitre(dto.getTitre());
        entity.setSpecialty(specialty);

        return entity;
    }

}
