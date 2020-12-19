package com.uc.demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.uc.demo.Entity.GuestEntity;

public interface GuestDao extends JpaRepository<GuestEntity,Integer> {

}
