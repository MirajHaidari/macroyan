package com.mcit.macroyan.macroyan.repositories;
import org.springframework.data.jpa.repository.JpaRepository;
// import org.springframework.stereotype.Repository;

import com.mcit.macroyan.macroyan.entities.Organization;

// @Repository
public interface OrganizationRepository extends JpaRepository<Organization, Long> {
    Organization findByDescription(String orgName);
}

