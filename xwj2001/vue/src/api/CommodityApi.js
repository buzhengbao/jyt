import axiosUtils from "@/utils/axiosUtils"

class Commodity {
    getALL() {
        return axiosUtils.get('http://127.0.0.1:2001/api/getCommodity')
    }

    add(commodityNum, commodityName, commodityUrl, commodityPrice, commodityFineness, commodityWeight, commodityInventory, commodityWage, commodityTagId, commodityTypeId, commodityStyleId, commodityActivityId, commodityAddTime) {
        return axiosUtils.postForm('http://127.0.0.1:2001/api/addCommodity', {
            commodityNum: commodityNum,
            commodityName: commodityName,
            commodityUrl: commodityUrl,
            commodityPrice: commodityPrice,
            commodityFineness: commodityFineness,
            commodityWeight: commodityWeight,
            commodityInventory: commodityInventory,
            commodityWage: commodityWage,
            commodityTagId: commodityTagId,
            commodityTypeId: commodityTypeId,
            commodityStyleId: commodityStyleId,
            commodityActivityId: commodityActivityId,
            commodityAddTime: commodityAddTime
        })
    }

    update(commodityId, commodityNum, commodityName,commodityUrl, commodityPrice, commodityFineness, commodityWeight, commodityInventory, commodityWage, commodityTagId, commodityTypeId, commodityStyleId, commodityActivityId) {
        return axiosUtils.postForm('http://127.0.0.1:2001/api/updateCommodity', {
            commodityId: commodityId,
            commodityNum: commodityNum,
            commodityName: commodityName,
            commodityUrl: commodityUrl,
            commodityPrice: commodityPrice,
            commodityFineness: commodityFineness,
            commodityWeight: commodityWeight,
            commodityInventory: commodityInventory,
            commodityWage: commodityWage,
            commodityTagId: commodityTagId,
            commodityTypeId: commodityTypeId,
            commodityStyleId: commodityStyleId,
            commodityActivityId: commodityActivityId
        })
    }

    queryByStyle(commodityStyleId) {
        return axiosUtils.postForm('http://127.0.0.1:2001/api/getCommodityName/', {
            commodityStyleId: commodityStyleId
        })
    }

    queryByType(commodityTypeId) {
        return axiosUtils.postForm('http://127.0.0.1:2001/api/getCommodityName/', {
            commodityTypeId: commodityTypeId
        })
    }

    queryByTag(commodityTagId) {
        return axiosUtils.postForm('http://127.0.0.1:2001/api/getCommodityName/', {
            commodityTagId: commodityTagId
        })
    }

    queryByActivity(commodityActivityId) {
        return axiosUtils.postForm('http://127.0.0.1:2001/api/getCommodityName/', {
            commodityActivityId: commodityActivityId
        })
    }
    queryByNum(commodityNum) {
        return axiosUtils.postForm('http://127.0.0.1:2001/api/getCommodityName/', {
            commodityNum: commodityNum
        })
    }

    delete(commodityId) {
        return axiosUtils.get('http://127.0.0.1:2001/api/deleteCommodityById/' + commodityId)
    }
}

export default new Commodity();