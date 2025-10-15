package org.clinique_degital.clinique_degital.mapper;

import org.clinique_degital.clinique_degital.dto.SpecialtyDTO;
import org.clinique_degital.clinique_degital.model.Department;
import org.clinique_degital.clinique_degital.model.Specialty;

public class SpecialityMapper {

    public static SpecialtyDTO toDto(Specialty entity) {
        if (entity == null) return null;
        SpecialtyDTO dto = new SpecialtyDTO();
        dto.setId(entity.getId());
        dto.setNom(entity.getNom());
        dto.setDescription(entity.getDescription());
        if (entity.getDepartment() != null) {
            dto.setDepartmentId(entity.getDepartment().getId());
            dto.setDepartmentName(entity.getDepartment().getNom());
        }
        return dto;
    }
    public static Specialty toEntity(SpecialtyDTO dto, Department department) {
        Specialty entity = new Specialty();
        entity.setId(dto.getId());
        entity.setNom(dto.getNom());
        entity.setDescription(dto.getDescription());
        entity.setDepartment(department);
        return entity;
    }

}
