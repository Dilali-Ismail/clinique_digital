package org.clinique_degital.clinique_degital.service;

import org.clinique_degital.clinique_degital.dto.DepartmentDTO;
import org.clinique_degital.clinique_degital.mapper.DepartmentMapper;
import org.clinique_degital.clinique_degital.model.Department;
import org.clinique_degital.clinique_degital.repository.DepartmentRepository;
import org.eclipse.tags.shaded.org.apache.bcel.Repository;

import java.util.List;
import java.util.stream.Collectors;

public class DepartmentService {
    private final DepartmentRepository repository = new DepartmentRepository();

    public List<DepartmentDTO> allDeparetments(){
        DepartmentRepository departmentRepository = new DepartmentRepository();
      return  departmentRepository.findAll().stream().map(DepartmentMapper::toDto).collect(Collectors.toList());
    }

    public void saveOrUpdate(DepartmentDTO dto) {
        Department department = DepartmentMapper.toEntity(dto);
            repository.save(department);
        }

}
