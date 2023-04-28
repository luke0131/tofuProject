package com.group3.tofu.gift.model.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.group3.tofu.gift.model.bean.Gift;

public interface GiftDAO extends JpaRepository<Gift, Integer> {

}
