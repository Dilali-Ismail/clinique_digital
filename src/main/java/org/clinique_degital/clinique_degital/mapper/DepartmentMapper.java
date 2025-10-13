package org.clinique_degital.clinique_degital.mapper;

import org.clinique_degital.clinique_degital.dto.DepartmentDTO;
import org.clinique_degital.clinique_degital.model.Department;

public class DepartmentMapper {

    public static DepartmentDTO toDto(Department entity) {
        DepartmentDTO dto = new DepartmentDTO();
        dto.setId(entity.getId());
        dto.setNom(entity.getNom());
        dto.setDescription(entity.getDescription());
        return dto;
    }
    public static Department toEntity(DepartmentDTO dto) {
        Department entity = new Department();
        entity.setId(dto.getId());
        entity.setNom(dto.getNom());
        entity.setDescription(dto.getDescription());
        return entity;
    }
}
