package com.xwj2001.mapper;

import com.xwj2001.entity.Order;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author 79837
 */
@Repository
@Mapper
public interface OrderMapper {
    public List<Order> findAllOrder();

    public List<Order> findOrderByName(Order order);
    public List<Order> findOrderByUserName(String userName);
    public List<Order> findOrderByYwc(String userName);
    public List<Order> findOrderByWwc(String userName);

    public int addOrder(Order order);

    public int updateOrder(Order order);

    public int deleteOrderById(int id);
}
