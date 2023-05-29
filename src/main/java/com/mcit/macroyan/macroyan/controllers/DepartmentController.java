// package com.mcit.macroyan.macroyan.controllers;

// import java.util.List;

// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.web.bind.annotation.GetMapping;
// import org.springframework.web.bind.annotation.PostMapping;
// import org.springframework.web.bind.annotation.RequestBody;
// import org.springframework.web.bind.annotation.RestController;

// import com.mcit.macroyan.macroyan.entities.Department;
// import com.mcit.macroyan.macroyan.services.DepartmentService;

// @RestController
// public class DepartmentController {
//     @Autowired
//     DepartmentService departmentService;
//     @GetMapping("getdepartments")
//     public List<Department> getDepartments(){
//         return departmentService.getDepartments();    
//     }

//     @PostMapping("savedepartment")
//     public Department saveDepartment(@RequestBody Department department){
//         return departmentService.saveDepartment(department);
//     }

//     @GetMapping("getdepartment") //search department using 

//     public Department getDepartment(String depName){
//         return departmentService.getDepartment(depName);
//     }
    
// }
