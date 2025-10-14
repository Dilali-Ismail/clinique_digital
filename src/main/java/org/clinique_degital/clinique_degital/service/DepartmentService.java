package org.clinique_degital.clinique_degital.service;

import org.clinique_degital.clinique_degital.dto.DepartmentDTO;
import org.clinique_degital.clinique_degital.mapper.DepartmentMapper;
import org.clinique_degital.clinique_degital.model.Department;
import org.clinique_degital.clinique_degital.repository.DepartmentRepository;
import org.eclipse.tags.shaded.org.apache.bcel.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

public class DepartmentService {
    private final DepartmentRepository repository = new DepartmentRepository();

    public List<DepartmentDTO> allDeparetments(){
      return  repository.findAll().stream().map(DepartmentMapper::toDto).collect(Collectors.toList());
    }

    public void saveOrUpdate(DepartmentDTO dto) {
            Department department = DepartmentMapper.toEntity(dto);
            if(department.getId() == null){
                repository.save(department);
            }else{
                repository.update(department);
            }
    }
    public Optional<DepartmentDTO> findBydId(UUID id){
      return  repository.findbyid(id).map(DepartmentMapper::toDto);
    }
    public void deleteDepartment(UUID id) {
        repository.delete(id);
    }

}
