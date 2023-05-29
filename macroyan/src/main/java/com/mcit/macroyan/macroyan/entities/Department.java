package com.mcit.macroyan.macroyan.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;

@Entity
@Table(name = "departments")
public class Department {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "dep_id")
    @JsonIgnore  //it use when we want to don't display the field
    private Long id;
    @Column(name = "department_name", columnDefinition = "CHARACTER VARYING(64) NOT NULL DEFAULT 'NA' ")
    private String name;
    @Column(name = "department_description")
    private String description;
    // @Column(name = "organization_fkid")
    // private Long orgId;
    @Transient          //it will not create this field in table
    private int total_department;

    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    // public Long getOrgId() {
    //     return orgId;
    // }
    // public void setOrgId(Long orgId) {
    //     this.orgId = orgId;
    // }

}
