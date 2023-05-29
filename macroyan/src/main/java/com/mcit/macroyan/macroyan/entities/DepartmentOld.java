// package com.mcit.macroyan.macroyan.entities;

// import jakarta.persistence.Column;
// import jakarta.persistence.Entity;
// import jakarta.persistence.GeneratedValue;
// import jakarta.persistence.GenerationType;
// import jakarta.persistence.Id;
// import jakarta.persistence.Table;

// @Entity
// @Table(name = "departments")
// public class DepartmentOld {
//     @Id
//     @GeneratedValue(strategy = GenerationType.IDENTITY)
//     @Column(name = "departmentid")
//     private Long id;
//     @Column(name = "departmentname")
//     private String name;
//     @Column(name = "departmentdescription")
//     private String description;
//     @Column(name = "organizationfkid")
//     private Long orgId;

//     public Long getId() {
//         return id;
//     }
//     public void setId(Long id) {
//         this.id = id;
//     }
//     public String getName() {
//         return name;
//     }
//     public void setName(String name) {
//         this.name = name;
//     }
//     public String getDescription() {
//         return description;
//     }
//     public void setDescription(String description) {
//         this.description = description;
//     }
//     public Long getOrgId() {
//         return orgId;
//     }
//     public void setOrgId(Long orgId) {
//         this.orgId = orgId;
//     }

// }
