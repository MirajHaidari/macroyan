package com.mcit.macroyan.macroyan.controllers;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.mcit.macroyan.macroyan.entities.Department;
import com.mcit.macroyan.macroyan.entities.Organization;
import com.mcit.macroyan.macroyan.entities.Positions;
import com.mcit.macroyan.macroyan.services.DepartmentService;
import com.mcit.macroyan.macroyan.services.OrganizationService;
import com.mcit.macroyan.macroyan.services.PositionService;


@RestController
public class HomeController {
   

    @GetMapping("/")
    public String sayHello(){
        return "<h1 style='color:red;'>Macroyan Management System</h1>";
    }

    @Autowired
    DepartmentService departmentService;
    @GetMapping("getdepartments")
    public List<Department> getDepartments(){
        return departmentService.getDepartments();    
    }

    @PostMapping("savedepartment")
    public Department saveDepartment(@RequestBody Department department){
        return departmentService.saveDepartment(department);
    }

    @GetMapping("getdepartment") //search department using 

    public Department getDepartment(String depName){
        return departmentService.getDepartment(depName);
    }

    @Autowired
    OrganizationService organizationService;
    @GetMapping("getorganizations")
    public List<Organization> getOrganizations(){
        return organizationService.getOrganizations();
    }
    
    @PostMapping("saveorganization")

    public Organization saveOrganization(@RequestBody Organization organization){
        return organizationService.saveOrganization(organization);
    }

    @GetMapping(path = "getorganization")
    public Organization geOrganization(String organizationName) {
        return organizationService.getOrganization(organizationName);
    }
    

    @Autowired
    PositionService positionService;
    @GetMapping("getpositions")
    public List<Positions> getPositions(){
        return positionService.getPositions();

    }

    @PostMapping("saveposition")
    public Positions savePositions(@RequestBody Positions positions){
        return positionService.savePositions(positions);
    }

    @GetMapping("getposition")
    public Positions gePosition(String positionName){
        return positionService.getPosition(positionName);
    }

}

