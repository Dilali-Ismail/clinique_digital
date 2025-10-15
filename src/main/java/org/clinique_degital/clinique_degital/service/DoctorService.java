package org.clinique_degital.clinique_degital.service;

import org.clinique_degital.clinique_degital.dto.DoctorDTO;
import org.clinique_degital.clinique_degital.mapper.DoctorMapper;
import org.clinique_degital.clinique_degital.model.Doctor;
import org.clinique_degital.clinique_degital.model.Specialty;
import org.clinique_degital.clinique_degital.repository.DoctorRepository;
import org.clinique_degital.clinique_degital.repository.SpecialtyRepository;
import org.clinique_degital.clinique_degital.repository.UserRepository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

public class DoctorService {
    private final DoctorRepository doctorRepository = new DoctorRepository();
    private final SpecialtyRepository specialtyRepository = new SpecialtyRepository();
    private final UserRepository userRepository = new UserRepository();

    public List<DoctorDTO> getAllDoctors() {
        return doctorRepository.findAll().stream().map(DoctorMapper::toDto).collect(Collectors.toList());
    }
    public void saveOrUpdate(DoctorDTO dto) throws Exception {

        Specialty specialty = specialtyRepository.findByid(dto.getSpecialtyId()).orElseThrow(() -> new IllegalArgumentException("Spécialité invalide ID: " + dto.getSpecialtyId()));

        Doctor doctor = DoctorMapper.toEntity(dto, specialty);
        if(doctor.getId() == null){
            if(dto.getId() != null && userRepository.findUserByEmail(dto.getEmail()).isPresent()){
                throw new Exception("Email deja exist ") ;
            }
            doctorRepository.save(doctor);
        }else{
           doctorRepository.update(doctor);
        }

    }

    public Optional<DoctorDTO> findBydId(UUID id){
        return  doctorRepository.findByid(id).map(DoctorMapper::toDto);
    }
    public void deletedoctore(UUID id) {
        doctorRepository.delete(id);
    }
}
