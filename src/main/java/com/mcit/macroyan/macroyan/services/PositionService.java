package com.mcit.macroyan.macroyan.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mcit.macroyan.macroyan.entities.Positions;
import com.mcit.macroyan.macroyan.repositories.PositionRepository;

@Service
public class PositionService {
    @Autowired PositionRepository positionRepository;
    public PositionService(){

    }

    public List<Positions> getPositions(){
        return positionRepository.findAll();
    }

    public Positions savePositions(Positions position){
        return positionRepository.save(position);
    } 

    public Positions getPosition(String positionName){
        return positionRepository.findByName(positionName);
    }
}
