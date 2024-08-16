import axiosUtils from "@/utils/axiosUtils"
class Tag{
    getALL()
    {
        return axiosUtils.get('http://127.0.0.1:2001/api/getTag')
    }
    add(commodityTagName,commodityTagColor)
    {
        return axiosUtils.postForm('http://127.0.0.1:2001/api/addTag', {commodityTagName:commodityTagName,commodityTagColor:commodityTagColor})
    }
    update(commodityTagId,commodityTagName,commodityTagColor)
    {
        return axiosUtils.postForm('http://127.0.0.1:2001/api/updateTag', {commodityTagId:commodityTagId,commodityTagName:commodityTagName,commodityTagColor:commodityTagColor})
    }
    query(commodityTagName,commodityTagColor){
        return axiosUtils.postForm('http://127.0.0.1:2001/api/getTagName/', {commodityTagName:commodityTagName,commodityTagColor:commodityTagColor})
    }
    delete(commodityTagId)
    {
        return axiosUtils.get('http://127.0.0.1:2001/api/deleteTagById/'+commodityTagId)
    }
}

export default new Tag();