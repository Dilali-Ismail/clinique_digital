package org.clinique_degital.clinique_degital.mapper;

import org.clinique_degital.clinique_degital.dto.AvailabilityDTO;
import org.clinique_degital.clinique_degital.model.Availability;

public class AvailabilityMapper {
    public static AvailabilityDTO toDto(Availability entity) {
        AvailabilityDTO dto = new AvailabilityDTO();
        dto.setId(entity.getId());
        dto.setJour(entity.getJour().toString());
        dto.setHeureDebut(entity.getHeureDebut().toString()); // LocalTime -> "09:00"
        dto.setHeureFin(entity.getHeureFin().toString());
        dto.setStatut(entity.getStatut().name());
        dto.setDoctorId(entity.getDoctor().getId());
        return dto;
    }
}