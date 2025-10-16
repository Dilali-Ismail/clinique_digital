package org.clinique_degital.clinique_degital.service;

import org.clinique_degital.clinique_degital.dto.AvailabilityDTO;
import org.clinique_degital.clinique_degital.mapper.AvailabilityMapper;
import org.clinique_degital.clinique_degital.model.Availability;
import org.clinique_degital.clinique_degital.model.Doctor;
import org.clinique_degital.clinique_degital.model.enums.AvailabilityStatus;
import org.clinique_degital.clinique_degital.repository.AvailabilityRepository;
import org.clinique_degital.clinique_degital.repository.DoctorRepository;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.Locale;
import java.util.UUID;
import java.util.stream.Collectors;

public class AvailabilityService {

    private static AvailabilityRepository availabilityRepository = new AvailabilityRepository();
    private static DoctorRepository doctorRepository = new DoctorRepository();

    public List<AvailabilityDTO> getAvaillabilityForDoctor(UUID doctorId , LocalDate startDate , LocalDate endDate ){
        return availabilityRepository.findByDoctorId(doctorId,startDate,endDate).stream().map(AvailabilityMapper::toDto).collect(Collectors.toList());
    }

    public void SaveAvailabilty(AvailabilityDTO dto) throws Exception{
;
        LocalTime debut = LocalTime.parse(dto.getHeureDebut());
        LocalTime fin = LocalTime.parse(dto.getHeureFin());

        if(debut.isAfter(fin) || debut.equals(fin)){
            throw new Exception("L'heure de début doit être avant l'heure de fin");
        }

        Doctor doctor = doctorRepository.findByid(dto.getDoctorId()).orElseThrow(() -> new Exception("Docteur non trouvé."));
        Availability availability = new Availability();
        availability.setDoctor(doctor);
        availability.setJour(LocalDate.parse(dto.getJour()));
        availability.setHeureDebut(debut);
        availability.setHeureFin(fin);
        availability.setStatut(AvailabilityStatus.valueOf(dto.getStatut()));
        availabilityRepository.save(availability);
    }

    public void deleteAvailability(UUID availabilityId, UUID doctorId) throws Exception{
        Availability availability = availabilityRepository.findbyid(availabilityId)
                .orElseThrow(() -> new Exception("Disponibilité non trouvée."));

        if (!availability.getDoctor().getId().equals(doctorId)) {
            throw new Exception("Accès non autorisé.");
        }
        availabilityRepository.delete(availability.getId());
    }
}
