import axiosUtils from "@/utils/axiosUtils"
class Img{
    getALL()
    {
        return axiosUtils.get('http://127.0.0.1:2001/api/getImg')
    }
    add(commodityImgUrl,commodityId)
    {
        return axiosUtils.postForm('http://127.0.0.1:2001/api/addImg', {commodityImgUrl:commodityImgUrl,commodityId:commodityId})
    }
    update(commodityImgUrl,commodityImgId)
    {
        return axiosUtils.postForm('http://127.0.0.1:2001/api/updateImg', {commodityImgUrl:commodityImgUrl,commodityImgId:commodityImgId})
    }
    query(commodityName){
        return axiosUtils.postForm('http://127.0.0.1:2001/api/getImgName/', {commodityName:commodityName})
    }
    delete(commodityImgId)
    {
        return axiosUtils.get('http://127.0.0.1:2001/api/deleteImgById/'+commodityImgId)
    }
}

export default new Img();