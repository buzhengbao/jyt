import axiosUtils from "@/utils/axiosUtils"

class Order {
    getALL() {
        return axiosUtils.get('http://127.0.0.1:2001/api/getOrder')
    }

    add(OrderNum, userId, commodityId, client, tel, num, addTime) {
        return axiosUtils.postForm('http://127.0.0.1:2001/api/addOrder', {
            OrderNum: OrderNum,
            userId: userId,
            commodityId: commodityId,
            client: client,
            tel: tel,
            num: num,
            addTime:addTime
        })
    }

    update(OrderId, userId,commodityId, client, tel, num, orderStateId) {
        return axiosUtils.postForm('http://127.0.0.1:2001/api/updateOrder', {
            OrderId: OrderId,
            userId: userId,
            commodityId: commodityId,
            client: client,
            tel: tel,
            num: num,
            orderStateId:orderStateId
        })
    }
    query(orderNum,addTime) {
        return axiosUtils.postForm('http://127.0.0.1:2001/api/getOrderName/', {
            orderNum: orderNum,
            addTime:addTime
        })
    }

    delete(OrderId) {
        return axiosUtils.get('http://127.0.0.1:2001/api/deleteOrderById/' + OrderId)
    }
}

export default new Order();