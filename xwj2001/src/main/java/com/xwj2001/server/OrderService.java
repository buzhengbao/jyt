package com.xwj2001.server;

import com.xwj2001.entity.Order;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 79837
 */
@Service
public interface OrderService {
    public List<Order> findAllOrder();

    public List<Order> findOrderByName(Order order);
    public List<Order> findOrderByUserName(String userName);
    public List<Order> findOrderByYwc(String userName);
    public List<Order> findOrderByWwc(String userName);

    public int addOrder(Order order);

    public int updateOrder(Order order);

    public int deleteOrderById(int id);
}
