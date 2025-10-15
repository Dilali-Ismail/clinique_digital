package org.clinique_degital.clinique_degital.service;

import org.clinique_degital.clinique_degital.dto.SpecialtyDTO;
import org.clinique_degital.clinique_degital.mapper.SpecialityMapper;
import org.clinique_degital.clinique_degital.model.Department;
import org.clinique_degital.clinique_degital.model.Specialty;
import org.clinique_degital.clinique_degital.repository.DepartmentRepository;
import org.clinique_degital.clinique_degital.repository.SpecialtyRepository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

public class SpecialityService {

    SpecialtyRepository specialtyRepository = new SpecialtyRepository();
    DepartmentRepository departmentRepository = new DepartmentRepository();

    public List<SpecialtyDTO> AllSpecialities(){
        return specialtyRepository.findAll().stream().map(SpecialityMapper::toDto).collect(Collectors.toList());
    }

    public void SaveOrUpdate(SpecialtyDTO specialitydto){
        Department department = departmentRepository.findbyid(specialitydto.getDepartmentId()).orElseThrow(() -> new IllegalArgumentException("Département invalide ID: " + specialitydto.getDepartmentId()));
        Specialty specialty = SpecialityMapper.toEntity(specialitydto,department);

        if(specialty.getId() == null){
            specialtyRepository.save(specialty);
        }else{
            specialtyRepository.update(specialty);
        }
    }
    public Optional<SpecialtyDTO> findBydId(UUID id){
        return  specialtyRepository.findByid(id).map(SpecialityMapper::toDto);
    }
    public void deleteSpeciality(UUID id) {
        specialtyRepository.delete(id);
    }




}