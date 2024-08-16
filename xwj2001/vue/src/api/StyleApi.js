import axiosUtils from "@/utils/axiosUtils"
class Style{
    getALL()
    {
        return axiosUtils.get('http://127.0.0.1:2001/api/getStyle')
    }
    add(commodityStyleName,commodityStyleImgUrl,commodityStyleAddTime)
    {
        return axiosUtils.postForm('http://127.0.0.1:2001/api/api/addStyle', {commodityStyleName:commodityStyleName,commodityStyleImgUrl:commodityStyleImgUrl,commodityStyleAddTime:commodityStyleAddTime})
    }
    update(commodityStyleId,commodityStyleName,commodityStyleImgUrl)
    {
        return axiosUtils.postForm('http://127.0.0.1:2001/api/updateStyle', {commodityStyleId:commodityStyleId,commodityStyleName:commodityStyleName,commodityStyleImgUrl:commodityStyleImgUrl})
    }
    query(commodityStyleName){
        return axiosUtils.postForm('http://127.0.0.1:2001/api/getStyleName/', {commodityStyleName:commodityStyleName})
    }
    delete(commodityStyleId)
    {
        return axiosUtils.get('http://127.0.0.1:2001/api/deleteStyleById/'+commodityStyleId)
    }
}

export default new Style();