package com.mcit.macroyan.macroyan.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mcit.macroyan.macroyan.entities.Department;
import com.mcit.macroyan.macroyan.repositories.DepartmentRepository;

@Service
public class DepartmentService {
    
    @Autowired DepartmentRepository departmentRepository;
    
    public DepartmentService(){
        
    }

    public List<Department> getDepartments(){
        return departmentRepository.findAll();
    }

    public Department saveDepartment(Department department) {
        return departmentRepository.save(department);
    }

    public Department getDepartment(String depName) {
        // return departmentRepository.findByName(depName);
        return departmentRepository.findByName(depName);
    }
    
}
