import axiosUtils from "@/utils/axiosUtils"
class Type{
    getALL()
    {
        return axiosUtils.get('http://127.0.0.1:2001/api/getType')
    }
    add(commodityTypeName,commodityTypeImgUrl,commodityTypeAddTime)
    {
        return axiosUtils.postForm('http://127.0.0.1:2001/api/addType', {commodityTypeName:commodityTypeName,commodityTypeImgUrl:commodityTypeImgUrl,commodityTypeAddTime:commodityTypeAddTime})
    }
    update(commodityTypeId,commodityTypeName,commodityTypeImgUrl)
    {
        return axiosUtils.postForm('http://127.0.0.1:2001/api/updateType', {commodityTypeId:commodityTypeId,commodityTypeName:commodityTypeName,commodityTypeImgUrl:commodityTypeImgUrl})
    }
    query(commodityTypeName){
        return axiosUtils.postForm('http://127.0.0.1:2001/api/getTypeName/', {commodityTypeName:commodityTypeName})
    }
    delete(commodityTypeId)
    {
        return axiosUtils.get('http://127.0.0.1:2001/api/deleteTypeById/'+commodityTypeId)
    }
}

export default new Type();