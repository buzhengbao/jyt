package com.xwj2001.server.impl;

import com.xwj2001.mapper.OrderMapper;
import com.xwj2001.entity.Order;
import com.xwj2001.server.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
/*
  @author 79837
 */
public class OrderImpl implements OrderService {
    @Autowired
    OrderMapper orderMapper;

    @Override
    public List<Order> findAllOrder() {
        return orderMapper.findAllOrder();
    }


    @Override
    public List<Order> findOrderByName(Order order) {
        return orderMapper.findOrderByName(order);
    }

    @Override
    public List<Order> findOrderByUserName(String userName) {
        return orderMapper.findOrderByUserName(userName);
    }

    @Override
    public List<Order> findOrderByYwc(String userName) {
        return orderMapper.findOrderByYwc(userName);
    }

    @Override
    public List<Order> findOrderByWwc(String userName) {
        return orderMapper.findOrderByWwc(userName);
    }

    @Override
    public int addOrder(Order order) {
        return orderMapper.addOrder(order);
    }

    @Override
    public int updateOrder(Order order) {
        return orderMapper.updateOrder(order);
    }

    @Override
    public int deleteOrderById(int id) {
        return orderMapper.deleteOrderById(id);
    }
}
