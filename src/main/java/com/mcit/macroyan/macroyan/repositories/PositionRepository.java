package com.mcit.macroyan.macroyan.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
// import org.springframework.stereotype.Repository;

import com.mcit.macroyan.macroyan.entities.Positions;

// @Repository
public interface PositionRepository extends JpaRepository<Positions, Long>{
     Positions findByName(String name);
}
