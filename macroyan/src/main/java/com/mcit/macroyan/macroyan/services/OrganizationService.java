package com.mcit.macroyan.macroyan.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mcit.macroyan.macroyan.entities.Organization;
import com.mcit.macroyan.macroyan.repositories.OrganizationRepository;

@Service
public class OrganizationService {
    @Autowired OrganizationRepository organizationRepository;

    public OrganizationService(){
       
    }

    public List<Organization> getOrganizations() {
        return organizationRepository.findAll();
    }

    public Organization saveOrganization(Organization organization){
        return organizationRepository.save(organization);
    }

    public Organization getOrganization(String orgName){
        return organizationRepository.findByDescription(orgName);
    }
    
}
